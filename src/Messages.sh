#!/bin/sh
$EXTRACT_TR_STRINGS `find . -name \*.cpp -o -name \*.h -o -name \*.qml` -o $podir/kolorfill_qt.pot
