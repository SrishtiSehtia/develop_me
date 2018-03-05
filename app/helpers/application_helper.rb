module ApplicationHelper
  FLASH_COLOR_SCHEME = {
    error: "red",
    notice: "green"
  }

  def flash_color_for(name)
    p name.to_sym

   p FLASH_COLOR_SCHEME[name.to_sym]
    FLASH_COLOR_SCHEME[name.to_sym]

  end
end
