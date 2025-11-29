dnf module disable nodejs -y
dnf module enable nodejs:20 -y

dnf install nodejs -y

cp user.service /etc/systemd/system/user.service
useradd roboshop

mkdir /app
# shellcheck disable=SC2164
cd /app

curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user-v3.zip
unzip /tmp/user.zip

npm install

systemctl daemon-reload

systemctl enable user
systemctl restart user