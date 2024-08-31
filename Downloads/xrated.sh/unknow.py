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


file_url_href      = os.environ['HOME']+"/Public/xrated.sh/url_href.txt"
file_url_playlist  = os.environ['HOME']+"/Public/xrated.sh/url_playlist.txt"
file_url_playlist2 = os.environ['HOME']+"/Public/xrated.sh/url_playlist_2.txt"


def tag_div_class_listpic(tag):
    #print("no div tag ?")
    if tag.name != 'div':
        return False
    #print("not has class ?")
    if not tag.has_attr('class'):
        return False
    #print("tag_div_class_listpic")
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
    # import requests
    # response = requests.get(url,headers=headers)
    # # print(response.status_code)
    # # print(response.text)
    # content = response.text
    # print(content)
    # response.close()
    content = driver.find_element().text
    driver.quit()
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
    url_str = "https://sdyxldkphs.xyz/vod/list.html?type_id=1070&page=1"
    from selenium import webdriver
    driver = webdriver.Firefox()
    driver.get(url)

#    url_content = open_url(url_str)
#    print(url_content)
#    for i in range(1,80,1):
#        url_str = "https://sdyxldkphs.xyz/vod/list.html?type_id=1070&page="+str(i)
#        # url_str = "https://sdyxldkphs.xyz/vod/list.html?type_id=1071&page="+str(i)
#        print(url_str)
#        a_list = open_url(url_str).find_all(tag_div_class_listpic)
#        for href in map(lambda x:get_tag_href(x),a_list):
#            print(href)
#            with open(file_url_href,"a") as file:
#                file.write(href+"\n")
#            for b in open_url(href).find_all(tag_source):
#                src_url_txt = b.get('src')
#                print(src_url_txt)
#                has_url = search_in_file(file_url_playlist,file_url_playlist2,src_url_txt)
#                if not has_url:
#                    print(f"{src_url_txt}")
#                    with open(file_url_playlist,"a") as file:
#                        file.write(src_url_txt+"\n")
