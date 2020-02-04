.PHONY: run
## run: runs main.py
run:
	@python3 main.py
	
.PHONY: docker-build
## docker-build: builds docker image
docker-build:
	@docker build -t chuhlomin/telegram-large-files-upload:latest .

.PHONY: docker-run
## docker-run: runs docker container
docker-run:
	@docker run --name telegram-large-files-upload \
		--rm \
		--env API_ID="${API_ID}" \
		--env API_HASH="${API_HASH}" \
		--env FILE_PATH="${FILE_PATH}" \
		--env SEND_TO="${SEND_TO}" \
		--env CAPTION="${CAPTION}" \
		--volume ${LOCAL_PATH_SESSIONS}:/session:z \
		--volume ${LOCAL_PATH_FILES}:/files:ro \
		chuhlomin/telegram-large-files-upload:latest

.PHONY: help
## help: prints this help message
help:
	@echo "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'
