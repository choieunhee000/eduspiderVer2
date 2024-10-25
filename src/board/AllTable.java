package board;

public class AllTable {
	private String tname;
	
	public AllTable()
	{
		System.out.println("AllTable 생성자");
	}
	// 게터/세터 
	public String getTable()
	{
		return tname;
	}
	public void setTable(String tname)
	{
		this.tname = tname;
	}
}
