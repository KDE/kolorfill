import QtQuick 2.0
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.0

ColumnLayout {
    property bool highscoreBeaten: false
    property int fillCounter: 0
    signal restartClicked()
    Label {
        Layout.fillWidth: true
        text: "You succesfully solved the puzzle in " + fillCounter + " fills. Good luck beating that."
        wrapMode: TextArea.Wrap
    }
    Label {
        Layout.fillWidth: true
        text: "You beat the highscore"
        wrapMode: TextArea.Wrap
        visible: highscoreBeaten
    }
    Button {
        text: "Restart"
        onClicked: {
            restartClicked()
        }
    }
}
