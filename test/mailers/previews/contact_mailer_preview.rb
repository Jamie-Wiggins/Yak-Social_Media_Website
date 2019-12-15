class ContactMailerPreview < ActionMailer::ContactMailerPreview

    def contact_email
        ContactMailer.contact_email("yak@info.com", "jamie wiggins", @message="Hello")
    end   
end 