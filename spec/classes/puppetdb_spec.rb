require 'spec_helper'

describe 'puppetdb', :type => 'class' do
  it do
    should contain_class 'puppetdb::install'
    should contain_class 'puppetdb::configure'
    should contain_class 'puppetdb::service'
  end
end

