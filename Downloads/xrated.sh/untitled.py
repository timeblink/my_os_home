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
  content = "<html></html>"
  ###############################################
  # import requests
  # headers = {
  #   "Cache-Control": "no-cache",
  #   "Pragma": "no-cache"
  # }
  # response = requests.get(url,headers=headers)
  # content = response.text
  # response.close()
  ###############################################
  try:
    g_driver.get(url)
    content = g_driver.page_source
  except:
    print("error when open "+url)
    return None
  from bs4 import BeautifulSoup
  return BeautifulSoup(content,'html.parser')

def search_in_file(file_path1,file_path2,search_text):
  result = False
  with open(file_path1, 'r') as file1:
    content = file1.read()
    if search_text in content:
      result = True
  with open(file_path2, 'r') as file2:
    content = file2.read()
    if search_text in content:
      result = True
  return result

def loop_list_page(list_url,loop_int):
  for i in range(1,loop_int,1):
    url_str = list_url+str(i)
    #print(url_str)
    a_list = []
    try:
      a_list = open_url(url_str).find_all(tag_div_class_listpic)
    except:
      continue
    finally:
      print(url_str)
    for href in map(lambda x:get_tag_href(x),a_list):
      print(href)
      #continue
      with open(file_url_href,"a") as file:
        file.write(href+"\n")
      b_list = []
      try:
        b_list = open_url(href).find_all(tag_source)
      except:
        continue
      finally:
        print(href)
      for b in b_list:
        src_url_txt = b.get('src')
        #print(src_url_txt)
        has_url = search_in_file(file_url_playlist,file_url_playlist2,src_url_txt)
        if not has_url:
          print(f"{src_url_txt}")
          with open(file_url_playlist,"a") as file:
            file.write(src_url_txt+"\n")

if __name__ == "__main__":
  url_str = "https://sdyxldkphs.xyz/vod/list.html?type_id=1070&page="
  url_str = "https://sdyxldkphs.xyz/vod/list.html?type_id=1071&page="
  from selenium import webdriver
  from selenium.webdriver.firefox.options import Options
  opt = Options()
  opt.add_argument("--headless")
  opt.add_argument("--disable-gpu")
  global g_driver
  g_driver = webdriver.Firefox(options=opt)
  loop_list_page(url_str,100)
  #loop_list_page(url_str,2)
  g_driver.quit()

