#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root priveleges"
    exit 1 # failure is otherthan 0
fi

VALIDATE(){ # functions reeive inputs through args
    if [ $1 -ne 0 ]; then
        echo "ERROR:: Installing $2 is failure"
        exit 1
    else
        echo "Installing $2 is success"
        
    fi
}

dnf install mysql -y
VALIDATE $? "MYSQL"


dnf install nginx -y
VALIDATE $? "Nginx"


dnf install mongodb-mongosh -y
VALIDATE $? "mongosh"