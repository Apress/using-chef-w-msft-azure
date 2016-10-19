#
# Cookbook Name:: chefazure-ch01
# Recipe:: default
#
# Copyright (c) 2015 Stuart Preston, All Rights Reserved.

file 'chefazure.txt' do
  action :create
  content 'Using Chef with Azure'
end
