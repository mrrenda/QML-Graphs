import QtQuick 2.14
import QtQuick.Window 2.14
import com.renda.core 1.0

Window {
    id: window
    visible: true
    width: 600
    height: 330
    color: "#000000"
    flags: Qt.FramelessWindowHint | Qt.WindowSystemMenuHint | Qt.WindowMinimizeButtonHint | Qt.Window

    screen: Qt.application.screens[0]
    x: screen.width - this.width
    y: screen.height - this.height - 30

    AreaChart { id: areaChart; x: 0; y: 30; _width: 600; _height: 300; }

    Rectangle { id: topBar; x: 0; y: 0; width: window.width; height: 30; color: "#11FFFFFF";
        DraggablePanel { target: window }
    }

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

    TitleBarButton {
        id: dataAdder
        x: parent.width - (this.width + 35)
        y: 10
        buttonColor: "blue"

        func.onPressed: {
            areaChart._color = "blue"
            areaChart.interval = 100
            areaChart.addData(Math.floor(Math.random() * areaChart._height))
        }
    }

    Core {
        id: core
        onSendData:  {
            areaChart._color = "red"
            areaChart.interval = 50
            console.debug("Data added")
            areaChart.addData(core.workload)
        }
    }

    TitleBarButton {
        id: dataAdderStarter
        x: parent.width - (this.width + 50)
        y: 10
        buttonColor: "green"

        func.onPressed: { core.startAddingData(); }
    }
}
