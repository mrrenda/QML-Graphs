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
        border.width: 1
        border.color: "#22FFFFFF"
        anchors.centerIn: areaChartRoot

        Line { lineFill: "green"; x1: 0;   y1: 300;  x2: 100; y2: 290; }
        Line { lineFill: "green"; x1: 100; y1: 290;  x2: 200; y2: 270; }
        Line { lineFill: "green"; x1: 200; y1: 270;  x2: 300; y2: 250; }
        Line { lineFill: "green"; x1: 300; y1: 250;  x2: 400; y2: 90; }
        Line { lineFill: "green"; x1: 400; y1: 90;  x2: 500; y2: 50; }
        Line { lineFill: "green"; x1: 500; y1: 50;  x2: 600; y2: 30; }

        Line { lineFill: "red"; x1: 0;   y1: 170; x2: 100; y2: 120; }
        Line { lineFill: "red"; x1: 100; y1: 120; x2: 200; y2: 110; }
        Line { lineFill: "red"; x1: 200; y1: 110; x2: 300; y2: 120; }
        Line { lineFill: "red"; x1: 300; y1: 120; x2: 400; y2: 120; }
        Line { lineFill: "red"; x1: 400; y1: 120; x2: 500; y2: 80;  }
        Line { lineFill: "red"; x1: 500; y1: 80;  x2: 600; y2: 80;  }

        Line { lineFill: "blue"; x1: 0;   y1: 200; x2: 100; y2: 150; }
        Line { lineFill: "blue"; x1: 100; y1: 150; x2: 200; y2: 270; }
        Line { lineFill: "blue"; x1: 200; y1: 270; x2: 300; y2: 240; }
        Line { lineFill: "blue"; x1: 300; y1: 240; x2: 400; y2: 120; }
        Line { lineFill: "blue"; x1: 400; y1: 120; x2: 500; y2: 80;  }
        Line { lineFill: "blue"; x1: 500; y1: 80;  x2: 600; y2: 80;  }
    }
}
