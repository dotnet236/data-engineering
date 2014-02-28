require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe 'Ledger import', type: :feature do
  before :each do
    user = User.create email: 'test@test.com', password: '12345678'
    login_as(user, scope: :user)
  end

  def import_ledger
    visit '/ledger_imports/new'
    example_file = File.join Rails.root, 'spec/fixtures/valid_example_input.tab'
    attach_file 'tab_delimited_file', example_file
    click_on 'Import'
  end

  context 'create view' do
    it 'should allow import of a properly formatted tab delimited ledger' do
      import_ledger

      # TODO: Read line count from file
      expect(page).to have_css('tr', count: 5)
    end
  end

  context 'index view' do
    it 'should display the total ledger amount after import' do
      import_ledger
      find('label').text.should == 'Total Gross Revenue: $95.00'
    end
  end
end
