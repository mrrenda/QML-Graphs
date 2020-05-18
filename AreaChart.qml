import QtQuick 2.12

Item {
    property int _width: 100
    property int _height: 50

    id: areaChartRoot

    property variant interval: 0
    property variant _color: "#55FFFFFF"
    property variant dataCount: 0
    property variant lastData: 0

    function addData(data) {

        var dataY = areaChartRoot._height - data

        var lineCommand = "Line { lineFill: \""
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

        Line { lineFill: "#5500FF00"; x1: 0;   y1: 60;   x2: 100; y2: 120; }
        Line { lineFill: "#5500FF00"; x1: 100; y1: 120;  x2: 200; y2: 160; }
        Line { lineFill: "#5500FF00"; x1: 200; y1: 160;  x2: 300; y2: 200; }
        Line { lineFill: "#5500FF00"; x1: 300; y1: 200;  x2: 400; y2: 90;  }
        Line { lineFill: "#5500FF00"; x1: 400; y1: 90;   x2: 500; y2: 50;  }
        Line { lineFill: "#5500FF00"; x1: 500; y1: 50;   x2: 600; y2: 30;  }

        Line { lineFill: "#55FF0000"; x1: 0;   y1: 170; x2: 100; y2: 120; }
        Line { lineFill: "#55FF0000"; x1: 100; y1: 120; x2: 200; y2: 110; }
        Line { lineFill: "#55FF0000"; x1: 200; y1: 110; x2: 300; y2: 120; }
        Line { lineFill: "#55FF0000"; x1: 300; y1: 120; x2: 400; y2: 120; }
        Line { lineFill: "#55FF0000"; x1: 400; y1: 120; x2: 500; y2: 80;  }
        Line { lineFill: "#55FF0000"; x1: 500; y1: 80;  x2: 600; y2: 80;  }

        Line { lineFill: "#550000FF"; x1: 0;   y1: 200; x2: 100; y2: 150; }
        Line { lineFill: "#550000FF"; x1: 100; y1: 150; x2: 200; y2: 270; }
        Line { lineFill: "#550000FF"; x1: 200; y1: 270; x2: 300; y2: 240; }
        Line { lineFill: "#550000FF"; x1: 300; y1: 240; x2: 400; y2: 120; }
        Line { lineFill: "#550000FF"; x1: 400; y1: 120; x2: 500; y2: 80;  }
        Line { lineFill: "#550000FF"; x1: 500; y1: 80;  x2: 600; y2: 80;  }
    }

    MouseArea {
        anchors.fill: areaChartBorder
        drag.target: areaChartBorder

        onReleased: { repositionChart() }
    }
}
