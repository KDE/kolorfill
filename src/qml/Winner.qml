import QtQuick 2.0
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.0

ColumnLayout {
    property bool highscoreBeaten: false
    property int fillCounter: 0
    signal restartClicked()
    Label {
        Layout.fillWidth: true
        text: qsTr("You successfully solved the puzzle in %1 fills. Good luck beating that.").arg(fillCounter)
        wrapMode: TextArea.Wrap
    }
    Label {
        Layout.fillWidth: true
        text: qsTr("You beat the highscore")
        wrapMode: TextArea.Wrap
        visible: highscoreBeaten
    }
    Button {
        text: qsTr("Restart")
        onClicked: {
            restartClicked()
        }
    }
}
