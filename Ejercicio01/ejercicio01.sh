#!/bin/bash
# Run nginx container detached and then make a request to localhost to the mapped port to get myname.html content
docker run -d -p 8080:80 -v "$PWD"/site:/usr/share/nginx/html:ro nginx
curl localhost:8080/myname.html
