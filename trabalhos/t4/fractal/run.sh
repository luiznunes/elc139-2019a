#!/bin/sh

g++ fractal1.cpp -o fractal1 -fopenmp
./fractal1 512 32 && ./fractal1 512 64 && ./fractal1 1024 32 && ./fractal1 1024 64