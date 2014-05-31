module ApplicationHelper

  def full_title(title)
    base_title = "Plannr"
    tag_line = "Find a planner for your next event"
    if title.empty?
      "#{base_title} - #{tag_line}"
    else
      "#{base_title} | #{title}"
    end
  end

  def body_id
    @body_id
  end

  def body_class
    @body_class.try(:uniq).try(:join, ' ')
  end

end
