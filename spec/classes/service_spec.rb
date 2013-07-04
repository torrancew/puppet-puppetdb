require 'spec_helper'

describe 'puppetdb::service', :type => 'class' do
  it do
    should contain_service('puppetdb').with({
      :name   => 'puppetdb',
      :ensure => 'running',
      :enable => true,
    })
  end
end

