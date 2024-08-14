# sudo port install docker-machine
docker-machine ls
docker-machine start default

#... Virtual Machine starts ...

eval $(docker-machine env)


docker build -t 4lge/kasm-ubuntu-rstudio:main -f dockerfile-kasm-rstudio .

docker run --rm  -it --shm-size=512m -p 127.0.0.1:6901:6901 -e VNC_PW=password 4lge/kasm-ubuntu-rstudio:main 

# open http://localhost:6901
