import QtQuick 2.0

Item
{
    property int x1: 0
    property int x2: 0
    property int y1: 0
    property int y2: 0
    property color lineFill: "red"
    property int lineThickness: 2

    id: mainContainer
    anchors.centerIn: parent

    Canvas
    {
        id: drawingCanvas
        anchors.fill: parent
        antialiasing: true

        onPaint:
        {
            var ctx = getContext("2d")

//            var grd = context.createLinearGradient(150, 150, 0, 150, 150, 300);
            var grd = context.createLinearGradient((x1 + x2) / 2, (y1 + y2) / 2, 115, 300);
            grd.addColorStop(0.00, '#00000000');
            grd.addColorStop(0.01, '#55FFFFFF');
            grd.addColorStop(0.95, '#00000000');
            context.fillStyle = grd;

            ctx.fillRect(0, 0, drawingCanvas.width, drawingCanvas.height)
            ctx.lineWidth = lineThickness;
            ctx.strokeStyle = lineFill
            ctx.beginPath()
            ctx.moveTo(x1, y1)
            ctx.lineTo(x2, y2)
            ctx.stroke()
        }
    }
}
