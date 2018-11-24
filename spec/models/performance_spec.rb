require 'rails_helper'

RSpec.describe Performance, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:exercise) }

    it { should belong_to(:workout) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
