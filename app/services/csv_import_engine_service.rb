# frozen_string_literal: true

require 'csv'

class CsvImportEngineService
  def initialize
    @file = File.open('public/ResultData.csv')
  end

  def import
    CSV.parse(@file, headers: true).each do |row|
      add_school(row)
    end
  end

  def add_school(row)
    school = School.find_or_create_by(name: row['name'])
    school.assign_attributes(emis: row['emis'], center_no: row['centre_no'])
    school.save
    add_school_report(row, school.id)
  end

  def add_school_report(row, school_id)
    years = Constants::YEARS
    years.each do |year|
      next unless row["wrote_#{year}"].present?
      SchoolReport.create(year: year, wrote: row["wrote_#{year}"], passed: row["passed_#{year}"], school_id: school_id)
    end
  end
end
