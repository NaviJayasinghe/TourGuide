package Model;

public class LogedUserSession {
	
		private String userName;
	    private int userId;
	    private String profilePic;

	    public LogedUserSession(String userName, int userId,String profilePic) {
	        this.userName = userName;
	        this.userId = userId;
	        this.setProfilePic(profilePic);
	    }

	    public String getUserName() {
	        return userName;
	    }

	    public void setUserName(String userName) {
	        this.userName = userName;
	    }

	    public int getUserId() {
	        return userId;
	    }

	    public void setUserId(int userId) {
	        this.userId = userId;
	    }

		public String getProfilePic() {
			return profilePic;
		}

		public void setProfilePic(String profilePic) {
			this.profilePic = profilePic;
		}
	    
	
}
