package com.kh.respect.meet.model.vo;

import java.util.Date;

public class Meet {
	
	private int meetNo;
	private String userId;
	private String nickName;
	private String gender;
	private String area;
	private String title;
	private String content;
	private String meetDate;
	private String meetTime;
	private String address;
	private int hitsCount;
	private int replyCount;
	private Date writeDate;
	
	public Meet() {}

	public Meet(int meetNo, String userId, String nickName, String gender, String area, String title, String content,
			String meetDate, String meetTime, String address, int hitsCount, int replyCount, Date writeDate) {
		super();
		this.meetNo = meetNo;
		this.userId = userId;
		this.nickName = nickName;
		this.gender = gender;
		this.area = area;
		this.title = title;
		this.content = content;
		this.meetDate = meetDate;
		this.meetTime = meetTime;
		this.address = address;
		this.hitsCount = hitsCount;
		this.replyCount = replyCount;
		this.writeDate = writeDate;
	}

	public int getMeetNo() {
		return meetNo;
	}

	public void setMeetNo(int meetNo) {
		this.meetNo = meetNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMeetDate() {
		return meetDate;
	}

	public void setMeetDate(String meetDate) {
		this.meetDate = meetDate;
	}

	public String getMeetTime() {
		return meetTime;
	}

	public void setMeetTime(String meetTime) {
		this.meetTime = meetTime;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getHitsCount() {
		return hitsCount;
	}

	public void setHitsCount(int hitsCount) {
		this.hitsCount = hitsCount;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "Meet [meetNo=" + meetNo + ", userId=" + userId + ", nickName=" + nickName + ", gender=" + gender
				+ ", area=" + area + ", title=" + title + ", content=" + content + ", meetDate=" + meetDate
				+ ", meetTime=" + meetTime + ", address=" + address + ", hitsCount=" + hitsCount + ", replyCount="
				+ replyCount + ", writeDate=" + writeDate + "]";
	}

	

	
	
}
