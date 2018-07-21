class FightsController < ApplicationController
    before_action :authenticate_user!, except: [:main]
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
       
        
        id = User.find_by_email(params[:email]).id
        fight_hash = {applicant_id: current_user.id, respondent_id: id, content: params[:content]}
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
        fight.standard = 1
        fight.save
        redirect_to action: 'main'
    end

    def reject_fight
        fight = Fight.find(params[:id])
        fight.standard = 2
        fight.save
        redirect_to action: 'main'
        
    end
    
end
