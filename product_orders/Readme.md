Reference: https://www.youtube.com/watch?v=EQNO_kM96Mo&list=PLy7NrYWoggjziYQIDorlXjTvvwweTYoNC&index=9


crete docker hub secret:

kubectl -n mongosample create secret docker-registry dockerhub-secret \
  --docker-server=https://index.docker.io/v1/ \
  --docker-username=dockeruser \
  --docker-password=dockerpassword \
  --docker-email=emailid

##manual image pull on k3s machine
sudo ctr image pull docker.io/library/mongodb:latest
sudo ctr image pull docker.io/library/mongo-express:latest
sudo ctr image pull docker.io/library/nginx:latest

