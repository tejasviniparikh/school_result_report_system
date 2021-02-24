class School < ApplicationRecord
  has_many :school_reports, dependent: :destroy
  accepts_nested_attributes_for :school_reports, allow_destroy: true, reject_if: :all_blank, update_only: true
end
