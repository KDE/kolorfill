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
import org.kde.kirigami 2.4 as Kirigami
import KolorFill 1.0

Kirigami.ApplicationWindow
{
    visible: true
    width: 480
    height: 640
    title: "KolorFill"
    header: Kirigami.Heading {
        text: "Fills: " + gamearea.fillCounter
    }

    HighScore {
        id: highscorehandler
        size: gamearea.boardsize;
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
        Help {
        }
    }

    Kirigami.OverlaySheet {
        id: highscore
        header: Kirigami.Heading {
            text: "High score"
        }
        HighScoreView {
             allHighscores: highscorehandler.allHighscores

        }

    }
    Kirigami.OverlaySheet {
        id: winner
        header: Kirigami.Heading {
            text: "Winner!"
        }
        property alias highscorebeaten: winBanner.highscoreBeaten;
        Winner {
            id: winBanner
            fillCounter: gamearea.fillCounter
            onRestartClicked: {
                gamearea.restart()
                winner.sheetOpen = false
            }
        }
    }

    GameArea {
        id: gamearea
        anchors.bottomMargin: 40
        anchors.fill: parent
        boardsize: 15
        colorList: [ "red", "darkGreen", "blue", "yellow", "darkMagenta", "orange" ]
        Component.onCompleted: {
            gamearea.restart()
        }
        onFilledChanged: {
            if (filled) {
                winner.highscorebeaten = (highscorehandler.highscore > gamearea.fillCounter) || (highscorehandler.highscore === -1)
                if (winner.highscorebeaten) {
                    highscorehandler.highscore = gamearea.fillCounter;
                }
            }
            winner.sheetOpen = filled
        }
    }
}
