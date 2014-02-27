require 'spec_helper'

describe LedgerImportsController do
  context '#create' do
    it 'should throw an error if no file is specified' do
      expect { post :create }.to raise_error ActionController::ParameterMissing
    end

    it 'should throw an error if the file is not correctly formated' do
      post :create, ledger_import: { tab_delimited_file: fixture_file_upload('invalid_example_input.tab', 'text/tab') }
      expect(response).to render_template('new')
    end

    it 'should accept a correctly formated file' do
      post :create, ledger_import: { tab_delimited_file: fixture_file_upload('valid_example_input.tab', 'text/tab') }
      expect(response).to redirect_to action: :index, controller: :ledger_imports, notice: 'Ledger was successfully imported.'
    end
  end
end
