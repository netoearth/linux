#!/usr/bin/env python
# coding: utf-8  
#-*- coding:UTF-8 -*-
#random ip auth:hpboole 2016-4-19
#定义字典，从字典随机取一对键值，或者从字典中轮循取键值（堆栈式或队列式）
#将字典中的key用于路由route add -host $dest dev $nowkey 并删除原来的路由 route del -host $dest dev $oldkey
#这个操作将定时执行
#定义一个定时器，每隔一段时间，就将添加新的路由表，再删除原来的路由表，以使字典中的值是当前向外访问的IP地址。
import threading
import time
import os,sys,socket,random
#从字典中随机（或顺序轮循取一个设备名），并判断如果是eth0设备还是eth1的设备，并将最终取得的设备返回
#执行更换路由的操作，首先添加一个新的路由，再将旧的路由删除11111111 11111111 111111111 11000000
def ChangRoute():
  DictDevIP ={'enp1s0f0:1':'121.10.141.180',
'enp1s0f0:2':'121.10.141.182',
'enp1s0f0:3':'121.10.141.184',
'enp1s0f0:4':'121.10.141.186',
'enp1s0f0:5':'58.253.70.178',
'enp1s0f0:6':'58.253.70.180',
'enp1s0f0:7':'58.253.70.182',
'enp1s0f0:8':'58.253.70.184',
'enp1s0f0:9':'58.253.70.186',
'enp1s0f1:1':'113.107.161.190',
'enp1s0f1:2': '113.107.161.191',
'enp1s0f1:3': '113.107.161.206',
'enp1s0f1:4': '113.107.161.214',
'enp1s0f1:5': '58.253.68.186',
'enp1s0f1:6': '58.253.68.190',
'enp1s0f1:7': '58.253.68.191',
'enp1s0f1:8': '58.253.68.206',
'enp1s0f1:9': '58.253.68.214'}
  dest='0.0.0.0'
  eth0gw='121.10.141.129'
  eth1gw='113.107.161.129'
#  DevIPX = DictDevIP.values()
  RandDev = random.choice(DictDevIP.keys())
  DelDevName = RandDev
  fp = open("/opt/ethX.log", 'r')
  DelDevName = fp.readline()
  fp.close()
  fp = open("/opt/ethX.log", 'w')
  fp.write(RandDev)
  fp.close()
  if "enp1s0f0" in DelDevName:
    delroute="route del -net " + dest + " gw " + eth0gw + " dev " + DelDevName
  else :
    delroute="route del -net " + dest + " gw " + eth1gw + " dev " + DelDevName

  if "enp1s0f0" in RandDev:
    addroute="route add -net " + dest + " gw " + eth0gw + " dev " + RandDev
  else:
    addroute="route add -net " + dest + " gw " + eth1gw + " dev " + RandDev
#执行系统命令，或许也有Python的模块能用于执行，暂时用最简单的方式来执行
#  print delroute
#  print addroute
#  print "'print the command and devices:' + '\n' delroute + '\n',addroute + '\n'"
#  print "The RandDev:"
#  print RandDev
#  print "The DelDevName:"
#  print DelDevName
  os.system(delroute)
  os.system(addroute)

#这是一个定时器，用于定义多长时间执行一次。定时器存在问题，运行时有错误，暂时放一放
def RollTime(func, day=0, hour=0, min=0, second=0):
  # 初始化时间
  now = datetime.now()
  strnow = now.strftime('%Y-%m-%d %H:%M:%S')
  print "now:",strnow
  # 定义第一次运行后下次运行的时间
  period = timedelta(days=day, hours=hour, minutes=min, seconds=second)
  next_time = now + period
  strnext_time = next_time.strftime('%Y-%m-%d %H:%M:%S')
  print "next run:",strnext_time
  while True:
      # 获取系统当前时间
      iter_now = datetime.now()
      iter_now_time = iter_now.strftime('%Y-%m-%d %H:%M:%S')
      if str(iter_now_time) == str(strnext_time):
          # 获取事件运行的时间
          print "start work: %s" % iter_now_time
          #运行任务
          func()
          print "task done."
          # 获取下一个任务的时间
          iter_time = iter_now + period
          strnext_time = iter_time.strftime('%Y-%m-%d %H:%M:%S')
          print "next_iter: %s" % strnext_time
          # 继续下一个任务
          continue

def fun_timer():
	global timer
	while True:
		timer = threading.Timer(5,ChangRoute)
		timer.start()

if __name__ == '__main__':
	while True:
		timer = threading.Timer(5,ChangRoute)
		timer.start()
		time.sleep(15)
# RollTime(ChangRoute, min=0.5)
#  RollTime(ChangRoute, day=0, hour=0, min=1)

