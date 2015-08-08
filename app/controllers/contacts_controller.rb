class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    #add variable contact params // flash :key comes from bootstrap classes
    def create
        @contact = Contact.new(contact_params)
         if @contact.save
             #setting parameters for the hash in html file
            name = params[:contact][:name]
            email = params[:contact][:email]
            body = params[:contact][:comments]
            #look into the mailer rb file and html file, add the 3 variables and deliver
            ContactMailer.contact_email(name, email, body).deliver
            flash[:success] = "Message sent."
            redirect_to new_contact_path
         else
            flash[:danger] = "Error occured."
            redirect_to new_contact_path
         end     
    end
    
    #whitelist for security purpose
    private
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end
end
