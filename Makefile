PROJ_MG = ~/sand/mg-docs

mg-up:
	cd $(PROJ_MG); docker run --rm -it -p 8031:8000 -v $(PROJ_MG):/docs -v ${PROJ_MG}/.git:/docs/.git -t mg-docs

mg-build:
	cd $(PROJ_MG); docker build --no-cache -t mg-docs .
