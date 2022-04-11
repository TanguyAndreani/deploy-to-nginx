CONF_FILES=$(shell find conf -type f)
CONTENT_FILES=$(shell find content -type f)

.PHONY: myserver
myserver: $(CONF_FILES) $(CONTENT_FILES)
	docker build . -t myserver

.PHONY: run
run:
	docker run -p 8080:8080 -t myserver