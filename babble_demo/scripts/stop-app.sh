#!/bin/bash

docker rm $(docker stop $(docker ps -a -q -f ancestor=simple_app))