class PagesController < ApplicationController
    def login
        if user_signed_in?
          redirect_to root_url, notice: "Vous êtes déjà connecté."
        end
    end
    def index
        @index_images = IndexImage.all
    end
end