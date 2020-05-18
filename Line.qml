import QtQuick 2.0

Item
{
    property int x1: 0
    property int x2: 0
    property int y1: 0
    property int y2: 0
    property color lineFill: "#55FFFFFF"
    property int lineThickness: 3

    id: mainContainer
    x: x1
    y: 0
    width: x2 - x1
    height: parent.height

    Canvas
    {
        id: drawingCanvas
        anchors.fill: parent
        antialiasing: true

        onPaint:
        {
            var ctx = getContext("2d")
            var Ax = (0 + mainContainer.width) / 2;
            var Ay = (y1 + y2) / 2;
            var M = 1;
            if ((y1 - y2) < 0) M = M * -1;
            var shadeDepth = mainContainer.height - Math.abs(y2 - y1)
            var Bx = Ax + M * (shadeDepth * Math.sqrt(Math.pow(y2 - y1, 2) / (Math.pow(y2 - y1, 2) + Math.pow(x1 - x2, 2))));
            var By = Ay + (shadeDepth * Math.sqrt(Math.pow(x1 - x2, 2) / (Math.pow(y2 - y1, 2) + Math.pow(x1 - x2, 2))));
            var grd = context.createLinearGradient(Ax, Ay, Bx, By);
            grd.addColorStop(0.00, '#00000000');
            grd.addColorStop(0.01, lineFill);
            grd.addColorStop(1.00, '#00000000');
            context.fillStyle = grd;

            ctx.fillRect(0, 0, drawingCanvas.width, drawingCanvas.height)
            ctx.lineWidth = lineThickness;
            ctx.strokeStyle = lineFill
            ctx.beginPath()
            ctx.moveTo(0, y1)
            ctx.lineTo(mainContainer.width, y2)
            ctx.stroke()
        }
    }
}
