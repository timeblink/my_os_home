#!/usr/bin/env python
# -*- coding:utf-8 -*-

'''
===============================================================================
 Copyright (c) 2026- txlu

===============================================================================

 @file
 @brief
 @details
 @version 1.1
 @author  lutx0528
 @date    2026-02-05

 Edit History
 ------------------------------------------------------------------------------
 DATE            NAME               DESCRIPTION
 2026-02-05      lutx0528           Create it.
'''

import os

comico_url    = os.environ['HOME']+"/Videos/XRated/.xrated.script/url_comico_list.txt"
url_root_path = "https://vyqtnxbc.top:2549"

def get_tag_href(tag):
  tag_a = tag.find_all(["a"])[0]
  tag_a_url = '{url_root}{tag_href}'.format(
    url_root=url_root_path,tag_href=tag_a.get('href'))
  tag_a_str = tag_a.find_all("div",class_="vodname")[0].string
  return '{tag_a_url}  {tag_a_str}'.format(
    tag_a_url=tag_a_url.split('&')[0],tag_a_str=tag_a_str)

def open_url(url):
  content = "<html></html>"
  try:
    g_driver.get(url)
    content = g_driver.page_source
  except:
    print("error when open "+url)
    return None
  from bs4 import BeautifulSoup
  return BeautifulSoup(content,'html.parser')

def tag_div_class_listpic(tag):
  if tag.name != 'div':
    return False
  if not tag.has_attr('class'):
    return False
  return 'listpic' in tag.get('class')

def open_page_url(page_url):
  a_list = []
  try:
    # 打开列表网页后，针对性的搜索具体的div
    a_list = open_url(page_url).find_all(tag_div_class_listpic)
  except Exception as e:
    print(str(e))
    return 0
  for tag_href in map(lambda x:get_tag_href(x),a_list):
    with open(comico_url,"a") as file:
      file.write(tag_href+"\n")

def loop_list_page(list_url,loop_start=1,loop_int=1):
  for i in range(loop_start,loop_start+loop_int,1):
    # 打开具体的列表网页，并且进行解析
    open_page_url(list_url+str(i))

if __name__ == "__main__":
  vod_url_str = '{url_root}/pic/list.html'.format(url_root=url_root_path)
  url_list = []
  for x in [1083]:
    url_str = '{vod_url}?cate_id={id}&page=,{start},{end}'.format(
              vod_url=vod_url_str,id=x,start=1,end=305)
    url_list.append(url_str)
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
  g_driver.quit()
