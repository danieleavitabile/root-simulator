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
# mkdir results/$STR/code/;

EXEC=1cell_semi_implicit.edp;

FreeFem++ $EXEC 2>&1 | tee results/$STR/output.txt;
wait;
# estensione .vtk per gif paraview
mv results/U*.vtk results/$STR/U;
mv results/U*.ps results/$STR/U;

mv results/V*.vtk results/$STR/V;
mv results/V*.ps results/$STR/V;

mv results/*.txt results/$STR;
find . -name "*.ps" -exec rename 's/\.ps$/.eps/' '{}' + # cambia estensione .ps in .eps, per latex

echo "--- Script ended ---";

#to make gif with paraview
# mkdir results/$STR/U/frame_gif; #salvarvi le animation da paraview
# mkdir results/$STR/V/frame_gif; #salvarvi le animation da paraview
# cd results/$STR/U/frame_gif;
# convert -verbose -dispose background -delay 10 *.png animation.gif
# cd results/$STR/V/frame_gif;
# convert -verbose -dispose background -delay 10 *.png animation.gif
