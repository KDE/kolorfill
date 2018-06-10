/*
 * Copyright (c) 2018 Sune Vuorela <sune@vuorela.dk>
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */



import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.2
import "KolorFillUtils.js" as Utils
import org.kde.kirigami 2.4 as Kirigami

Kirigami.ApplicationWindow
{
    visible: true
    width: 480
    height: 640
    title: "KolorFill"
    header: Kirigami.Heading {
        text: "Fills: " + gamearea.fillcounter
    }

    globalDrawer: Kirigami.GlobalDrawer {
        title: "KolorFill"
        titleIcon: "color-fill"
        actions: [
            Kirigami.Action {
                text: "Restart"
                iconName: "view-refresh"
                onTriggered:gamearea.restart()
            },
            Kirigami.Action {
                text: "Highscore"
                iconName: "games-highscores"
                onTriggered: highscore.sheetOpen = true
            },
            Kirigami.Action {
                text: "Help"
                iconName: "help-contents"
                onTriggered: help.sheetOpen = true
            }
        ]
    }

    Kirigami.OverlaySheet {
        id: help
        header: Kirigami.Heading { text: "Help" }
        Label {
            text: "Simple color fill application. By selecting a color, the boad gets flood filled from top left. The goal is to make the board in one color in as few fills as possible."
            wrapMode: TextArea.Wrap
        }
    }

    Kirigami.OverlaySheet {
        id: highscore
        header: Kirigami.Heading {
            text: "High score"
        }
        Label {
            text: "Lowest fills will be placed here"
            wrapMode: TextArea.Wrap
        }
    }
    Kirigami.OverlaySheet {
        id: winner
        header: Kirigami.Heading {
            text: "Winner!"
        }
        ColumnLayout {
            Label {
                Layout.fillWidth: true
                text: "You succesfully solved the puzzle in " + gamearea.fillcounter + " fills. Good luck beating that."
                wrapMode: TextArea.Wrap
            }
            Button {
                text: "Restart"
                onClicked: {
                    gamearea.restart()
                    winner.sheetOpen = false
                }
            }
        }
    }

    Item {
        id: gamearea
        anchors.bottomMargin: 40
        anchors.fill: parent
        readonly property int boardsize: 15
        readonly property var colorList: [ "red", "darkGreen", "blue", "yellow", "darkMagenta", "orange" ]
        property int fillcounter: 0
        property bool filled: false
        property var board: []
        Component.onCompleted: {
            gamearea.restart()
        }
        onFilledChanged: {
            winner.sheetOpen = filled
        }
        function fill(color,board) {
            var changed = Utils.fill(color,board)
            if (!changed) {
                return
            }
            gamearea.fillcounter++
            gamearea.filled = Utils.checkWin(board)
            canvas.requestPaint()
        }
        function restart() {
            gamearea.board = Utils.createBoard(boardsize,colorList)
            gamearea.fillcounter = 0
            gamearea.filled = Utils.checkWin(board)
            canvas.requestPaint()
        }
        Canvas {
            anchors.fill: parent
            anchors.margins: 20
            anchors.bottomMargin: 120
            anchors.topMargin: 40
            id: canvas;
            onPaint: {
                var ctx = getContext("2d")
                ctx.fillRect(0,0,canvasSize.width, canvasSize.height)
                var number = gamearea.board.length
                var fieldheight = canvasSize.height / number
                var fieldwidth = canvasSize.width / number
                for(var i = 0; i < number ; i++) {
                    for(var j = 0 ; j < number ; j++) {
                        ctx.fillStyle = gamearea.board[i][j]
                        ctx.fillRect(Math.ceil(i*fieldwidth), Math.ceil(j* fieldheight), Math.ceil(fieldwidth), Math.ceil( fieldheight))
                    }
                }
            }
        }

        Row {
            anchors.bottom: gamearea.bottom
            height: 100
            id: selector
            Repeater {
                model: gamearea.colorList
                Button {
                    height: selector.height
                    width: gamearea.width / gamearea.colorList.length
                    enabled: !gamearea.filled
                    onClicked: gamearea.fill(modelData, gamearea.board)
                    Rectangle {
                        anchors.margins: 5
                        anchors.fill: parent
                        color: modelData
                    }
                }
            }
        }
    }
}
