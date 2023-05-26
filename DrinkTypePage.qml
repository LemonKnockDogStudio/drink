import QtQuick
import Monty

Rectangle {
    id: mainBackground
    color: {
        if ( systemController.drinkTemperature === SystemController.HOT )
            return "#EE1C25"
        else if ( systemController.drinkTemperature === SystemController.COLD )
            return "#1BA6DF"
    }

    Rectangle {
        id: centerButton
        width: 281
        height: 281
        radius: 281/2
        color: "#C4C4C4"
        anchors.centerIn: parent

        Image {
            anchors.centerIn: parent
            width: 156
            height: 156
            source: {
                if ( systemController.drinkTemperature === SystemController.HOT )
                    return "qrc:/images/tea.png"
                else if ( systemController.drinkTemperature === SystemController.COLD )
                    return "qrc:/images/cold.png"
            }

            Text {
                color: "black"
                font.pixelSize: 28
                text: {
                    if ( systemController.drinkTemperature === SystemController.HOT )
                        return "Tea"
                    else if ( systemController.drinkTemperature === SystemController.COLD )
                        return "Cold Brew"
                }
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.bottom
                    topMargin: 10
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onPressed: {
                if ( systemController.drinkTemperature === SystemController.HOT )
                    parent.color = "#F69678"
                else if ( systemController.drinkTemperature === SystemController.COLD )
                    parent.color = "#9ECCED"
            }
            onReleased: {
                parent.color = "#C4C4C4"
            }
            onClicked: {
                if ( systemController.drinkTemperature === SystemController.HOT )
                    systemController.setDrinkType("Tea")
                else if ( systemController.drinkTemperature === SystemController.COLD )
                    systemController.setDrinkType("Cold Brew")
                stackView.push("DrinkSizeSelectionPage.qml")
            }
        }
    }

    Rectangle {
        id: leftButton
        width: 281
        height: 281
        radius: 281/2
        color: "#C4C4C4"
        anchors {
            right: centerButton.left
            rightMargin: 52
            verticalCenter: centerButton.verticalCenter
        }

        Image {
            anchors.centerIn: parent
            width: 156
            height: 156
            source: {
                if ( systemController.drinkTemperature === SystemController.HOT )
                    return "qrc:/images/coffee-beans.png"
                else if ( systemController.drinkTemperature === SystemController.COLD )
                    return "qrc:/images/softdrinks.png"
            }

            Text {
                color: "black"
                font.pixelSize: 28
                text: {
                    if ( systemController.drinkTemperature === SystemController.HOT )
                        return "Coffee"
                    else if ( systemController.drinkTemperature === SystemController.COLD )
                        return "Soda"
                }
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.bottom
                    topMargin: 10
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onPressed: {
                if ( systemController.drinkTemperature === SystemController.HOT )
                    parent.color = "#F69678"
                else if ( systemController.drinkTemperature === SystemController.COLD )
                    parent.color = "#9ECCED"
            }
            onReleased: {
                parent.color = "#C4C4C4"
            }
            onClicked: {
                if ( systemController.drinkTemperature === SystemController.HOT )
                    systemController.setDrinkType("Coffee")
                else if ( systemController.drinkTemperature === SystemController.COLD )
                    systemController.setDrinkType("Soda")
                stackView.push("DrinkSizeSelectionPage.qml")
            }
        }
    }

    Rectangle {
        id: rightButton
        width: 281
        height: 281
        radius: 281/2
        color: "#C4C4C4"
        anchors {
            left: centerButton.right
            leftMargin: 52
            verticalCenter: centerButton.verticalCenter
        }

        Image {
            anchors.centerIn: parent
            width: 156
            height: 156
            source: "qrc:/images/drop.png"

            Text {
                color: "black"
                font.pixelSize: 28
                text: {
                    if ( systemController.drinkTemperature === SystemController.HOT )
                        return "Hot Water"
                    else if ( systemController.drinkTemperature === SystemController.COLD )
                        return "Cold Water"
                }
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.bottom
                    topMargin: 10
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onPressed: {
                if ( systemController.drinkTemperature === SystemController.HOT )
                    parent.color = "#F69678"
                else if ( systemController.drinkTemperature === SystemController.COLD )
                    parent.color = "#9ECCED"
            }
            onReleased: {
                parent.color = "#C4C4C4"
            }
            onClicked: {
                if ( systemController.drinkTemperature === SystemController.HOT )
                    systemController.setDrinkType("Hot Water")
                else if ( systemController.drinkTemperature === SystemController.COLD )
                    systemController.setDrinkType("Cold Water")
                stackView.push("DrinkSizeSelectionPage.qml")
            }
        }

    }

    Image {
        id: backButton
        width: 60
        height: 60
        anchors {
            left: leftButton.left
            bottom: parent.bottom
            bottomMargin: 100
        }

        source: {
            if ( systemController.drinkTemperature === SystemController.HOT )
                return "qrc:/images/previousHot.png"
            else if ( systemController.drinkTemperature === SystemController.COLD )
                return "qrc:/images/previousCold.png"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                systemController.setDrinkType("NONE")
                stackView.pop()
            }
        }
    }

    Text {
        id: backText
        font.pixelSize: 36
        color: {
            if ( systemController.drinkTemperature === SystemController.HOT )
                return "#F69678"
            else if ( systemController.drinkTemperature === SystemController.COLD )
                return "#9ECCED"
        }
        text: "Back"

        anchors {
            top: backButton.bottom
            topMargin: 10
            horizontalCenter: backButton.horizontalCenter
        }
    }
}
