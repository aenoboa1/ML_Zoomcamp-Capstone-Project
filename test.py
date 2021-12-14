#!/usr/bin/env python
# coding: utf-8

import requests

url = 'http://localhost:8080/2015-03-31/functions/function/invocations'

data = {'url': 'https://i.imgur.com/Wj4Lajm.png'}

result = requests.post(url, json=data).json()
print(result)