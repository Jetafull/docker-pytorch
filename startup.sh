sudo service ssh start
docker rm -f pytorch04
docker run -itd --name pytorch04 -v /home/linlin/Downloads/:/home/downloads -v /media/WD_4TB/database/:/home/database --runtime=nvidia --net=host jetafull/deeplearning:cuda9.0 bash
docker start pytorch04
docker exec -it pytorch04 jupyter lab --ip=192.168.1.3 --allow-root --NotebookApp.token=''
#./ngrok start --all

