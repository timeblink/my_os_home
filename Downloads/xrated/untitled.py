#!/usr/bin/env python
# -*- coding:utf-8 -*-

'''
===============================================================================
 Copyright (c) 2024- txlu

===============================================================================

 @file
 @brief
 @details
 @version 1.0
 @author  lutx0528
 @date    2024-03-24

 Edit History
 ------------------------------------------------------------------------------
 DATE            NAME               DESCRIPTION
 2024-03-24      lutx0528           Create it.
'''

import os
# import sys
# import json
# import shutil
# import argparse
# import traceback


headers = {
"Cache-Control": "no-cache",
"Pragma": "no-cache"
}


file_url_href      = os.environ['HOME']+"/Downloads/XRated/url_href.txt"
file_url_playlist  = os.environ['HOME']+"/Downloads/XRated/url_playlist.txt"
file_url_playlist2 = os.environ['HOME']+"/Downloads/XRated/url_playlist_2.txt"


def tag_div_class_listpic(tag):
    if tag.name != 'div':
        return False
    if not tag.has_attr('class'):
        return False
    return 'listpic' in tag.get('class')


def tag_source(tag):
    if tag.name != 'source':
        return False
    if not tag.has_attr('src'):
        return False
    return True


def get_tag_href(tag):
    return "https://sdyxldkphs.xyz"+tag.find_all(["a"])[0].get('href')


def open_url(url):
    import requests
    response = requests.get(url,headers=headers)
    content = response.text
    response.close()
    from bs4 import BeautifulSoup
    return BeautifulSoup(content,'html.parser')


def search_in_file(file_path1,file_path2,search_text):
    result = False
    with open(file_path1, 'r') as file:
        content = file.read()
        if search_text in content:
            result = True
    with open(file_path2, 'r') as file:
        content = file.read()
        if search_text in content:
            result = True
    return result


if __name__ == "__main__":
    for i in range(1,80,1):
        url_str = "https://sdyxldkphs.xyz/vod/list.html?type_id=1070&page="+str(i)
        a_list = open_url(url_str).find_all(tag_div_class_listpic)
        for href in map(lambda x:get_tag_href(x),a_list):
            with open(file_url_href,"a") as file:
                file.write(href+"\n")
            for b in open_url(href).find_all(tag_source):
                src_url_txt = b.get('src')
                has_url = search_in_file(file_url_playlist,file_url_playlist2,src_url_txt)
                if not has_url:
                    print(f"{src_url_txt}")
                    with open(file_url_playlist,"a") as file:
                        file.write(src_url_txt+"\n")
