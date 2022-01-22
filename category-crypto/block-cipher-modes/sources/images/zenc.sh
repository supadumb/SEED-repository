#!/bin/bash
openssl enc -aes-128-ecb -e -in pic_original.bmp -out ecb.bmp -K 2b7e151628aed2a6abf7158809cf4f3c

openssl enc -aes-128-cbc -e -in pic_original.bmp -out cbc.bmp -K 2b7e151628aed2a6abf7158809cf4f3c -iv 000102030405060708090a0b0c0d0e0f

openssl enc -aes-128-cfb -e -in pic_original.bmp -out cfb.bmp -K 2b7e151628aed2a6abf7158809cf4f3c -iv 000102030405060708090a0b0c0d0e0f

openssl enc -aes-128-ofb -e -in pic_original.bmp -out ofb.bmp -K 2b7e151628aed2a6abf7158809cf4f3c -iv 000102030405060708090a0b0c0d0e0f
