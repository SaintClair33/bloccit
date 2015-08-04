module ApplicationHelper
  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form_group has-error'
    else
      content_tag :div, capture(&block), class: 'form_group'
    end
  end
  
  def my_name
    "Michael Saint Claire"
  end

  def up_vote_link_classes(post)
    "glyphicon glyphicon-chevron-up #{(current_user.voted(post) && current_user.voted(post).up_vote?) ? 'voted' : '' }"
  end

  def down_vote_link_classes(post)
    "glyphicon glyphicon-chevron-down #{(current_user.voted(post) && current_user.voted(post).down_vote?) ? 'voted' : '' }"
  end

  #def markdown_to_html(markdown)
    #renderer = Redcarpet::Render::HTML.new
    #extensions = {fenced_code_blocks: true}
    #redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    #(redcarpet.render markdown).html_safe
  #end

end
