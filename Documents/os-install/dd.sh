#!/bin/bash

sudo dd if=xxx.iso of=/dev/sdb bs=4M status=progress oflag=sync
