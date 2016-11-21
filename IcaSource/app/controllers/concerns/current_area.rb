module CurrentArea
  extend ActiveSupport::Concern

  def set_current_area
    session[:area_id] = @area.id
  end

  private
    def current_area
      Area.find(session[:area_id])
    end
end
