class Helpers
    
  def self.current_user(session_hash) #Retreives user.
      @user = User.find(session_hash[:user_id])
    end
  
    def self.is_logged_in?(session_hash) #Verifies user.
      !!session_hash[:user_id]
    end

  end