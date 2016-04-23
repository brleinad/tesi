#!/bin/sh

FILE="cla_adder.v"

for i in {4..16}
do
    CURRENT="parameter NBIT=$i;"
    j=$i+1;
    NEXT="parameter NBIT=$j;"
    /usr/bin/perl -p -i -e "s/$CURRENT/$NEXT/g" $FILE
    head $FILE
done
