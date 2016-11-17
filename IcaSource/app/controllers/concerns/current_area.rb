module CurrentArea
  extend ActiveSupport::Concern
  private
      def set_current_area
        session[:area_id] = @area.id
      end

      def current_area
        Area.find(session[:area_id])
      end
end
