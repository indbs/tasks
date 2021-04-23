docker build . -t webappbuilder
docker tag webappbuilder 178.154.193.215:8123/webappbuilder
docker push 178.154.193.215:8123/webappbuilder