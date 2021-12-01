package com.game.gameUrl.model;

public class GameUrlVO {
	private int g_no;
	private String image;
	private String video;
	
	public GameUrlVO(){
		super();
	}
	
	public GameUrlVO(int g_no, String image, String video) {
		super();
		this.g_no=g_no;
		this.image=image;
		this.video=video;
	}
	
	public int getG_no() {
		return g_no;
	}
	
	public void setG_no(int g_no) {
		this.g_no=g_no;
	}
	
	public String getImage() {
		return image;
	}
	
	public void setImage(String image) {
		this.image=image;
	}
	
	public String getVideo() {
		return video;
	}
	
	public void setVideo(String video) {
		this.video=video;
	}
	
	@Override
	public String toString() {
		return "GameUrlVO [g_no=" + g_no + ", image=" + image + ", video=" 
							+ video + "]"; 
	}
}
