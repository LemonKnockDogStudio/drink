import QtQuick
import QtQuick.Window
import QtQuick.Controls
import Monty

Window {
    width: 1024
    height: 680
    visible: true
    title: qsTr("CoffeeSodaDispenser")

    SystemController {
        id: systemController
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: 'qrc:/HotColdSelectionPage.qml'
    }

    StatusBar {
        id: statusBar
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }
    }
}
