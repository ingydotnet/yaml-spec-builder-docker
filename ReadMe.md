YAML Spec Builder
=================

A docker image to build the YAML spec from source.

# Usage

With just a simple docker command, you can build the YAML Spec HTML from the
source repo:


```
git clone git@github.com/yaml/yaml-spec
cd yaml-spec
docker run -v $PWD:/yaml-spec yamlio/yaml-spec-builder
cd ..
cp yaml-spec/spec ./spec
```

or just run this:

```
make spec
```

which will do the same thing.
