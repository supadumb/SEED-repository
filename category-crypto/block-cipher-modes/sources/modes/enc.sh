#!/bin/bash

openssl enc -aes-128-cfb -e -in plain.txt -out aes128_cipher.txt -K 00112233445566778889aabbccddeeff -iv 0102030405060708

openssl enc -bf-cbc -e -in plain.txt -out bf_cipher.txt -K 00112233445566778889aabbccddeeff -iv 0102030405060708

openssl enc -des-cbc -e -in plain.txt -out des_cipher.txt -K 00112233445566778889aabbccddeeff -iv 0102030405060708
