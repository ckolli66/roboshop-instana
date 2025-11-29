dnf install maven -y


cp shipping.service /etc/systemd/system/shipping.service

useradd roboshop

mkdir /app

curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping-v3.zip
# shellcheck disable=SC2164
cd /app
unzip /tmp/shipping.zip

# shellcheck disable=SC2164
cd /app
mvn clean package
mv target/shipping-1.0.jar shipping.jar

dnf install mysql -y

mysql -h 100.27.250.232 -uroot -pRoboShop@1 < /app/db/schema.sql
mysql -h 100.27.250.232 -uroot -pRoboShop@1 < /app/db/app-user.sql
mysql -h 100.27.250.232 -uroot -pRoboShop@1 < /app/db/master-data.sql

systemctl daemon-reload
systemctl enable shipping
systemctl restart shipping