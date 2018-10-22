require 'gossip'
require 'view'

class Controller
    def initialize()
        @view = View.new
    end

    def create_post()
        params = @view.create_post()

        new_post = Post.new(params[:author], params[:content])
        new_post.save_data()
    end

    def show_post()
        post = Post.new(params[:author], params[:content])

        @view.display(post.read_data())
    end
end