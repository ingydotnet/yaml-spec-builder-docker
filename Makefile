DOCKER_IMAGE_NAME := yamlio/yaml-spec-builder
YAML_SPEC_REPO := https://github.com/yaml/yaml-spec

spec: yaml-spec
	( \
	    set -x; \
	    cd $<; \
	    docker run -v $$PWD:/yaml-spec $(DOCKER_IMAGE_NAME) \
	)
	mv $</spec ./spec

yaml-spec:
	git clone $(YAML_SPEC_REPO) $@

clean:
	rm -fr spec yaml-spec

# Docker targets:
build:
	docker build -t $(DOCKER_IMAGE_NAME) .

shell: yaml-spec
	docker run \
	    -it \
	    -v $$PWD:/repo \
	    -v $$PWD/$<:/$< \
	    -v $$SSH_AUTH_SOCK:/ssh-agent \
	    -e SSH_AUTH_SOCK=/ssh-agent \
	    --entrypoint /bin/bash \
	    $(DOCKER_IMAGE_NAME)

push: build
	docker push $(DOCKER_IMAGE_NAME)
