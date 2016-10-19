#
# Cookbook Name:: chefazure-ch06
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'chefazure-ch06::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'deletes the test.txt file' do
      expect(chef_run).to delete_file('c:/test.txt')
    end
  end
end
