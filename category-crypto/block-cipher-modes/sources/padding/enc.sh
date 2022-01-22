#!/bin/bash
openssl enc -aes-128-cbc -e -in 5bytes.txt -out enc_5bytes.txt -K 00112233445566778889aabbccddeeff -iv 0102030405060708
openssl enc -aes-128-cbc -e -in 10bytes.txt -out enc_10bytes.txt -K 00112233445566778889aabbccddeeff -iv 0102030405060708
openssl enc -aes-128-cbc -e -in 16bytes.txt -out enc_16bytes.txt -K 00112233445566778889aabbccddeeff -iv 0102030405060708


