#!/bin/bash
openssl enc -d -aes-128-ecb -in CIPHERTEXT/ecb_enc.txt -out ecb_dec.txt -K 00112233445566778899aabbccddeeff
openssl enc -d -aes-128-cbc -in CIPHERTEXT/cbc_enc.txt -out cbc_dec.txt -K 00112233445566778899aabbccddeeff -iv 0102030405060708
openssl enc -d -aes-128-cfb -in CIPHERTEXT/cfb_enc.txt -out cfb_dec.txt -K 00112233445566778899aabbccddeeff -iv 0102030405060708
openssl enc -d -aes-128-ofb -in CIPHERTEXT/ofb_enc.txt -out ofb_dec.txt -K 00112233445566778899aabbccddeeff -iv 0102030405060708

if [ -d "PLAINTEXT_AFTER_MODIFY" ] 
then 
    rm PLAINTEXT_AFTER_MODIFY/*
else
    mkdir PLAINTEXT_AFTER_MODIFY
fi

mv ecb_dec.txt cbc_dec.txt cfb_dec.txt ofb_dec.txt PLAINTEXT_AFTER_MODIFY


