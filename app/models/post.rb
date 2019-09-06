class Post < ApplicationRecord
    validates :title,presence:true
    validates :body,presence:true

    #validate_presence_of :title,:body

end
