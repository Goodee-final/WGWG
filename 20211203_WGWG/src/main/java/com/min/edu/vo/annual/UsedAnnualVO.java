package com.min.edu.vo.annual;

public class UsedAnnualVO {
	private int USED_ANNUAL_NO;
	private String USED_ANNUAL_STARTDAY;
	private String USED_ANNUAL_ENDDAY;
	private int USED_DAY;
	private int EMP_NO;
	
	
	public UsedAnnualVO() {		
	}
	
	
	public UsedAnnualVO(int uSED_ANNUAL_NO, String uSED_ANNUAL_STARTDAY, String uSED_ANNUAL_ENDDAY, int uSED_DAY,
			int eMP_NO) {
		super();
		USED_ANNUAL_NO = uSED_ANNUAL_NO;
		USED_ANNUAL_STARTDAY = uSED_ANNUAL_STARTDAY;
		USED_ANNUAL_ENDDAY = uSED_ANNUAL_ENDDAY;
		USED_DAY = uSED_DAY;
		EMP_NO = eMP_NO;
	}


	@Override
	public String toString() {
		return "UsedAnnualVO [USED_ANNUAL_NO=" + USED_ANNUAL_NO + ", USED_ANNUAL_STARTDAY=" + USED_ANNUAL_STARTDAY
				+ ", USED_ANNUAL_ENDDAY=" + USED_ANNUAL_ENDDAY + ", USED_DAY=" + USED_DAY + ", EMP_NO=" + EMP_NO + "]";
	}


	public int getUSED_ANNUAL_NO() {
		return USED_ANNUAL_NO;
	}
	public void setUSED_ANNUAL_NO(int uSED_ANNUAL_NO) {
		USED_ANNUAL_NO = uSED_ANNUAL_NO;
	}
	public String getUSED_ANNUAL_STARTDAY() {
		return USED_ANNUAL_STARTDAY;
	}
	public void setUSED_ANNUAL_STARTDAY(String uSED_ANNUAL_STARTDAY) {
		USED_ANNUAL_STARTDAY = uSED_ANNUAL_STARTDAY;
	}
	public String getUSED_ANNUAL_ENDDAY() {
		return USED_ANNUAL_ENDDAY;
	}
	public void setUSED_ANNUAL_ENDDAY(String uSED_ANNUAL_ENDDAY) {
		USED_ANNUAL_ENDDAY = uSED_ANNUAL_ENDDAY;
	}
	public int getUSED_DAY() {
		return USED_DAY;
	}
	public void setUSED_DAY(int uSED_DAY) {
		USED_DAY = uSED_DAY;
	}
	public int getEMP_NO() {
		return EMP_NO;
	}
	public void setEMP_NO(int eMP_NO) {
		EMP_NO = eMP_NO;
	}
	
	
}
