from os.path import isdir, join
from platform import system

from setuptools import Extension, find_packages, setup
from setuptools.command.build import build
from wheel.bdist_wheel import bdist_wheel


class Build(build):
    def run(self):
        if isdir("queries"):
            dest = join(self.build_lib, "tree_sitter_lobster", "queries")
            self.copy_tree("queries", dest)
        super().run()


class BdistWheel(bdist_wheel):
    def get_tag(self):
        lobster, abi, platform = super().get_tag()
        if lobster.startswith("cp"):
            lobster, abi = "cp38", "abi3"
        return lobster, abi, platform


setup(
    packages=find_packages("bindings/lobster"),
    package_dir={"": "bindings/lobster"},
    package_data={
        "tree_sitter_lobster": ["*.pyi", "py.typed"],
        "tree_sitter_lobster.queries": ["*.scm"],
    },
    ext_package="tree_sitter_lobster",
    ext_modules=[
        Extension(
            name="_binding",
            sources=[
                "bindings/lobster/tree_sitter_lobster/binding.c",
                "src/parser.c",
                "src/scanner.c",
            ],
            extra_compile_args=(
                ["-std=c11"] if system() != 'Windows' else []
            ),
            define_macros=[
                ("Py_LIMITED_API", "0x03080000"),
                ("PY_SSIZE_T_CLEAN", None)
            ],
            include_dirs=["src"],
            py_limited_api=True,
        )
    ],
    cmdclass={
        "build": Build,
        "bdist_wheel": BdistWheel
    },
    zip_safe=False,
)
