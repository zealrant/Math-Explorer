#!/bin/bash
for i in $(seq 1 156); do
say -v Samantha -o me.voice${i}.en.m4a --data-format alac -f vc${i}.txt
done