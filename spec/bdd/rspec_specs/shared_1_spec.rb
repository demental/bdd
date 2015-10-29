require 'spec_helper'

describe 'Zombie' do

  before(:each) do
    Given 'pre-condition A' do
    end
  end

  after(:each) do
    Then 'and it is stil a zombie' do
    end
  end

  it 'is alive' do
    When 'it performs action B' do
    end

    Then 'post-condition AB is expected' do
    end
  end

  it 'is dead' do
    When 'it performs action C' do
    end

    Then 'post-condition AC is expected' do
    end
  end

end



