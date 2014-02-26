require 'spec_helper'

describe LedgerImportsController do
  context '#create' do
    it 'should throw an error if no file is specified' do
      expect { get :create }.to raise_error ActionController::ParameterMissing
    end
  end
end
