class Post < ApplicationRecord
  include ActionView::Helpers::SanitizeHelper


  has_many :comments
  has_rich_text :content


  def first_paragraph
    return "" if content.blank?

    content_html = content.to_s
    first_paragraph_match = content_html.match(/<p>(.*?)<\/p>/)
    first_paragraph_text = first_paragraph_match ? first_paragraph_match[1] : ""

    # You can remove the following line if you don't need to remove additional HTML tags from the first paragraph
    strip_tags(first_paragraph_text).strip
  end

end
