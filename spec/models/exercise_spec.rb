require 'rails_helper'

RSpec.describe Exercise, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:performances) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
