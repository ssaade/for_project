require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:invited_overlaps) }

    it { should have_many(:inviter_overlaps) }

    it { should have_many(:availabilities) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
