@echo off
docker run -it -v %CD%\Engine:/app/Engine engine-container cmd
