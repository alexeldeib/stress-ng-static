registry := "alexeldeib"
image := "stress-ng"

default: build-base build-final push-base push-final

build-base:
    docker build -t {{registry}}/{{image}}-dev:devel .

build-final:
    docker build -f Dockerfile.final --build-arg IMG={{registry}}/{{image}}-dev --build-arg TAG=devel -t {{registry}}/{{image}}:devel .
    
push-base:
    docker push {{registry}}/{{image}}-dev:devel

push-final:
    docker push {{registry}}/{{image}}:devel

extract:
    docker run -t --rm -v C:\Users\alexe\code\stress-ng-static:/work alexeldeib/stress-ng-dev:devel cp /stress-ng/stress-ng /work/stress-ng
