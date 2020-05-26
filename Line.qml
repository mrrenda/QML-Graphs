import QtQuick 2.0

Item
{
    property int x1: 0
    property int x2: 0
    property int y1: 0
    property int y2: 0
    property color colorData: "#1E8BFF"
    property color colorBack: "#000000"



    id: mainContainer
    x: x1
    width: x2 - x1
    height: parent.height

    //Background (the shade you see is the background)
    Canvas {
        anchors.fill: parent
        antialiasing: true

        onPaint: {
            var ctx = getContext("2d");

            // Create gradient
            var grd = ctx.createLinearGradient(0, 0, 0, mainContainer.height);
            grd.addColorStop(0, colorData);
            grd.addColorStop(1, colorBack);

            // Fill with gradient
            ctx.fillStyle = grd;
            ctx.fillRect(0, 0, mainContainer.width, mainContainer.height);
        }
    }

    //Data (visualized by darkening the area above the data line)
    Canvas {
        id: drawingCanvas
        anchors.fill: parent
        antialiasing: true

        onPaint: {
            var ctx = getContext("2d");

            ctx.fillStyle = colorBack;
            ctx.beginPath();
            ctx.moveTo(0, y1);
            ctx.lineTo(mainContainer.width, y2);
            ctx.lineTo(mainContainer.width, 0);
            ctx.lineTo(0, 0);
            ctx.closePath();
            ctx.fill();
        }
    }

    //Line
    Canvas {
        anchors.fill: parent
        antialiasing: true

        onPaint: {
            var ctx = getContext("2d");

            ctx.lineWidth = 3;
            ctx.strokeStyle = colorData;
            ctx.beginPath();
            ctx.moveTo(0, y1);
            ctx.lineTo(mainContainer.width, y2);
            ctx.stroke();
        }
    }
}
