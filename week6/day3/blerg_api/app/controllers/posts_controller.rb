class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :find_author, only: [:create, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = @author.posts.new(post_params)

    if @post.save
      params[:post][:tag_list].split(",").map(&:strip).each do |name|
        @post.tags << Tag.find_or_initialize_by(name: Tag.sanitizer(name))
      end
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @author.posts.find(params[:id]).destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :body, :published)
    end

    def find_author
      @author = Author.find_by(auth_token: params[:auth_token])
      unless @author
        render json: {error: "You can't do that, jackass"}, status: :forbidden
      end
    end

end
