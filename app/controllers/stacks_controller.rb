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
            session[:current_stack_id] = @stack.id
            redirect_to @stack, notice: "Stack has been created"
        else
            render 'new'
        end
    end

    def update
        @stack = Stack.find params[:id]
        if session[:current_stack_id] == @stack.id
            if @stack.update update_params
                redirect_to @stack, notice: "Stack has been updated"
            else
                render 'edit'
            end
        else
            render 'edit', notice: "You have no rights to update this stack"
        end
    end

    def destroy
        @stack = Stack.find(params[:id])
        if session[:current_stack_id] == @stack.id
            @stack.destroy
            redirect_to stacks_path
        else
            redirect_to stacks_path, notice: "You have no rights to delete this stack"
        end 
    end

    private
        def create_params
            params.require(:stack).permit(:tilte, :user,  {images: []})
        end
        
        def update_params
            params.require(:stack).permit(:tilte, :rate)
        end
end
