class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # If we installed the devise gem we will add user authentication
  # before_action :authenticate_user!
  before_action :set_post_id, only: [:publish, :unpublish]


  def featured
    PostFeatured(params[:post_id])
    redirect_to posts_path(), notice: 'The post featured was successfully changed.'
  end

  def publish
    # publish the post "Allow the admin to publish the post from the backEnd"
    @post.published = true
    @post.save
    redirect_to posts_path(), notice: 'The post was successfully published.'
  end

  def unpublish
    # Unpublish the post "Allow the admin to unpublish the post from the backEnd"
    @post.published = false
    @post.save
    redirect_to posts_path(), notice: 'The post was successfully unpublished.'
  end

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end


  # GET /posts/new
  def new
    @post = Post.new
  end


  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # using in publish/unpublish methods
    def set_post_id
      @post = Post.find(params[:post_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :published, :featured)
    end
end
