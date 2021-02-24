class SchoolSerializer
  include JSONAPI::Serializer
  attributes :name, :emis, :center_no, :school_reports
end
