class PostsController < ApplicationController

  def index
    @posts = Post.order(created_at: :desc).all
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    current_user.posts << @post

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end

  # # PATCH/PUT /posts/1 or /posts/1.json
  # def update
  #   respond_to do |format|
  #     if @post.update(post_params)
  #       format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
  #       format.json { render :show, status: :ok, location: @post }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @post.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /posts/1 or /posts/1.json
  # def destroy
  #   @post.destroy

  #   respond_to do |format|
  #     format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    def post_params
      params.require(:post).permit(:body, :file)
    end
end
