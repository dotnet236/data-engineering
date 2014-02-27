require 'csv'

# Allows a user to import and persist a Tab Delimited File
class LedgerImportsController < ApplicationController
  before_action :set_ledger_import, only: [:show, :edit, :update, :destroy]

  # GET /ledger_imports
  def index
    @ledger_imports = LedgerImport.all
  end

  # GET /ledger_imports/1
  def show
  end

  # GET /ledger_imports/new
  def new
    @ledger_import = LedgerImport.new
  end

  # GET /ledger_imports/1/edit
  def edit
  end

  # POST /ledger_imports
  def create
    tds = ledger_import_params[:tab_delimited_file].read
    import_results = LedgerImport.import_from_tab_delimited_string tds

    if import_results[:failed_imports].count == 0
      redirect_to action: :index, notice: 'Ledger was successfully imported.'
    else
      flash[:error] = "The following rows failed to import \n" + import_results[:failed_imports].join("/t")
      render action: 'new'
    end
  end

  # PATCH/PUT /ledger_imports/1
  def update
    if @ledger_import.update(ledger_import_params)
      redirect_to @ledger_import, notice: 'Ledger import was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /ledger_imports/1
  def destroy
    @ledger_import.destroy
    redirect_to ledger_imports_url, notice: 'Ledger import was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ledger_import
    @ledger_import = LedgerImport.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def ledger_import_params
    params.require(:ledger_import).permit(:tab_delimited_file)
  end
end
