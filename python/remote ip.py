# -*- coding: UTF-8 -*-
from urllib import request

if __name__ == "__main__":
    response = request.urlopen("http://myip.ipip.net")
    html = response.read()
    html = html.decode("utf-8")
    print(html)



