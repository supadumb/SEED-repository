#!/bin/bash
python3 diff.py plaintext.txt PLAINTEXT_AFTER_MODIFY/ecb_dec.txt
python3 diff.py plaintext.txt PLAINTEXT_AFTER_MODIFY/cbc_dec.txt
python3 diff.py plaintext.txt PLAINTEXT_AFTER_MODIFY/cfb_dec.txt
python3 diff.py plaintext.txt PLAINTEXT_AFTER_MODIFY/ofb_dec.txt
