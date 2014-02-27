require 'csv'

# Allows a user to import and persist a Tab Delimited File
class LedgerImportsController < ApplicationController
  before_action :set_ledger_import, only: [:show, :update, :destroy]

  # GET /ledger_imports
  def index
    @ledger_imports = LedgerImport.all
    @total_gross_revenue = LedgerImport.total_gross_revenue @ledger_imports
  end

  # GET /ledger_imports/1
  def show
  end

  # GET /ledger_imports/new
  def new
  end

  # POST /ledger_imports
  def create
    import_results = LedgerImport.import_from_tab_delimited_string ledger_import_params.read

    if import_results[:failed_imports].count == 0
      redirect_to action: :index, notice: 'Ledger was successfully imported.'
    else
      flash[:error] =
        'The following rows failed to ' +
        import_results[:failed_imports].join('/n')
      render action: 'new'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ledger_import
    puts "Action = #{request[:action]}"
    @ledger_import = LedgerImport.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def ledger_import_params
    params.require(:tab_delimited_file)
  end
end
