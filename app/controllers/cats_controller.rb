class CatsController < ApplicationController

    before_action :setup_session_movies

    def home
        @cats = session[:cats]
    end

    def create
        session["cats"].push params["cat"]
        redirect_to cats_path
    end

    def new
    end

    def show

        @id = params[:id].to_i
        @cat = session[:cats][@id]

    end
    
    def update
    end

    def edit
        render plain: "Edit Cat Web-page"
    end

    def destroy
    end

    def delete

        @id = params[:id].to_i
        session[:cats].delete_at(@id)

        if session[:cats].length == 0
            session.delete(:cats)
        end

        redirect_to cats_path
    end

    def setup_session_movies
        unless session.has_key?(:cats)
            session[:cats] = []
            8.times do
                session[:cats].push get_new_cat
            end
        end
    end

    def get_new_cat
        img_id = ""
        10.times { img_id << rand(0..9).to_s }

        if rand(0..1) == 0
            gender = "Male"
            name = Faker::Name.male_first_name
        else
            gender = "Female"
            name = Faker::Name.female_first_name
        end

        return {
            "name" => name,
            "gender" => gender,
            "color" => Faker::Color.color_name,
            "img_id" => img_id,
            "location" => Faker::Address.city
        }

    end

end
