class Fight < ApplicationRecord
    belongs_to :applicant, class_name: "User"
    belongs_to :respondent, class_name: "User"
end
