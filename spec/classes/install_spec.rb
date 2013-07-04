require 'spec_helper'

describe 'puppetdb::install', :type => 'class' do
  it do
    should contain_package('puppetdb').with({
      :name   => 'puppetdb',
      :ensure => 'installed',
    })
  end
end

