dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y

useradd roboshop

mkdir /app
# shellcheck disable=SC2164
cd /app
cp catalogue.service /etc/systemd/system/catalogue.service
cp mongo.repo /etc/yum.repos.d/mongo.repo

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip
unzip /tmp/catalogue.zip

npm install
systemctl daemon-reload

dnf install mongodb-mongosh -y
mongosh --host mongodb-dev.chanakyakolli.online </app/db/master-data.js

systemctl enable catalogue
systemctl restart catalogue