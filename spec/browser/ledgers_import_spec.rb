require 'spec_helper'

describe 'Ledger import', type: :feature do
  def import_ledger
    visit '/ledger_imports/new'
    example_file = File.join Rails.root, 'spec/fixtures/valid_example_input.tab'
    attach_file 'tab_delimited_file', example_file
    click_on 'Import'
  end

  context 'create view' do
    it 'should allow import of a properly formatted tab delimited ledger' do
      import_ledger

      #TODO: Read line count from file
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
