class PostsController < ApplicationController
before_action :get_post,only[:edit,:update,:destroy]



    def index  #to see all the posts
       @posts=Post.all 
    end

    def show       #show only one post.
       # @post=Post.find(params[:id])
    end

    def new   
        @post= Post.new    
    end

    def create     #create new post.
        @post =Post.new(post_params)
      if @post.save
        redirect_to @post,notice:'created a new post'
      else
        redirect_to new_post_path,notice:'error while creating post...'
      end

    end

    def edit     #used to load view for.
        #@post=Post.find(params[:id])
    end

    def update   #update posts.
        #@post=Post.find(params[:id])
        if @post.update(post_params)
         redirect_to @post,notice: 'updated sucessfully....'
        else
         redirect_to edit_post_path(@post),notice: 'error while editing....'
        end

    end

    def destroy   #delete post
        #@post=Post.find(params[:id])
        @post.destroy
        redirect_to posts_path,notice:'deleted post sucessfully'
    end


    private

    def get_post
        @post=Post.find(params[:id])
    end

    
    def post_params
    params.require(:post).permit(:title,:body)
    end
end
