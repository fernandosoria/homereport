class ReportsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @report = Report.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
    @report = @client.report
    authorize @client
  end

  def update
    @client = Client.find(params[:id])
    @report = @client.report
    authorize @client

    if @report.update_attributes(report_params)
      redirect_to client_report_path, notice: "Report information updated."
    else
      render :edit, error: "There was an error updating your report information. Please try again."
    end
  end

  private

  def report_params
    params.require(:report).permit(:status, :content, :user_id, :address_attributes => [:street, :city, :state, :zip, :category, :addressable_id, :addressable_type])
  end

end
