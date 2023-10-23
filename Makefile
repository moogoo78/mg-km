##
#

start:
	docker run --rm -it -p 8001:8000 -v ${PWD}:/docs -v ${PWD}/.git:/docs/.git -t mg-km
