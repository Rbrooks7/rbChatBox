module ApplicationHelper
    
    def gravatar_for(coach, options = {size:80})
        gravatar_id = Digest::MD5::hexdigest(coach.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url, alt: coach.coachname, class: "gravatar")
    end
end
