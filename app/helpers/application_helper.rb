module ApplicationHelper


  def PostFeatured(post)
    # @post=Post.where(:id => id).first
    post.update_attribute("featured",!post.featured)
    # @post.featured == true ? @post.featured = false : @post.featured = true
    # post.save
    # byebug

  end
end
