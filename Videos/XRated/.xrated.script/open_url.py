#!/usr/bin/env python
# -*- coding:utf-8 -*-

'''
===============================================================================
 Copyright (c) 2026- txlu

===============================================================================

 @file
 @brief
 @details
 @version 1.0
 @author  lutx0528
 @date    2026-04-20

 Edit History
 ------------------------------------------------------------------------------
 DATE            NAME               DESCRIPTION
 2026-04-20      lutx0528           Create it.
'''

import os
import sys
import argparse
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.firefox.options import Options

if __name__ == "__main__":
  parser = argparse.ArgumentParser(prog="python {}".format(sys.argv[0]))
  parser.add_argument('--debug',action='store_true',default=False)
  parser.add_argument('--url',action='store')
  parser.add_argument('--file',action='store',default="url.html")
  args = parser.parse_args()
  #print(args.url)

  opt = Options()
  opt.add_argument("--headless")
  opt.add_argument("--disable-gpu")
  global g_driver
  g_driver = webdriver.Firefox(options=opt)


  content = "<html></html>"
  try:
    g_driver.get(args.url)
    content = g_driver.page_source
  except:
    print("error when open "+args.url)
    sys.exit(1)
  finally:
    g_driver.quit()
    #print(BeautifulSoup(content,'html.parser'))
    #print(content)
    #print(BeautifulSoup(content,'html.parser').prettify())
    with open(args.file,"a") as file:
      file.write(BeautifulSoup(content,'html.parser').prettify())
