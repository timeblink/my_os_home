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
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.firefox.options import Options

detail_url      = os.environ['HOME']+"/Videos/XRated/.xrated.script/url_comico_detail.txt"
download_root   = os.environ['HOME']+"/Pictures/xrated"
url_root_path   = "https://vyqtnxbc.top:2549"

def tag_source(tag):
  if tag.name != 'img':
    return False
  if not tag.has_attr('src'):
    return False
  return True

def open_url(url):
  content = "<html></html>"
  try:
    g_driver.get(url)
    content = g_driver.page_source
  except:
    print("error when open "+url)
    return None
  return BeautifulSoup(content,'html.parser')

def open_tag_url(url_tag):
  url_id = url_tag.split('=')[1]
  b_list = []
  try:
    b_list = open_url(url_tag).find_all(tag_source,class_="details-banner-imgs")
  except:
    return 0
  for b in b_list:
    download_path='{download_root}/{sub_path}'.format(download_root=download_root,sub_path=url_id)
    if os.path.isfile(download_path):
      os.remove(download_path)
    if not os.path.isdir(download_path):
      from pathlib import Path
      Path.mkdir(download_path,mode=0o755)
    with open('{download_path}/url.txt'.format(download_path=download_path),"a") as file:
      file.write(b.get('src')+"\n")

if __name__ == "__main__":
  detail_urls = []
  with open(detail_url,'r',encoding='utf-8') as f:
    detail_urls = map(lambda x:x.strip(),f.readlines())
  opt = Options()
  opt.add_argument("--headless")
  opt.add_argument("--disable-gpu")
  global g_driver
  g_driver = webdriver.Firefox(options=opt)
  try:
    for i in detail_urls:
      open_tag_url(i)
  except:
    print(str(e))
    exit(1)
  finally:
    g_driver.quit()
