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


// checks if a board is all colored the same
function checkWin(board) {
    var firstColor = board[0][0];
    var count = board.length;
    for(var i = 0 ; i < count ; i++) {
        for(var j = 0 ; j < count ; j++) {
            if (board[i][j] !== firstColor) {
                return false
            }
        }
    }
    return true
}

// gather the neighbor points from a given point, if they exist within the max.
// helper function for 'fill'
function gatherNeighbors(point, max) {
    var n = []
    if (point.x > 0) {
        n.push(Qt.point(point.x - 1, point.y))
    }
    if (point.x < max) {
        n.push(Qt.point(point.x + 1, point.y))
    }
    if (point.y > 0) {
        n.push(Qt.point(point.x, point.y - 1))
    }
    if (point.y < max) {
        n.push(Qt.point(point.x, point.y + 1))
    }
    return n
}

// flood fills the board with the given color starting from 0,0
function fill(color,board) {
    var frontier = [Qt.point(0,0)]
    var originalColor = board[0][0]
    if (originalColor == color) {
        return false
    }
    var seen = []
    while (frontier.length > 0 ) {
        var current = frontier.pop()
        seen.push(current)
        if (board[current.x][current.y] !== originalColor) {
            continue
        }
        board[current.x][current.y] = color
        var neighbors = gatherNeighbors(current, board.length -1)
        while (neighbors.length > 0) {
            var neighbor = neighbors.pop()
            var found = false
            for(var i = 0 ; i < seen.length; i++) {
                if (seen[i].x === neighbor.x && seen[i].y === neighbor.y) {
                    found = true
                    break
                }
            }
            if (!found) {
                for(var i = 0 ; i < frontier.length; i++) {
                    if (frontier[i].x === neighbor.x && frontier[i].y === neighbor.y) {
                        found = true
                        break
                    }
                }
            }
            if (!found) {
                frontier.push(neighbor)
            }
        }
    }
    return true;
}

// initializes a board with random colors from color list
function createBoard(count, colorList) {
    var board = []
    for(var i = 0 ; i < count ; i++) {
        var lane = []
        for(var j = 0 ; j < count ; j++) {
            lane.push(colorList[Math.floor(Math.random() * colorList.length)])
        }
        board.push(lane)
    }
    return board
}
