#!/bin/bash
openssl enc -aes-128-ecb -in plaintext.txt -out ecb_enc.txt -K 00112233445566778899aabbccddeeff
openssl enc -aes-128-cbc -in plaintext.txt -out cbc_enc.txt -K 00112233445566778899aabbccddeeff -iv 0102030405060708
openssl enc -aes-128-cfb -in plaintext.txt -out cfb_enc.txt -K 00112233445566778899aabbccddeeff -iv 0102030405060708
openssl enc -aes-128-ofb -in plaintext.txt -out ofb_enc.txt -K 00112233445566778899aabbccddeeff -iv 0102030405060708

if [ -d "CIPHERTEXT" ] 
then 
    rm CIPHERTEXT/*
else
    mkdir CIPHERTEXT
fi

mv ecb_enc.txt cbc_enc.txt cfb_enc.txt ofb_enc.txt CIPHERTEXT


