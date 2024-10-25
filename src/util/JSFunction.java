package util;

public class JSFunction {
	
	// 원한s msg 문구를 alert()함수로 출력 후 해당 페이지로 이동
	public static String executeAlert(String msg, String url) {
		String script = "";
		
		try {
			script = "<script>"
					 + "	alert('" + msg + "');"
					 + "	location.href = '"+ url +"';"
					 + "</script>";
		} catch(Exception e) {
			System.out.println("[JSFunction] error: " + e.getMessage());
			e.printStackTrace();
		}
		
		return script;
	}
	
	// 원하는 msg 문구를 alert()함수로 출력 후 이전 페이지로 이동
	public static String execulteBackAlert(String msg) {
		String script = "";
		
		try {
			script = "<script>"
					 + "	alert('" + msg + "');"
					 + "	history.back();"
					 + "</script>";
		} catch(Exception e) {
			System.out.println("[JSFunction] error: " + e.getMessage());
			e.printStackTrace();
		}
		
		return script;
	}

}	
