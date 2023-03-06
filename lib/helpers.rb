module ColorSchemeHelper
  def color_scheme(scheme: 'blue')
    case scheme
    when 'blue'
      return 'bg-primary text-light'
    when 'neutral'
      return 'bg-light text-dark border-dark'
    else
      return 'bg-light text-dark border-dark'
    end
  end
end