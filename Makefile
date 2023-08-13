DPATH_WORKSPACE := $(realpath -s .)
FNAME_APP = greeting
DNAME_APP = app
DPATH_APP = $(DPATH_WORKSPACE)/$(DNAME_APP)

.SILENT:
.PHONY: build-app
## Build app
build-app:
	rm -rf "$(DPATH_APP)"
	mkdir -p "$(DPATH_APP)"
	GOOS=linux GOARCH=amd64 go build -tags prod -v -o "$(DPATH_APP)/${FNAME_APP}"

.SILENT:
.PHONY: build-image
## Build Docker image
build-image:
	docker build -t distroless-with-volume .

.DEFAULT_GOAL := help
.SILENT:
.PHONY: help
help:
	@echo "$$(tput setaf 2)Available rules:$$(tput sgr0)";sed -ne"/^## /{h;s/.*//;:d" -e"H;n;s/^## /---/;td" -e"s/:.*//;G;s/\\n## /===/;s/\\n//g;p;}" ${MAKEFILE_LIST}|awk -F === -v n=$$(tput cols) -v i=4 -v a="$$(tput setaf 6)" -v z="$$(tput sgr0)" '{printf"- %s%s%s\n",a,$$1,z;m=split($$2,w,"---");l=n-i;for(j=1;j<=m;j++){l-=length(w[j])+1;if(l<= 0){l=n-i-length(w[j])-1;}printf"%*s%s\n",-i," ",w[j];}}'
