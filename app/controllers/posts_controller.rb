class PostsController < ApplicationController
    before_action :require_user_logged_in!


    def index
        @posts=Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to @post, notice: "Post created successfully !"
        else
            render :new
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to @post, notice: "Post updated successfully !"
        else
            render 'edit'
        end
    end

    private
    def post_params
        params.require(:post).permit(:body,:title)
    end
end
