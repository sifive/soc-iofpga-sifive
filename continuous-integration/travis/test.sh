#!/bin/sh -x

set -e

export WAKE_PATH=$PATH

echo "Initialize Workspace"

git config --global url."https://github.com/".insteadOf 'git@github.com:'
wit --repo-path $PWD/.. init workspace -a soc-iofpga-sifive
cd workspace/

wake --init .

echo "Compile Scala"

wake -v compileScalaModule ioFPGAScalaModule

echo "Generate Verilog"

wake -v makeRTL ioFPGAVCU118WithNVDLALargeDUTPlan
