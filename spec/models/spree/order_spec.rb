require 'spec_helper'

describe Spree::Order do
  context 'When gift changed' do
    before do
      subject.stub gift_changed?: true
      subject.stub update_gift_adjustment: true
    end

    it 'update gift adjustment' do
      subject.should_receive :update_gift_adjustment
      subject.save
    end
  end
end
