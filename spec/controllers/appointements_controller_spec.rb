require 'rails_helper'

RSpec.describe AppointementsController, type: :controller do
  context "test" do
    it "displays all appointements" do
      get :index
    end
  end
end