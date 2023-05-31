echo -e "\e[31minstalling nginx server\e[0m"
yum install nginx -y
echo -e "\e[32mremoving old app content\e[0m"
rm -rf /usr/share/nginx/html/*
echo -e "\e[33mdownloading frontend content\e[0m'"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
echo -e "\e[34mextract frontend file\e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
## we need to copy config file
echo -e "\e[35menable nginx server\e[0m"
systemctl enable nginx
echo -e "\e[36mrestart nginx server\e[0m"
systemctl restart nginx