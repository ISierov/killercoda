#!/bin/sh
sudo python my_answer.py
stat diff --ignore-goedel correct_output.json output.json