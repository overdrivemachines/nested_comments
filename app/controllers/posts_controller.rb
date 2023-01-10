class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # @route GET /posts (posts)
  # @route GET / (root)
  def index
    @posts = Post.all
  end

  # @route GET /posts/:id (post)
  def show
  end

  # @route GET /posts/new (new_post)
  def new
    @post = Post.new
  end

  # @route GET /posts/:id/edit (edit_post)
  def edit
  end

  # @route POST /posts (posts)
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # @route PATCH /posts/:id (post)
  # @route PUT /posts/:id (post)
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # @route DELETE /posts/:id (post)
  def destroy
    @post.destroy
    redirect_to posts_url, notice: "Post was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
