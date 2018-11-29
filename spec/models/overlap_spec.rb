require 'rails_helper'

RSpec.describe Overlap, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:firstuser) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
