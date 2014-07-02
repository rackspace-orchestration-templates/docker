# Encoding: utf-8

require_relative 'spec_helper'

os = property[:os][:family]

describe group('docker') do
  it { should exist }
end

describe kernel_module('aufs'), :if => os == 'Ubuntu' do
  it { should be_loaded }
end

describe command('docker ps -a|grep busybox|grep "Exit 0"') do
  it { should return_exit_status 0 }
end
