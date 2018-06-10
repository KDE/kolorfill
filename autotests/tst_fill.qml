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
    name: "fill"
    function test_fill_small_board() {
        var board = Utils.createBoard(1, ["black"]);
        var changed = Utils.fill("blue",board);
        compare(changed, true, "board changed");
        compare(board.length, 1, "wrong one dimension");
        compare(board[0].length, 1, "wrong other dimension");
        compare(board[0][0], "blue", "wrong content");
    }

    function test_fill_small_board_unchanged() {
        var board = Utils.createBoard(1, ["black"]);
        var changed = Utils.fill("black",board);
        compare(changed, false, "board changed");
        compare(board.length, 1, "wrong one dimension");
        compare(board[0].length, 1, "wrong other dimension");
        compare(board[0][0], "black", "wrong content");
    }

    function test_fill_u_shape() {
        var board = Utils.createBoard(3, ["black"]);
        board[1][0] = "blue";
        board[2][0] = "blue";
        var changed = Utils.fill("blue",board)
        compare(changed, true, "board changed");
        var win = Utils.checkWin(board);
        compare(win, true, "board we are supposed to have a board here");

    }

}

