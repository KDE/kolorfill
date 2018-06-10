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

import QtTest 1.0
import "../src/qml/KolorFillUtils.js" as Utils

TestCase {
    name: "createBoard"
    function test_small_board() {
        var board = Utils.createBoard(1, ["black"]);
        compare(board.length, 1, "wrong one dimension");
        compare(board[0].length, 1, "wrong other dimension");
        compare(board[0][0], "black", "wrong content");
    }
    function test_larger_board() {
        var board = Utils.createBoard(5, ["black"]);
        compare(board.length, 5, "wrong one dimension");
        for(var i = 0 ; i < board.length; i++) {
            compare(board[i].length, 5, "wrong other dimension");
            for(var j = 0 ; j < board[i].length; j++) {
                compare(board[i][j], "black", "wrong content");
            }
        }
    }
}
