class CommentsController < ApplicationController
    before_action only: [:edit, :update, :destroy] do
        authorize_request(["admin"])
        end
end
