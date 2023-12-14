up:
	sudo docker run --rm -it -p 8031:8000 -v $(PWD):/docs -v $(PWD)/.git:/docs/.git -t mg-docs
build:
	sudo docker build --no-cache -t mg-docs .
