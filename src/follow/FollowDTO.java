package follow;

public class FollowDTO {
	private String num;
	private String myId;
	private String followId;
	private String following;
	private String follower;
	
	public String getNum() {
		return num;
	}
	
	public void setNum(String num) {
		this.num = num;
	}

	public String getMyId() {
		return myId;
	}
	
	public void setMyId(String myId) {
		this.myId = myId;
	}
	
	public String getFollowId() {
		return followId;
	}
	
	public void setFollowId(String followId) {
		this.followId = followId;
	}
	
	public String getFollowing() {
		return following;
	}
	
	public void setFollowing(String following) {
		this.following = following;
	}
	
	public String getFollower() {
		return follower;
	}

	public void setFollower(String follower) {
		this.follower = follower;
	}
}
