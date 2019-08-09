build:
	docker build -t docker3d:latest .

run:
	docker run --net host -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$(shell ifconfig en0 | grep broadcast | cut -d ' ' -f 2):0 -it --rm docker3d:latest /bin/bash

eyes:
	docker run -e DISPLAY=$(shell ifconfig en0 | grep broadcast | cut -d ' ' -f 2):0 gns3/xeyes

setup:
	brew cask install xquartz
	brew install socat
	open -a xquartz
	socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$$DISPLAY\"
