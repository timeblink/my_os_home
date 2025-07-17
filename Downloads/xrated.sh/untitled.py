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

m3u8_url_file      = os.environ['HOME']+"/Desktop/my_os_home/Downloads/xrated.sh/url.txt"
# file_url_href      = os.environ['HOME']+"/Desktop/my_os_home/Downloads/xrated.sh/url_href.txt"
file_url_playlist  = os.environ['HOME']+"/Desktop/my_os_home/Downloads/xrated.sh/url_playlist.txt"
file_url_playlist2 = os.environ['HOME']+"/Desktop/my_os_home/Downloads/xrated.sh/url_playlist_2.txt"

url_root_path = "https://vyqtnxbc.top:2549"

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

def open_src_url(src_url):
  has_url = search_in_file(file_url_playlist,file_url_playlist2,src_url)
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
  #finally:
  #  print(url_tag)
  for b in b_list:
    open_src_url(b.get('src'))

def open_page_url(page_url):
  a_list = []
  try:
    # 打开列表网页后，针对性的搜索具体的div
    a_list = open_url(page_url).find_all(tag_div_class_listpic)
  except Exception as e:
    print(str(e))
    return 0
  #finally:
  #  print(page_url)
  for tag_href in map(lambda x:get_tag_href(x),a_list):
    open_tag_url(tag_href)

def loop_list_page(list_url,loop_start=1,loop_int=1):
  for i in range(loop_start,loop_start+loop_int,1):
    # 打开具体的列表网页，并且进行解析
    open_page_url(list_url+str(i))

if __name__ == "__main__":
  url_list = []
  url_list.append(
    '{url_root}/vod/list.html?type_id=1070&page=,{start},{end}'.format(
      url_root=url_root_path,start=1,end=5))
  url_list.append(
    '{url_root}/vod/list.html?type_id=1071&page=,{start},{end}'.format(
      url_root=url_root_path,start=1,end=5))
  from selenium import webdriver
  from selenium.webdriver.firefox.options import Options
  opt = Options()
  opt.add_argument("--headless")
  opt.add_argument("--disable-gpu")
  global g_driver
  g_driver = webdriver.Firefox(options=opt)
  for url in url_list:
    url_str,page_1,page_2 = url.split(",")
    # 循环打开列表网页
    loop_list_page(url_str,int(page_1),int(page_2))
    #loop_list_page(url_str,page_1,60)
  g_driver.quit()
