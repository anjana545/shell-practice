#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root priveleges"
    exit 1 # failure is otherthan 0
fi

VALIDATE(){ # functions reeive inputs through args
    if [ $1 -ne 0 ]; then
        echo -e "ERROR:: Installing $2 ... $R failure $N"
        exit 1
    else
        echo "Installing $2 ... $G is success $N"
        
    fi
}

dnf list installed mysql

if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else 
    echo "MYSQL already exists .. $Y SKIPPING $N"
fi

dnf list installed nginx

if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "NGINX"
else 
    echo "NGINX already exists .. $Y SKIPPING $N"
fi

dnf list installed python

if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "MYSQL"
else 
    echo "PYTHON already exists .. $Y SKIPPING $N"
fi

