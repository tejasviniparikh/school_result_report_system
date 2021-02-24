# frozen_string_literal: true

module Api
  module V1
    class BaseApiController < ActionController::API
      def success_json(data, message = '')
        data.merge(message: message, success: true)
      end

      def error_json(detail)
        {
          errors: errors(detail),
          success: false
        }
      end

      def render_success(data, message = '')
        render json: success_json(data, message), status: 200
      end

      def render_error(data)
        render json: error_json(data), status: 200
      end

      private

      def errors(detail)
        return detail if detail.is_a? String

        detail.errors.full_messages.join(', ')
      end
    end
  end
end
