module ApplicationHelper
  def money_display(number)
     number_with_delimiter(((number.to_f)/100).round(2))
  end

  def commission_calc(gross, net)
    number_with_delimiter((net.to_f - gross.to_f)/100)
  end
end
