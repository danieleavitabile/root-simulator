#!/bin/bash

echo "----------------------------------------------------";
echo "---      Root-simulator 1st try with             ---";
echo "---         semi-implicit method                 ---";
echo "--- Teresa Babini (teresa.babini@mail.polimi.it) ---";
echo "----------------------------------------------------";

mkdir results;
STR=$(date '+%Y-%m-%d_%H-%M-%S');
mkdir results/$STR;
mkdir results/$STR/U;
mkdir results/$STR/V;

EXEC=1cell_stationaryTest.edp;

FreeFem++ $EXEC 2>&1 | tee results/$STR/output.txt;
wait;
# estensione .vtk per gif paraview
mv results/U*.vtk results/$STR/U;
mv results/U*.ps results/$STR/U;
mv results/U*.txt results/$STR/U;

mv results/V*.vtk results/$STR/V;
mv results/V*.ps results/$STR/V;
mv results/V*.txt results/$STR/V;

find . -name "*.ps" -exec rename 's/\.ps$/.eps/' '{}' + # cambia estensione .ps in .eps, per latex

echo "--- Script ended ---";
