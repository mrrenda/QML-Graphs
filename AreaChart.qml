import QtQuick 2.0

Item {
    property int _width: 100
    property int _height: 50

    id: areaChartRoot
    anchors.centerIn: parent

    Rectangle {
        id: areaChartBorder
        width: areaChartRoot._width
        height: areaChartRoot._height
        color: "#000000"
        border.width: 2
        border.color: "lightgrey"
        anchors.centerIn: areaChartRoot

        Line {
            width: 570
            height: 270
            x1: 0
            y1: 0
            x2: 570
            y2: 270
        }
    }
}
