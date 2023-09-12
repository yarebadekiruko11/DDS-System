class Comment < ApplicationRecord
    belongs_to :instructor
    belongs_to :course

    validates :comment_body, presence: true

    def howmany_select
        ['1段階-1','1-2','1-3','1-4','1-5','1-6','1-7','1-8','1-9','1-10','1-11以降',
        '2段階-1','2-2','2-3','2-4','2-5','2-6','2-7','2-8','2-9','2-10','2-11以降']
    end

end
