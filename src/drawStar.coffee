drawStar (cx, cy, ctx, color) ->
    outerRadius = 30
    innerRadius = 15
    spikes  = 5
    rot = Math.PI / 2 * 3
    x = cx
    y = cy
    step = Math.PI / spikes

    ctx.strokeSyle = "#000"
    ctx.beginPath()
    ctx.moveTo(cx, cy - outerRadius)
    for i in [1...spikes]
        x = cx + Math.cos(rot) * outerRadius
        y = cy + Math.sin(rot) * outerRadius
        ctx.lineTo(x, y)
        rot += step

        x = cx + Math.cos(rot) * innerRadius
        y = cy + Math.sin(rot) * innerRadius
        ctx.lineTo(x, y)
        rot += step
    ctx.lineTo(cx, cy - outerRadius)
    ctx.closePath()
    ctx.lineWidth = 5
    ctx.strokeStyle = 'blue'
    ctx.stroke()
    ctx.fillStyle = color
    ctx.fill()
