sudo docker stop $(docker ps -aq)
sudo docker rm $(docker ps -aq)
sudo docker rmi $(docker images -q)
sudo docker images
sudo docker  ps -a