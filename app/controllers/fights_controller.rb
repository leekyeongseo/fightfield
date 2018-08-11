class FightsController < ApplicationController
   
    def main
        @fight = Fight.all
        if user_signed_in?
        
        @applicants = current_user.applicants.all
        @respondents = current_user.respondents.all
        end
        render 'main'
    end
    def stat_board
        render 'stat_board'
    end
    def ongoing
        if user_signed_in?
            @fight = Fight.all
            @applicants = current_user.applicants.all
            @respondents = current_user.respondents.all
            end
        render 'ongoing'
    end
    def setting
        render 'setting'
    end
    def leader_board
        render 'leader_board'
    end

    def fight 
       
        if User.find_by_email(params[:email])
            id = User.find_by_email(params[:email]).id
            fight_hash = {applicant_id: current_user.id, respondent_id: id, content: params[:content]}

        else
            fight_hash = {applicant_id: current_user.id, respondent_id: current_user.id, content: params[:content], temp_user: params[:email], respondent_exist: false}
        end
        fight = Fight.create(fight_hash)
        fight.save
        #fight = Fight.where(fight_hash)
       

        #if (fight.empty?)
        #    Fight.create(fight_hash)
          
            
        #else
    
        #    fight.destroy_all
        #end
        
        
        redirect_to action: 'main'
    end

    def accept_fight
    
        fight = Fight.find(params[:id])
        if fight.respondent_exist == false
            fight.respondent_exist = true
            fight.respondent = current_user
            fight.save
        end
        fight.standard = 1
        fight.save
        redirect_to action: 'main'
    end

    def reject_fight
        fight = Fight.find(params[:id])
        if fight.respondent_exist == false
            fight.respondent_exist == true
            fight.respondent == fight.temp_user
            fight.save
        end
        fight.standard = 2
        fight.save
        redirect_to action: 'main'
        
    end
    def start_fight
        fight = Feed.new
        fight.to = params[:to]
        fight.content = params[:context]
        fight.from = params[:from]
        fight.fight_type = params[:city_id].to_i
        fight.save
        @id =fight.id
        @to = fight.to
        @from = fight.from
        @content = fight.content
        @type = fight.fight_type
        
        type = params[:city_id].to_i
        if type == 1    
            redirect_to action: 'hakjum', id: fight.id
        elsif type == 2
            redirect_to action: 'diet', id: fight.id
        elsif type == 3
            redirect_to action: 'esports', id: fight.id
        elsif type == 4
            redirect_to action: 'sports', id: fight.id
        elsif type == 5
            redirect_to action: 'free',id: fight.id
        end        
    end


    def hakjum
        @feed = Feed.find(params[:id])
        render 'hakjum'
    end

    def diet
        @feed = Feed.find(params[:id])
        render 'diet'
    end

    def esports
        @feed = Feed.find(params[:id])
        render 'esports'
    end

    def sports
        @feed = Feed.find(params[:id])
        render 'sports'
    end

    def free
        @feed = Feed.find(params[:id])
        render 'free'
    end

   

end
