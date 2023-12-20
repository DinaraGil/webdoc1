class UsersDocsController < ApplicationController
    def create
        @doc = Doc.find(params[:doc_id])
        @users_doc = @doc.users_docs.create(users_doc_params)
        redirect_to doc_path(@doc)
    end

    private
    def users_doc_params
        params.require(:users_doc).permit(:username, :body)
    end
end
