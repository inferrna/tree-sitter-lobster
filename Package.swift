// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TreeSitterLobster",
    platforms: [.macOS(.v10_13), .iOS(.v11)],
    products: [
        .library(name: "TreeSitterLobster", targets: ["TreeSitterLobster"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "TreeSitterLobster",
                path: ".",
                exclude: [
                    "Cargo.toml",
                    "Makefile",
                    "binding.gyp",
                    "bindings/c",
                    "bindings/go",
                    "bindings/node",
                    "bindings/lobster",
                    "bindings/rust",
                    "examples",
                    "grammar.js",
                    "package.json",
                    "package-lock.json",
                    "pyproject.toml",
                    "setup.py",
                    "test",
                    "types",
                    ".editorconfig",
                    ".github",
                    ".gitignore",
                    ".gitattributes",
                ],
                sources: [
                    "src/parser.c",
                    "src/scanner.c",
                ],
                resources: [
                    .copy("queries")
                ],
                publicHeadersPath: "bindings/swift",
                cSettings: [.headerSearchPath("src")])
    ],
    cLanguageStandard: .c11
)
