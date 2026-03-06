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

url_root_path = "https://vyqtnxbc.top:2549"

def tag_div_class_listpic(tag):
  #print("tag_div_class_listpic: no div tag ?")
  if tag.name != 'div':
    return False
  #print("tag_div_class_listpic: not has class ?")
  if not tag.has_attr('class'):
    return False
  #print("tag_div_class_listpic: tag_div_class_listpic")
  return 'listpic' in tag.get('class')

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
  except* Exception as e:
    print(f'caught {type(e)} with nested {e.exceptions}')
    print("error when open "+url)
    #return None
  from bs4 import BeautifulSoup
  return BeautifulSoup(content,'html.parser')

def open_src_url(src_url):
  print('open_src_url: {}'.format(src_url))

def tag_source(tag):
  if tag.name != 'img':
    return False
  if tag.get('class') != 'details-banner-imgs':
    return False
  if not tag.has_attr('src'):
    return False
  return True

def open_tag_url(url_tag):
  #print('open_tag_url: {}'.format(url_tag))
  b_list = []
  try:
    b_list = open_url(url_tag).find_all(tag_source)
  except:
    return 0
  for b in b_list:
    open_src_url(b.get('src'))

def open_page_url(page_url):
  #print('open_page_url: {}'.format(page_url))
  #return
  a_list = []
  try:
    # 打开列表网页后，针对性的搜索具体的div
    a_list = open_url(page_url).find_all(tag_div_class_listpic)
  except Exception as e:
    print(str(e))
    return 0
  for tag_href in map(lambda x:get_tag_href(x),a_list):
    open_tag_url(tag_href)

def loop_list_page(list_url,loop_start=1,loop_int=1):
  for i in range(loop_start,loop_start+loop_int,1):
    # 打开具体的列表网页，并且进行解析
    open_page_url(list_url+str(i))

if __name__ == "__main__":
  url_list = []
  url_list = map(
    lambda x:'{url_root}/pic/list.html?cate_id={cid}&page=,1,1'.format(
      url_root=url_root_path,cid=x),
    ['1084','1081'])
  from selenium import webdriver
  from selenium.webdriver.firefox.options import Options
  from selenium.webdriver.firefox.firefox_profile import FirefoxProfile
  opt = Options()
  opt.add_argument("-headless")
  opt.add_argument("-disable-gpu")
  firefox_profile = FirefoxProfile()
  firefox_profile.set_preference("javascript.enabled", True)
  opt.profile = firefox_profile
  global g_driver
  g_driver = webdriver.Firefox(options=opt)
  for url in url_list:
    url_str,page_1,page_2 = url.split(",")
    # 循环打开列表网页
    loop_list_page(url_str,int(page_1),int(page_2))
  g_driver.quit()
