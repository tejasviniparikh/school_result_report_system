class ReportsController < ApplicationController
  def show
    @schools = School.all
  end

  def school_wise_line_chart
    @school = School.find(params[:school_id])
  end

  def year_wise_result
    result = SchoolReport.where(year: params[:year])
    wrote_count = result.sum(:wrote)
    passed_count = result.sum(:passed)
    @data = Constants::COLUMNS.zip([wrote_count, passed_count])
  end
end
