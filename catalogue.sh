dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y


cp catalogue.service /etc/systemd/system/catalogue.service
cp mongo.repo /etc/yum.repos.d/mongo.repo
useradd roboshop


# shellcheck disable=SC2164


mkdir /app
cd /app
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip
unzip /tmp/catalogue.zip

npm install

systemctl daemon-reload
dnf install mongodb-mongosh -y
mongosh --host 100.28.228.217 </app/db/master-data.js

systemctl enable catalogue
systemctl restart catalogue