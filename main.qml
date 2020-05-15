import QtQuick 2.14
import QtQuick.Window 2.14

Window {
    id: window
    visible: true
    width: 600
    height: 300
    color: "#000000"
    title: qsTr("Deneme")

    AreaChart {
        _width: 580
        _height: 280
        anchors.centerIn: parent
    }

    DraggablePanel { target: window }
}
