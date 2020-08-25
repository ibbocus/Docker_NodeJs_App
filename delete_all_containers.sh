#!/bin/bash

docker rm -f $(docker ps -a --format "{{.ID}}")
