module ApplicationHelper
  FLASH_COLOR_SCHEME = {
    error: "red",
    notice: "green"
  }

  def flash_color_for(name)
    FLASH_COLOR_SCHEME[name.to_sym]
  end
end
