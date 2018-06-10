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
    name: "gatherNeighbors"
    function test_gather_neighbors_small() {
        var n = Utils.gatherNeighbors(Qt.point(0,0),0);
        compare(n.length, 0, "Unexpected neighbor count" )
    }

    function test_gather_neighbors_small2() {
        var n = Utils.gatherNeighbors(Qt.point(0,0),1);
        compare(n.length, 2, "Unexpected neighbor count" )
        compare(n, [Qt.point(1,0),Qt.point(0,1)],"content")
    }

    function test_gather_neighbors_larger() {
        var n = Utils.gatherNeighbors(Qt.point(5,4),8);
        compare(n.length, 4, "Unexpected neighbor count" )
        compare(n, [Qt.point(4,4),Qt.point(6,4),Qt.point(5,3),Qt.point(5,5)],"content")
    }

    function test_gather_neighbors_larger2() {
        var n = Utils.gatherNeighbors(Qt.point(5,4),5);
        compare(n.length, 3, "Unexpected neighbor count" )
        compare(n, [Qt.point(4,4),Qt.point(5,3),Qt.point(5,5)],"content")
    }

}


