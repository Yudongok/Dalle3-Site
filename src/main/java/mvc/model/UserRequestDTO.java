package mvc.model;

public class UserRequestDTO {
	private String text;
	private String[] arr = new String[10];

	public UserRequestDTO() {
		super();
	}
	
	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String[] getArr() {
		return arr;
	}

	public void setArr(String[] arr) {
		this.arr = arr;
	}

	

}
