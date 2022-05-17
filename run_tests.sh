#!/bin/sh

set -e

if [ ! -f ".env" ]
then
    echo "Missing environment file: .env"
    exit 4
fi

. ./.env

# set TEST_REPORTS environment variable to change output directory

if [ "$1" == "headless" ]
then
    python -m robot.run \
        -v BROWSER:headlesschrome \
        -v "EDUUNI_EMAIL_PASSWORD:$EDUUNI_EMAIL_PASSWORD" \
        -v "API_KEY:$API_KEY" \
        -v "ENVIRONMENT:$ENVIRONMENT" \
        -d ${TEST_REPORTS:=test_reports} \
        tests
elif [ "$1" == "record" ]
then
    python -m robot.run \
        -v BROWSER:chrome \
        -v RECORD:True \
        -v "EDUUNI_EMAIL_PASSWORD:$EDUUNI_EMAIL_PASSWORD" \
        -v "API_KEY:$API_KEY" \
        -v "ENVIRONMENT:$ENVIRONMENT" \
        -d ${TEST_REPORTS:=test_reports} \
        tests
elif [ "$1" == "single" ]
then
    if [ "$2" == "" ]
    then
        echo "Please specify test name"
        exit 2
    fi

    python -m robot.run \
        -v BROWSER:chrome \
        -v "EDUUNI_EMAIL_PASSWORD:$EDUUNI_EMAIL_PASSWORD" \
        -v "API_KEY:$API_KEY" \
        -v "ENVIRONMENT:$ENVIRONMENT" \
        -d ${TEST_REPORTS:=test_reports} \
        -t "$2" \
        tests
else
    echo "Usage: $(basename $0) <headless|record|single> [test name]"
    exit 3
fi