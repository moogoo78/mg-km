up:
	docker run --rm -it -p 8031:8000 -v $(PWD):/docs -v ${PWD}/.git:/docs/.git -t mg-docs

build:
	docker build --no-cache -t mg-docs .

deploy:
	docker run --rm -it -v ~/.ssh:/root/.ssh -v ${PWD}:/docs -t mg-docs gh-deploy 
