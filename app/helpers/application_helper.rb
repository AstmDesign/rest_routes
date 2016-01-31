module ApplicationHelper

  def ReverseField(object,field)
    object.update_attribute("#{field}",!object["#{field}"])
  end

end
