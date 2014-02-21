#!/bin/sh
for db in `find $HOME -type f -name *.sqlite* | grep firefox`;do sqlite3 $db VACUUM;sqlite3 $db REINDEX;done