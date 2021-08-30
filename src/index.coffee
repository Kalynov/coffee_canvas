import { Canvas } from './canvas.coffee'
#presets
main = document.createElement('div')
main.className = "main"
document.body.appendChild(main)
smallCanvasSetting =
    name: "smallCanvas"
    width: 600
    height: 50
    parent: main

bigCanvasSetting =
    name: "bigCanvas"
    width: 600
    height: 600
    parent: main

#render elements
rgbToHex = (r, g, b) ->
    ((r << 16) | (g << 8) | b).toString(16)

smallCanvas = new Canvas smallCanvasSetting
bigCanvas = new Canvas bigCanvasSetting
colors = ['red', 'blue', 'green', 'yellow', 'black']
for color, i in colors
    bigCanvas.drawStar(100, 100 + 100 * i, color)

#logic
clickHandler = (e) ->
    { mouseX, mouseY } = if e.offsetX then {
        mouseX: e.offsetX
        mouseY: e.offsetY
    } else if e.layerX then {
        mouseX: e.layerX
        mouseY: e.layerY
    }
    console.log(bigCanvas.getColor mouseX, mouseY)
    starColorRGB = bigCanvas.getColor mouseX, mouseY
    starColorHex = if !starColorRGB[3] then '#FFFFFF'
    else "#" + ("000000" + rgbToHex(starColorRGB[0], starColorRGB[1], starColorRGB[2])).slice(-6)
    console.log(starColorHex)
    smallCanvas.fillCanvas starColorHex

bigCanvas.element.addEventListener('click', clickHandler)
        