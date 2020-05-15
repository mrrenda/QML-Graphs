import QtQuick 2.0

Item
{
    property int x1: 0
    property int x2: 0
    property int y1: 0
    property int y2: 0
    property color lineFill: "red"
    property int lineThickness: 1

    id: mainContainer
    anchors.centerIn: parent

    Canvas
    {
        id: drawingCanvas
        anchors.fill: parent
        onPaint:
        {
            var ctx = getContext("2d")

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
