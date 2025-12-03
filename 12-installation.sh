#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root priveleges"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installing MYSQL is failure"
else
    echo "Installing MYSQL is success"
fi