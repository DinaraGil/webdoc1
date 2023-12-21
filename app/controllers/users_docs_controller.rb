class UsersDocsController < ApplicationController
    def create
        @doc = Doc.find(params[:doc_id])

        @name = params[:name]
        @email = params[:email]

        erb_template = ERB.new(@doc.body)
        @result_html = erb_template.result(binding)

        @users_doc = @doc.users_docs.build(users_doc_params)
        @users_doc.body = @result_html  # Обновляем :body

        if @users_doc.save
            redirect_to doc_path(@doc)
        else
        # Обработка ошибок, если не удалось сохранить
            render :new
        end
    end

    private
    def users_doc_params
        params.require(:users_doc).permit(:username, :body)
    end
end
