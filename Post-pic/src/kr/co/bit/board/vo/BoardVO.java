package kr.co.bit.board.vo;

public class BoardVO {
	private int no;
	private String title;
	private String writer;
	private String content;
	private int viewCnt;
	private String regDate;
	
	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	
	// alt + shift +s 누른후 c 선택 기본 생성자 만들기
	// alt + shift +s 누른 후 r 선택 기본 getter setter 생성
	/*
	 * alt + shift + s누른 후 c: 기본 생성자
	 *                     o : 매개변수가 가지는 생성자
	 *                     r : getter/setter 메소드
	 *                     v : override
	 *                     s : toString() 메소드
	 */
	
	
	
}
