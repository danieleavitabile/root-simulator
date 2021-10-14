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

FreeFem++ 1cell_semi_implicit.edp 2>&1 | tee results/$STR/output.txt;
wait;
# cp *.edp results/$STR/code/;
mv results/U*.vtk results/$STR/U;
mv results/U*.ps results/$STR/U;

mv results/V*.vtk results/$STR/V;
mv results/V*.ps results/$STR/V;

find . -name "*.ps" -exec rename 's/\.ps$/.eps/' '{}' + #qst forse cambia file estensione ps in eps, non so se serva

echo "--- Script ended ---";
