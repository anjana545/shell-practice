#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shell-script" 
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER  # -p validates if log_folder is available or not
echo " Script started executed at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root priveleges"
    exit 1 # failure is otherthan 0
fi

VALIDATE(){ # functions reeive inputs through args
    if [ $1 -ne 0 ]; then
        echo -e "ERROR:: Installing $2 ... $R failure $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "Installing $2 ... $G is success $N" | tee -a $LOG_FILE
        
    fi
}

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MYSQL"
else 
    echo -e "MYSQL already exists .. $Y SKIPPING $N" | tee -a $LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "NGINX"
else 
    echo -e "NGINX already exists .. $Y SKIPPING $N" | tee -a $LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "PYTHON3"
else 
    echo -e "PYTHON already exists .. $Y SKIPPING $N" | tee -a $LOG_FILE
fi



