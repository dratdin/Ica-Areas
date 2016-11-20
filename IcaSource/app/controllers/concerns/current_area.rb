module CurrentArea
  extend ActiveSupport::Concern

  def set_current_area
    session[:area_id] = @area.id
  end

  public
    def current_area
      Area.find(session[:area_id])
    end
end
