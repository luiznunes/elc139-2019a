#!/bin/sh

g++ fractal.cpp -o fractal
./fractal 512 32 && ./fractal 512 64 && ./fractal 1024 32 && ./fractal 1024 64