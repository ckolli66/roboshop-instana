#disable the different versions of nginx & then installing the version that we required for this project
dnf module disable nginx -y
dnf module enable nginx:1.24 -y
dnf install nginx -y

#Removing any nginx server content before versions have
rm -rf /usr/share/nginx/html/*

# shellcheck disable=SC2164
cd /usr/share/nginx/html #Moving to nginx server html directory
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip #Getting the frontend code

unzip /tmp/frontend.zip # extracting frontend code

cp nginx.conf /etc/nginx/nginx.conf

systemctl enable nginx
systemctl restart nginx