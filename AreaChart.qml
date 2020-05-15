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

        Line { width: 570; height: 270; x1: 0;   y1: 200; x2: 100; y2: 150; }
//        Line { width: 570; height: 270; x1: 100; y1: 150; x2: 200; y2: 270; }
//        Line { width: 570; height: 270; x1: 200; y1: 270; x2: 300; y2: 240; }
//        Line { width: 570; height: 270; x1: 300; y1: 240; x2: 400; y2: 120; }
//        Line { width: 570; height: 270; x1: 400; y1: 120; x2: 500; y2: 80;  }
        Line { width: 570; height: 270; x1: 500; y1: 80;  x2: 570; y2: 270; }
    }
}
