module ColorSchemeHelper
  def color_scheme(scheme: "blue")
    case scheme
    when "blue"
      "bg-primary text-light"
    when "neutral"
      "bg-light text-dark border-dark"
    else
      "bg-light text-dark border-dark"
    end
  end
end
