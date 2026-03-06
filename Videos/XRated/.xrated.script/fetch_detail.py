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

detail_url         = os.environ['HOME']+"/Videos/xrated.script/url_detail.txt"
m3u8_url_file      = os.environ['HOME']+"/Videos/xrated.script/url.txt"
file_url_playlist  = os.environ['HOME']+"/Videos/xrated.script/url_playlist.txt"
url_root_path      = "https://vyqtnxbc.top:2549"

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
  return '{url_root}{tag_href}'.format(
    url_root=url_root_path,
    tag_href=tag.find_all(["a"])[0].get('href'))
  #return url_roo_path+tag.find_all(["a"])[0].get('href')

def open_url(url):
  content = "<html></html>"
  try:
    g_driver.get(url)
    content = g_driver.page_source
    #print(content)
  except:
    print("error when open "+url)
    return None
  from bs4 import BeautifulSoup
  return BeautifulSoup(content,'html.parser')

def search_in_file(file_path,search_text):
  result = False
  with open(file_path, 'r') as file1:
    content = file1.read()
    if search_text in content:
      result = True
  return result

def open_src_url(src_url):
  has_url = search_in_file(file_url_playlist,src_url)
  if not has_url:
    print(f"{src_url}")
    with open(file_url_playlist,"a") as file:
      file.write(src_url+"\n")
    with open(m3u8_url_file,"a") as file:
      file.write(src_url+"\n")

def open_tag_url(url_tag):
  b_list = []
  try:
    b_list = open_url(url_tag).find_all(tag_source)
  except:
    return 0
  finally:
    print(url_tag)
  for b in b_list:
    open_src_url(b.get('src'))

if __name__ == "__main__":
  detail_urls = []
  with open(detail_url,'r',encoding='utf-8') as f:
    detail_urls = map(lambda x:x.strip(),f.readlines())
  from selenium import webdriver
  from selenium.webdriver.firefox.options import Options
  opt = Options()
  opt.add_argument("--headless")
  opt.add_argument("--disable-gpu")
  global g_driver
  g_driver = webdriver.Firefox(options=opt)
  for i in detail_urls:
    open_tag_url(i)
  g_driver.quit()
