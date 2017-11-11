#!/usr/bin/env python3

import requests

city = requests.get('https://ipinfo.io/city')
print(city.text)
