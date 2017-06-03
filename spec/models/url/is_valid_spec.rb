require 'rails_helper'

RSpec.describe Url::IsValid, type: :model do
  describe "http" do
    it "with existed url" do
      expect(Url::IsValid.('http://google.com')). to be true
    end

    it "with non existed url" do
      expect(Url::IsValid.('http://nonnonononnononnonononfoobar.com')). to be false
    end

    it "with invalid url" do
      expect(Url::IsValid.('foobar')). to be false
    end
  end
end
