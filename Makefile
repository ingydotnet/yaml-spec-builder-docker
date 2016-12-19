DOCKER_IMAGE_NAME := yamlio/yaml-spec-builder
YAML_SPEC := yaml-spec
YAML_SPEC_REPO := git@github.com:yaml/$(YAML_SPEC)

.PHONY: spec
spec: $(YAML_SPEC)
	rm -fr ./spec/
	( \
	    set -x; \
	    cd $<; \
	    docker run -v $$PWD:/$< $(DOCKER_IMAGE_NAME) \
	)
	mv $</spec ./spec

$(YAML_SPEC):
	git clone $(YAML_SPEC_REPO) $@

clean:
	rm -fr spec $(YAML_SPEC)

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
