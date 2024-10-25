package board_ver2;

public class BoardDTO {

	 int num;
	 String site;
	 String title;
	 String content;
	 String regidata;
	 String link;
	 String tablename;
	 String keyword;
//	 String id;
	
	 public String getTablename() {
			return tablename;
		}
	public void setTablename(String tablename) {
		this.tablename = tablename;
	}
	 
	 public int getNum() {
		return num;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
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
	public String getRegidata() {
		return regidata;
	}
	public void setRegidata(String regidata) {
		this.regidata = regidata;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
//	public String getId() {
//		return id;
//	}
//	public void setId(String id) {
//		this.id = id;
//	}
	
}
