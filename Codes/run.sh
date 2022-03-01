#!/bin/bash

echo "----------------------------------------------------";
echo "---             Root-simulator with              ---";
echo "---             semi-implicit method             ---";
echo "--- Teresa Babini (teresa.babini@mail.polimi.it) ---";
echo "----------------------------------------------------";

mkdir results;
STR=$(date '+%Y-%m-%d_%H-%M-%S');
mkdir results/$STR;
mkdir results/$STR/code/;
mkdir results/$STR/U;
mkdir results/$STR/V;

EXEC=1cell_semi_implicit.edp;

FreeFem++ $EXEC 2>&1 | tee results/$STR/output.txt;
wait;

cp *.edp results/$STR/code/;

mv results/U*.vtk results/$STR/U;
mv results/U*.ps results/$STR/U;
mv results/U*.txt results/$STR/U;

mv results/V*.vtk results/$STR/V;
mv results/V*.ps results/$STR/V;
mv results/V*.txt results/$STR/V;

mv results/channel.ps results/$STR;
mv results/channel*.vtk results/$STR;

find . -name "*.ps" -exec rename 's/\.ps$/.eps/' '{}' +

echo "--- Script ended ---";
