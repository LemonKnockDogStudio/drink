import QtQuick
import Monty
Rectangle {

    Timer {
        id: finishTimer
        interval: 1500
        running: false
        onTriggered: {
            systemController.setDrinkSize( SystemController.NOSIZE )
            systemController.setDrinkType( "NONE" )
            systemController.setDrinkTemperature( SystemController.NONE )
            stackView.pop( null )
        }
    }

    Component.onCompleted: finishTimer.start()

    id: mainBackground
    color: {
        if ( systemController.drinkTemperature === SystemController.HOT )
            return "#EE1C25"
        else if ( systemController.drinkTemperature === SystemController.COLD )
            return "#1BA6DF"
    }

    Image {
        id: finishImage
        width: 256
        height: 256
        anchors.centerIn: parent
        source: {
            if ( systemController.drinkTemperature === SystemController.HOT )
                return "qrc:/images/tickHot.png"
            else if ( systemController.drinkTemperature === SystemController.COLD )
                return "qrc:/images/tickCold.png"
        }
    }

    Text {
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: finishImage.bottom
            topMargin: 20
        }
        font.pixelSize: 96
        color: {
            if ( systemController.drinkTemperature === SystemController.HOT )
                return "#F69678"
            else if ( systemController.drinkTemperature === SystemController.COLD )
                return "#9ECCED"
        }
        text: "Enjoy!"
    }
}
