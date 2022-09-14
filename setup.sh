minikube start --vm-driver=virtualbox
minikube addons enable metallb

eval $(minikube docker-env)

docker build -t nginx_image srcs/nginx/
docker build -t mysql_image srcs/mysql/
docker build -t wp_image srcs/wordpress/
docker build -t pma_image srcs/phpmyadmin/
docker build -t influxdb_image srcs/influxdb/
docker build -t ftps_image srcs/ftps/
docker build -t grafana_image srcs/grafana/

kubectl apply -f srcs/

minikube dashboard