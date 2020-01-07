class Api::V1::ReportsController < ApplicationController
  def index
    render json: ReportSerializer.new(Report.all)
  end

  def create
    report = Report.new(report_params)
    if report.save
      render json: ReportSerializer.new(Report.all)
    else
      render json: "Report cannot be created"
    end
  end


  private

  def report_params
    params.permit(:user_id, :description)
  end
end
