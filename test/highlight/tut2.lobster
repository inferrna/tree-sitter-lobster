import std
import vec
import color
import gl

fatal(gl.window("Shooter Tutorial", 640, 480))

let worldsize = 20.0

/*Yet
some
multiline
commentary
*/

/* dgdgdg */

while gl.frame() and gl.button("escape") != 1:
    //Очистка экрана
    gl.clear(color_black)
    //Установка цвета
    gl.color(color_white)
    //Перемещаемся в центр
    gl.translate(float(gl.window_size()) / 2.0)
    //Устанавливаем масштаб
    gl.scale(gl.window_size().y / worldsize)
    //Рисуем кружок
    gl.circle(1.0, 6)
