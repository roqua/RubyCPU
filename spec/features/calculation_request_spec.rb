require 'spec_helper'

describe "Calculation request" do
  
  let!(:calculation_request) { CalculationRequest.create(package: package, function: function, data: data) }
  let(:package) { 'stats' }
  let(:function) { 'cor' }
  let(:data) { '{"x":[1,4,2,3,5,3], "y":[1,6,7,5,4,3]}'}
  
  before :each do
    visit root_path
    click_link "New calculation request"
  end
  
  context "success" do
    
    it "can create a new calculation request" do
      select package, from: 'Package'
      fill_in 'Function', with: function
      fill_in 'Data', with: data
      click_button "Save Calculation request"
          
      expect(page).to have_content('0.32733')
      
    end
    
    it "can detect incorrect json input" do
      
      select package, from: 'Package'
      fill_in 'Function', with: function
      fill_in 'Data', with: "this is not json"
      click_button "Save Calculation request"
          
      expect(page).to have_content('Data not in json format')
      
    end
    
    it "can detect empty input" do
      
      click_button "Save Calculation request"
          
      expect(page).to have_content('Data can\'t be blank')
      expect(page).to have_content('Function can\'t be blank')
      expect(page).to have_content('Package can\'t be blank')
      
    end
    
  end
  
end
