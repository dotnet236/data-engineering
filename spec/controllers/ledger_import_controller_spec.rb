describe LedgerImportsController do
  context '#create' do
    it 'should return a 400 if no file is specified' do
      get :create
      response.status.should == 400
    end
  end
end
