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

EXEC=1cell_stationaryTest_explicit.edp;

FreeFem++ $EXEC 2>&1 | tee results/$STR/output.txt;
wait;

cp *.edp results/$STR/code/;
# cp varf_2cellRR.edp results/$STR/code/;
# cp PRM.edp results/$STR/code/;
# cp 2cell_RRmod.edp results/$STR/code/;
# cp assemble_RR.edp results/$STR/code/;
# cp channelPRM.edp results/$STR/code/;

# cp 2cell_geometric.edp results/$STR/code;
# cp step_semi_implicit.edp results/$STR/code;

mv results/U*.vtk results/$STR/U;
mv results/U*.ps results/$STR/U;
mv results/U*.txt results/$STR/U;

mv results/V*.vtk results/$STR/V;
mv results/V*.ps results/$STR/V;
mv results/V*.txt results/$STR/V;

mv results/channel.ps results/$STR;
mv results/channel1.vtk results/$STR;
mv results/channel2.vtk results/$STR;

find . -name "*.ps" -exec rename 's/\.ps$/.eps/' '{}' +

echo "--- Script ended ---";
