module ApplicationHelper
  def tag_cloud(tags, classes)
    tags = tags.all if tags.respond_to?(:all)

    return [] if tags.empty?

    max_count = tags.sort_by(&:last).last[1]
    p tags.sort_by(&:last)
    p max_count
    tags.each do |tag|
      index = ((tag[1] / max_count) * (classes.size - 1)).round
      yield tag, classes[index]
    end
  end
end
