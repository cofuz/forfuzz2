#!/bin/bash

for ((i=0; i=20; i++));
do
  timeout 3h ./afl-fuzz -i in -o asanoutputrerf1_$i -m none -C -- ./rerf @@
done

