package org.yona.archives;

import java.util.Arrays;
import java.util.Date;

public class BoardVO {

	private int boardno;
	private String title;
	private String content;
	private String writer;
	private String boardCat;
	private Date regdate;
	private int boardview;
	private int replynum;

	private String[] files;

	public int getBoardno() {
		return boardno;
	}

	public void setBoardno(int boardno) {
		this.boardno = boardno;
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

	public Date getregdate() {
		return regdate;
	}

	public void setregdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getboardview() {
		return boardview;
	}

	public void setboardview(int boardview) {
		this.boardview = boardview;
	}
	
	public int getReplynum() {
		return replynum;
	}

	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getboardCat() {
		return boardCat;
	}

	public void setboardCat(String boardCat) {
		this.boardCat = boardCat;
	}
		
	@Override
	public String toString() {
		return "BoardVO [boardno=" + boardno + ", title=" + title + ", content=" + content + " ,writer = " + writer
				+ ", boardview=" + boardview + ", replynum=" + replynum + ", boardCat=" + boardCat +
				", files="+files + Arrays.toString(files) + "]";
	}


}
