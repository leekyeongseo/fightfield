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
        fight.save
        type = params[:city_id].to_i
        if type == 1
            render 'hakjum'
        elsif type == 2
            render 'diet'
        elsif type == 3
            render 'esports'
        elsif type == 4
            render 'sports'
        elsif type == 5
            render 'free'
        end
        
        
    end
    
end
