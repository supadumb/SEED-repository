#!/bin/bash
openssl enc -aes-128-cbc -d  -in enc_5bytes.txt  -out dec_5bytes.txt  -K 00112233445566778889aabbccddeeff -iv 0102030405060708 -nopad
openssl enc -aes-128-cbc -d  -in enc_10bytes.txt -out dec_10bytes.txt -K 00112233445566778889aabbccddeeff -iv 0102030405060708 -nopad
openssl enc -aes-128-cbc -d  -in enc_16bytes.txt -out dec_16bytes.txt -K 00112233445566778889aabbccddeeff -iv 0102030405060708 -nopad


