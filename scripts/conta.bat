@echo off
set conta_location=F:/dev/python/financial/conta
set conta_conda_env=base
set back_pwd=%cd%

cd /D %conta_location%
call conda activate %conta_conda_env%
call python conta.py
cd /D %back_pwd%
