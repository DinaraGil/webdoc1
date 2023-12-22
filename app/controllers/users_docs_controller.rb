class UsersDocsController < ApplicationController
    def create
        @doc = Doc.find(params[:doc_id])

        @title = params[:title]

        @name = params[:name]
        @email = params[:email]
        @to_name = params[:to_name]
        @from_name = params[:from_name]
        @from_date = params[:from_date]
        @current_date = params[:current_date]
        @job = params[:job]
        @money = params[:money]
        @company = params[:company]

        erb_template = ERB.new(@doc.body)
        @result_html = erb_template.result(binding)

        @users_doc = @doc.users_docs.build(users_doc_params)
        @users_doc.body = @result_html  # Обновляем :body
        @users_doc.title = @title

        if @users_doc.save
            redirect_to doc_path(@doc), notice: 'Ваше заявление добавлено.'
        else
        # Обработка ошибок, если не удалось сохранить
            flash[:alert] = 'Укажите название Вашего заявления.'
            redirect_to doc_path(@doc)
        end
    end

    def show
        @users_doc = UsersDoc.find(params[:id])

        respond_to do |format|
            format.html
            format.pdf do
              render pdf: "Users_doc_id: #{@users_doc.id}", template: "users_docs/show", formats: [:html]
            end
        end
    end

    private
    def users_doc_params
        params.require(:users_doc).permit(:username, :body, :title)
    end
end
