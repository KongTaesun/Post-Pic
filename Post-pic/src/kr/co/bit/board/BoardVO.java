package kr.co.bit.board;

public class BoardVO {
	private int no;
	private int depth;
	private int board_no;
	private String title;
	private String writer;
	private String regid;
	private String content;
	private String tags;
	private String types;
	private String imgs;
	private int view_cnt;
	private int like_cnt;
	private String reg_date;
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
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
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
	public String getRegid() {
		return regid;
	}
	public void setRegid(String regid) {
		this.regid = regid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public String getTypes() {
		return types;
	}
	public void setTypes(String types) {
		this.types = types;
	}
	public String getImgs() {
		return imgs;
	}
	public void setImgs(String imgs) {
		this.imgs = imgs;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	public int getLike_cnt() {
		return like_cnt;
	}
	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", depth=" + depth + ", board_no=" + board_no + ", title=" + title + ", writer="
				+ writer + ", regid=" + regid + ", content=" + content + ", tags=" + tags + ", types=" + types
				+ ", imgs=" + imgs + ", view_cnt=" + view_cnt + ", like_cnt=" + like_cnt + ", reg_date=" + reg_date
				+ "]";
	}
	
	
	
	
	
	
}
