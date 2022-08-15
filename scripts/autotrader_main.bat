@echo off
set autotrader_location=C:/dev/autotrader
set autotrader_conda_env=py38
set back_pwd=%cd%

cd /D %autotrader_location%
call conda activate %autotrader_conda_env%
call python main.py
cd /D %back_pwd%
