YAML Spec Builder
=================

A docker image to build the YAML spec from source.

# Usage

With just a simple docker command, you can build the YAML Spec HTML from the
source repo:


```
git clone git@github.com/yaml/yaml-spec
cd yaml-spec
docker run -v $PWD:/yaml-spec ingy/yaml-spec-builder
firefox spec.html
```

or just run this:

```
make run
```

which will do the same thing.
