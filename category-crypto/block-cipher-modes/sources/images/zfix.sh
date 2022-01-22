#!/bin/bash

head -c 54 pic_original.bmp > header
tail -c +55 ecb.bmp > body_ecb
cat header body_ecb > fix_ecb.bmp

tail -c +55 cbc.bmp > body_cbc
cat header body_cbc > fix_cbc.bmp

tail -c +55 cfb.bmp > body_cfb
cat header body_cfb > fix_cfb.bmp

tail -c +55 ofb.bmp > body_ofb
cat header body_ofb > fix_ofb.bmp

