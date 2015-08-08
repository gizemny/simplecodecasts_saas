#add form validation from the website
class Contact < ActiveRecord::Base
    validates :name, presence: true
    validates :email, presence: true
end

