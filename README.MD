## What ?

django project runtime docker image builder based on centos, and now compatible with `s2i`


## Feather

1. install system pkg by yum, or by your own
2. hook scripts pre and post building stages
3. compatible with the way `s2i` runs 

## Operation

```shell
# REGISTRY need to be changed in Makefile

$ make image && make push
```

## Vulnerabilities

```shell
# login docker.hub.com
docker scan centos8-python-django

# there maybe some vulnerabilities, headache !!!
```
