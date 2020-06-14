import QtQuick.Layouts 1.2
import QtQuick.Controls 2.0
import QtQuick 2.0

ColumnLayout {
    property alias allHighscores: highscoreView.model
    ListView {
        Layout.fillWidth: true
        id: highscoreView
        height: 200
        header: Row {
            Label {
                text: qsTr("Board size: ")
                width: highscoreView.width / 2
            }
            Label {
                text: qsTr("Fills: ")
                width: highscoreView.width / 2
            }
        }
        delegate: Row {
            Label {
                text: modelData.size
                width: highscoreView.width / 2
            }
            Label {
                text: modelData.highscore
                width: highscoreView.width / 2
            }
        }
    }
}
