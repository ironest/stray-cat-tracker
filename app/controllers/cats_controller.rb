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

        @id = params[:id].to_i
        session["cats"][@id] = params[:cat]
        redirect_to cat_path(@id)

    end

    def edit
        @id = params[:id].to_i
        @cat = session[:cats][@id]
    end

    def destroy

        id = params[:id].to_i

        puts "DELETE RQUEST: #{id}"

        session[:cats].delete_at(id)

        if session[:cats].length == 0
            session.delete(:cats)
        end

        redirect_to cats_path

    end

    def delete

        @id = params[:id].to_i
        @cat = session[:cats][@id]

    end

    def setup_session_movies
        unless session.has_key?(:cats)
            session[:cats] = []
            7.times do
                session[:cats].push get_new_cat
            end
        end
    end

    def get_random_cat_color
        
        patterns = {
            "solid-color" => 1,
            "bi-color" => 2,
            "tri-color" => 3,
            "tortoiseshell" => 0,
            "tabby" => 1
        }
        colors = 
        [
            "white",
            "black",
            "ginger",
            "grey",
            "cream",
            "cinnamon",
            "fawn"
        ]

        coat_pattern = patterns.keys.sample

        coat_color = []

        while coat_color.length < patterns[coat_pattern]

            # A whole tabby cat does not have white
            if coat_pattern == "tabby"
                colors.delete_at(0)
            end

            # A multi color cat always has white as base
            if coat_color.length == 0 && coat_pattern.include?("color")
                idx = 0
            else
                idx = rand(0...colors.length)
            end

            coat_color.push colors[idx]
            colors.delete_at(idx)
        end

        return "#{coat_pattern} #{coat_color.join("/")}".capitalize

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
            "color" => get_random_cat_color, #Faker::Color.color_name.capitalize,
            "img_id" => img_id,
            "location" => Faker::Address.city
        }

    end

end
