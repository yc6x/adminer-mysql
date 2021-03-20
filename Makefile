ADMINER_VERSION = 4.8.0
ADMINER_URL = https://github.com/vrana/adminer/releases/download/v${ADMINER_VERSION}/adminer-${ADMINER_VERSION}-mysql.php

ADMINER_DIR = build/adminer
REPO_NAME = noctuary/adminer-mysql

get: # Download and extract the Adminer file from the official website
ifeq (,$(wildcard ${ADMINER_DIR}))	
	@echo [info] downloading Adminer ${ADMINER_VERSION}
	@mkdir -p ${ADMINER_DIR}
	@wget ${ADMINER_URL} -O ${ADMINER_DIR}/index.php
else
	@echo [info] using ${ADMINER_DIR} folder
endif

.PHONY: build
build: # Get Adminer and build the docker image
	@$(MAKE) get
	@docker build -t ${REPO_NAME}:latest -t ${REPO_NAME}:${ADMINER_VERSION} .

push: # Push images to Docker Hub
	@docker push --all-tags ${REPO_NAME}

clean: # Remove build folders
	@echo [info] removing previous build
	@rm -rf ${ADMINER_DIR}