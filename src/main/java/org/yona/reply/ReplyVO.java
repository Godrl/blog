package org.yona.reply;

import java.util.Date;

public class ReplyVO {

	private int replyno;
	private int boardno;
	private String replytext;
	private String replyer;
	private String boardCat;
	
	private Date regdate;
	private Date updatedate;
	
	public int getReplyno() {
		return replyno;
	}
	public void setReplyno(int replyno) {
		this.replyno = replyno;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public String getBoardCat() {
		return boardCat;
	}
	public void setBoardCat(String boardCat) {
		this.boardCat = boardCat;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [replyno=" + replyno + ", boardno=" + boardno + ", replytext=" + replytext + ", replyer="
				+ replyer + ", regdate=" + regdate + ", updatedate=" + updatedate + ", boardCat="+ boardCat + "]";
	}
	
	
	
}
