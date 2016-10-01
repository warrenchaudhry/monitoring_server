module ApplicationHelper

  def to_percentage(val)
    number_to_percentage val, precision: 2, strip_insignificant_zeros: true
  end
end
