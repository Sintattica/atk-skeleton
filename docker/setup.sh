#!/bin/bash

eval "$(ssh-agent -s)"
ssh-add /root/.ssh/id_rsa