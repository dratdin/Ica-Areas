module CurrentResourceType
  extend ActiveSupport::Concern

  private
    def set_current_resource_type(type)
      session[:resource_type] = type
    end

    def get_current_resource_type
      session[:resource_type]
    end

    def get_new_current_resource_type_path
      "new_" + session[:resource_type].downcase
    end
end
