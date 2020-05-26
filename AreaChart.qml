import QtQuick 2.12

Item {
    property int _width: 100
    property int _height: 50

    id: areaChartRoot

    property variant interval: 0
    property variant _color: "#AA1E8BFF"
    property variant dataCount: 0
    property variant lastData: 0
    property variant isUserDragging: false

    function addData(data) {

        var dataY = areaChartRoot._height - data

        var lineCommand = "Line { colorData: \""
                + _color
                + "\"; x1: "
                + dataCount * interval
                + "; y1: "
                + lastData
                + "; x2: "
                + interval * (dataCount + 1)
                + "; y2: "
                + dataY
                + "; }"

        lastData = dataY
        dataCount ++
        Qt.createQmlObject(lineCommand, areaChartBorder, "dynamicItem");

        if(!isUserDragging)
            repositionChart()
    }

    function repositionChart() {
        var i = (dataCount * interval) - areaChartRoot._width

        if(i > 0)
            areaChartBorder.x = - i
        else
            areaChartBorder.x = 0

        //TODO recalculate height as well
    }

    Rectangle {
        id: areaChartBorder
        width: areaChartRoot._width + dataCount * interval
        height: areaChartRoot._height
        color: "#000000"
        border.width: 1
        border.color: "#22FFFFFF"
        x: 0
        y: 0
        anchors.top: areaChartRoot.top
    }

    MouseArea {
        anchors.fill: areaChartBorder
        drag.target: areaChartBorder

        onPressed: {
            isUserDragging = true;
        }

        onReleased: {
            repositionChart()
            isUserDragging = false;
        }
    }
}
