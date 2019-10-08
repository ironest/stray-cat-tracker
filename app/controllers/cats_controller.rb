class CatsController < ApplicationController

    before_action :setup_session_movies

    def home
        @cats = session[:cats]
    end

    def create
    end

    def new
    end

    def show
    end
    
    def update
    end

    def edit
    end

    def destroy
    end

    def delete
    end

    def setup_session_movies
        unless session.has_key?(:cats)
            session[:cats] = [
                {
                    name: "Tom"
                    location: "Newtown",
                    color: "White",
                    sex: "Male",
                },
                {
                    name: "Tom"
                    location: "Newtown",
                    color: "White",
                    sex: "Male",
                },
                {
                    name: "Tom"
                    location: "Newtown",
                    color: "White",
                    sex: "Male",
                },
            ]
        end
    end

end
