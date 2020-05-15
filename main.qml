import QtQuick 2.14
import QtQuick.Window 2.14

Window {
    id: window
    visible: true
    width: 600
    height: 300
    color: "#000000"
    flags: Qt.FramelessWindowHint

    AreaChart {
        _width: 600
        _height: 300
        anchors.centerIn: parent
    }

    DraggablePanel { target: window }

    Text {
        id: lblTitle
        text: "Renda Chart"
        color: "grey"
        x: 10
        y: 10
    }

    TitleBarButton {
        id: quitButton
        x: parent.width - (this.width + 20)
        y: 10
        buttonColor: "red"
        func.onPressed: { Qt.quit(); }
    }
}
