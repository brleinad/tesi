#!/bin/bash

HERE=`pwd`
echo "" > ./data/tables.tex
echo "\\documentclass{article}" >> ./data/tables.tex
echo "\\begin{document}" >> ./data/tables.tex
$HERE/get_areas.pl >> ./data/tables.tex
$HERE/get_power.pl >> ./data/tables.tex
$HERE/get_timing.pl >> ./data/tables.tex
echo "\\end{document}" >> ./data/tables.tex

cd data
pdflatex tables.tex & evince tables.pdf &
