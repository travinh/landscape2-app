Rails.application.config.middleware.use OmniAuth::Builder do
    # provider :github, ENV['1dd3504ef92fe91fb76c'], ENV['dc7bbd6cf6b2261ec0c6632ad60c0b206f647f14'], scope: "user:email"
    provider :github, '1dd3504ef92fe91fb76c', 'dc7bbd6cf6b2261ec0c6632ad60c0b206f647f14'
   
  end

