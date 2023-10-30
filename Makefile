##
#

start:
	docker run --rm -it -p 8031:8000 -v ${PWD}:/docs -v ${PWD}/.git:/docs/.git -t mg-km

build:
	docker build -t mg-km . #--no-cache
