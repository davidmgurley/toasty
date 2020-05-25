module Api
    module V1
        class TodosController < ApplicationController
            def index
                todos = Todo.order('position DESC');
                render json: {status: 'SUCCESS', message: 'Loaded Todo', data:todos}, status: :ok
            end
            def show
                todo = Todo.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded Todo', data:todo}, status: :ok
            end
            def create
                todo = Todo.new(todo_params)
                if todo.save
                    render json: {status: 'SUCCESS', message: 'Saved Todo', data:todo}, status: :ok
                else
                    render json: {status: 'Error', message: 'Todo Not Saved', data:todo.errors}, status: :unprocessable_entity
                end

            end

            def destroy
                todo = Todo.find(params[:id])
                todo.destroy
                render json: {status: 'SUCCESS', message: 'Deleted Todo', data:todo}, status: :ok

            end

            def update
                todo = Todo.find(params[:id])
                if todo.update_attributes(todo_params)
                    render json: {status: 'SUCCESS', message: 'Updated Todo', data:todo}, status: :ok
                else 
                    render json: {status: 'Error', message: 'Todo Not Updated', data:todo.errors}, status: :unprocessable_entity

                end
            end

            private
            def todo_params
                params.permit(:title, :description, :position, :completed)
            end
        end
    end
end
