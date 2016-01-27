module ApplicationHelper


  def PostFeatured(id)
    # byebug
    @post=Post.where(:id => id).first
    @post.featured == true ? @post.featured = false : @post.featured = true
    @post.save
  end
end
