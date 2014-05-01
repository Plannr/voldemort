module ApplicationHelper

  def full_title(title)
    base_title = "Plannr"

    if title.empty?
      base_title
    else
      "#{title} | #{base_title}"
    end
  end

  def body_id
    @body_id
  end

  def body_class
    @body_class.try(:uniq).try(:join, ' ')
  end

end
