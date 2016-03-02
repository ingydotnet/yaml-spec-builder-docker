.PHONY: build

build:
	docker build -t ingy/yaml-spec-builder .

run: yaml-spec
	( \
	    set -x; \
	    cd $<; \
	    docker run -v $$PWD:/yaml-spec ingy/yaml-spec-builder \
	)

shell:
	docker run \
	    -v $$PWD:/yaml-spec-builder-docker \
	    --entrypoint /bin/bash \
	    -v $$SSH_AUTH_SOCK:/ssh-agent \
	    -e SSH_AUTH_SOCK=/ssh-agent \
	    ingy/yaml-spec-builder

push: build
	docker push ingy/yaml-spec-builder

clean:
	rm -fr yaml-spec

yaml-spec:
	git clone https://github.com/yaml/yaml-spec $@
