class FightsController < ApplicationController
    def main
        render 'main'
    end
    def stat_board
        render 'stat_board'
    end
    def ongoing
        render 'ongoing'
    end
    def setting
        render 'setting'
    end
    def leader_board
        render 'leader_board'
    end
end
