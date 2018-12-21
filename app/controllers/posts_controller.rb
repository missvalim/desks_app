class PostsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.search(params[:search])
   
  end
def show

    end
  def new
    @post = current_user.posts.build 
  end
  
  def create 
    @post = current_user.posts.build(post_params)
   
    if @post.save
      redirect_to @post, success: 'Статья успешно создана'
    else
      flash.now[:danger] = 'Статья не создана'
      render :new
    end
   end
  
  def edit

  end
  
  def update
     if @post.update_attributes(post_params)
      redirect_to @post, success: 'Статья успешно обновлена'
     else
      flash.now[:danger] = 'Статья не обновлена'
      render :edit
     end
  end
 
  def destroy
    @post.destroy
    redirect_to posts_path, success: 'Статья успешно удалена'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :image, :all_tags, :adres)
    end
    
end
