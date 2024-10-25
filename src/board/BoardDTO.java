package board;

public class BoardDTO {
	private String num;
	private String site;
	private String title;
	private String content;
	private String regdate;
	private String link;
	
	public BoardDTO()
	{
		System.out.println("DTO 생성자");
	}
	// 게터/세터 
	public String getNum()
	{
		return num;
	}
	public void setNum(String num)
	{
		this.num = num;
	}
	public String getSite()
	{
		return site;
	}
	public void setSite(String site)
	{
		this.site = site;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getRegdate()
	{
		return regdate;
	}
	public void setRegdate(String regdate)
	{
		this.regdate = regdate;
	}
	public String getLink()
	{
		return link;
	}
	public void setLink(String link)
	{
		this.link = link;
	}
	
}
