# Commands & script to run containers and respective netcats
# I could omit sudos, I guess, but it's easier to copy-paste by hand like this

# Command used to build the image:
# sudo docker build -t alpine-netcat .
# sudo docker save alpine-netcat:latest -o ./image/alpine-netcat.tar.gz
# sudo chmod a+r ./image/alpine-netcat.tar.gz

sudo docker load < ./image/alpine-netcat.tar.gz

sudo docker network create --driver bridge cattest

sudo docker container rm server
sudo docker container rm client

sudo docker run --network cattest --expose 7777 --name server -v $(pwd):/root -w /root --detach alpine-netcat:latest /bin/sh server.sh
sudo docker run --network cattest --link server --name client -v $(pwd):/root -w /root -ti alpine-netcat:latest /bin/sh client.sh

