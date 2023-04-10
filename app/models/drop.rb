class Drop < ApplicationRecord
  include ActionView::Helpers::SanitizeHelper

  has_rich_text :description


  def first_sentence
    return "" if description.blank?

    description_plain_text = strip_tags(description.to_s)
    first_sentence = description_plain_text.match(/(.*?(\.{3}|[.!?]))/)
    first_sentence ? first_sentence[1].strip : ""
  end
end
