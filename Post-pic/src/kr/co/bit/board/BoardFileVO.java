package kr.co.bit.board;

public class BoardFileVO {
	private int no;
	private int board_no;
	private String file_ori_name;
	private String file_save_name;
	private int file_size;
	public BoardFileVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getFile_ori_name() {
		return file_ori_name;
	}
	public void setFile_ori_name(String file_ori_name) {
		this.file_ori_name = file_ori_name;
	}
	public String getFile_save_name() {
		return file_save_name;
	}
	public void setFile_save_name(String file_save_name) {
		this.file_save_name = file_save_name;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}
	@Override
	public String toString() {
		return "BoardFileVO [no=" + no + ", board_no=" + board_no + ", file_ori_name=" + file_ori_name
				+ ", file_save_name=" + file_save_name + ", file_size=" + file_size + "]";
	}
	
	
	

	
}
