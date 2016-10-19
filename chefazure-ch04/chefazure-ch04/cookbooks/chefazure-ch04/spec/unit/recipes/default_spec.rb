#
# Cookbook Name:: chefazure-ch04
# Spec:: default
#
# Copyright (c) 2015 Stuart Preston, All Rights Reserved.

require 'spec_helper'

describe 'chefazure-ch04::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
