docker run -itd --name pytorch04 -v /home/linlin/Downloads/:/home/downloads -v /media/WD_4TB/database/:/home/database --runtime=nvidia --net=host jetafull/deeplearning:cuda9.0 bash
