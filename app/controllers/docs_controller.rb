class DocsController < ApplicationController
    def index
        @doc = Doc.all
    end

    def new
        @doc = Doc.new
    end

    def show
        @doc = Doc.find(params[:id])
    end

    def edit
        @doc = Doc.find(params[:id])
    end

    def update
        @doc = Doc.find(params[:id])

        if(@doc.update(doc_params))
            redirect_to @doc
        else
            render 'new'
        end
    end

    # def destroy
    #     @doc = Doc.find(params[:id])
        
    #     @doc.destroy
    #     redirect_to docs_path
    # end

    def create
        #проверка работы. используется для вывода содержимого параметра :docs в виде строки (plain text) на странице ответа.
        # render plain: params[:doc].inspect
        @doc = Doc.new(doc_params)

        if(@doc.save)
            redirect_to @doc
        else
            render 'new'
        end
    end

    private
    #указываем какие параметры разрешены (?)
    def doc_params
        params.require(:doc).permit(:title, :body)
    end
end