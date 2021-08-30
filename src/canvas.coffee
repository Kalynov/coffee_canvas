export class Canvas
    constructor: (settings) ->
        element = document.createElement("canvas")
        element.setAttribute "width", settings.width
        element.setAttribute "height", settings.height
        settings.parent.appendChild(element)
        @ctx = element.getContext('2d')
        @element = element
    
    drawStar: (cx, cy, color) ->
        outerRadius = 30
        innerRadius = 15
        spikes  = 5
        rot = Math.PI / 2 * 3
        x = cx
        y = cy
        step = Math.PI / spikes
        console.log(@ctx.fillStyle)
        

        @ctx.strokeSyle = "#000"
        @ctx.beginPath()
        @ctx.moveTo(cx, cy - outerRadius)
        for i in [0...spikes]
            x = cx + Math.cos(rot) * outerRadius
            y = cy + Math.sin(rot) * outerRadius
            @ctx.lineTo(x, y)
            rot += step

            x = cx + Math.cos(rot) * innerRadius
            y = cy + Math.sin(rot) * innerRadius
            @ctx.lineTo(x, y)
            rot += step
        @ctx.lineTo(cx, cy - outerRadius)
        @ctx.closePath()
        @ctx.lineWidth = 5
        @ctx.strokeStyle = 'blue'
        @ctx.stroke()
        @ctx.fillStyle = color
        @ctx.fill()

    getColor: ( x, y ) ->
        @ctx.getImageData(x, y, 1, 1).data


    fillCanvas: (color) ->
        console.log( @ctx)
        @ctx.rect(0, 0, @element.width, @element.height)
        @ctx.fillStyle = color
        @ctx.fill()


