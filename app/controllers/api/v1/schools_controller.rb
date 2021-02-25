module Api
  module V1
    class SchoolsController < BaseApiController
      def index
        schools = School.all
        render_success({ schools: serialized_json(schools) })
      end

      def create
        school = School.find_or_create_by(name: params.dig(:school, :name))
        school.assign_attributes(school_params)
        if school.save
          render_success({ school: serialized_json(school) }, "School details added successfully.")
        else
          render_error(school)
        end
      end

      private

      def school_params
        params.require(:school).permit(:name, :emis, :center_no,
          school_reports_attributes: [
            :year, :wrote, :passed
        ])
      end

      def serialized_json(details)
        SchoolSerializer.new(details).serializable_hash.to_json
      end
    end
  end
end
