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
            session[:cats] = []
            4.times do
                session[:cats].push get_new_cat
            end
        end
    end

    def get_new_cat
        img_id = ""
        10.times { img_id << rand(0..9).to_s }

        return {
            "name" => Faker::Name.first_name,
            "location" => Faker::Address.city,
            "color" => "White",
            "sex" => "Male",
            "img_id" => img_id
        }

    end

end
