class StacksController < ApplicationController
    def index
        @stacks = Stack.all
    end

    def show
        @stack = Stack.find(params[:id])
    end

    def new
        @stack = Stack.new
    end

    def edit
        @stack = Stack.find(params[:id])
    end

    def create
        @stack = Stack.new(create_params)
        
        if @stack.save
            redirect_to @stack
        else
            render 'new'
        end
    end

    def update
        @stack = Stack.find params[:id]

        if @stack.update update_params
            redirect_to @stack
        else
            render 'edit'
        end
    end

    def destroy
        @stack = Stack.find(params[:id])
        @stack.destroy

        redirect_to stacks_path
    end

    private
        def create_params
            params.require(:stack).permit(:tilte, :user,  {images: []})
        end
        
        def update_params
            params.require(:stack).permit(:tilte, :rate)
        end
end
