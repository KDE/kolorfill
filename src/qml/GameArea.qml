import QtQuick 2.0
import QtQuick.Controls 2.0
import "KolorFillUtils.js" as Utils


Item {
    property int fillCounter: 0
    property int boardsize: 2
    property var colorList: []
    property bool filled: false
    property var board: []
    function fill(color,board) {
        var changed = Utils.fill(color,board)
        if (!changed) {
            return
        }
        gamearea.fillCounter++
        gamearea.filled = Utils.checkWin(board)
        canvas.requestPaint()
    }
    function restart() {
        gamearea.board = Utils.createBoard(boardsize,colorList)
        gamearea.fillCounter = 0
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
