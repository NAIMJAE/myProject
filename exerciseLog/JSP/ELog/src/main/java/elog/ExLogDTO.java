package elog;

public class ExLogDTO {
	private String uid;
	private String date;
	private String exNum;
	private String exercise;
	private int set1Weight;
	private int set1Count;
	private int set2Weight;
	private int set2Count;
	private int set3Weight;
	private int set3Count;
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getExNum() {
		return exNum;
	}
	public void setExNum(String exNum) {
		this.exNum = exNum;
	}
	public String getExercise() {
		return exercise;
	}
	public void setExercise(String exercise) {
		this.exercise = exercise;
	}
	public int getSet1Weight() {
		return set1Weight;
	}
	public void setSet1Weight(int set1Weight) {
		this.set1Weight = set1Weight;
	}
	public int getSet1Count() {
		return set1Count;
	}
	public void setSet1Count(int set1Count) {
		this.set1Count = set1Count;
	}
	public int getSet2Weight() {
		return set2Weight;
	}
	public void setSet2Weight(int set2Weight) {
		this.set2Weight = set2Weight;
	}
	public int getSet2Count() {
		return set2Count;
	}
	public void setSet2Count(int set2Count) {
		this.set2Count = set2Count;
	}
	public int getSet3Weight() {
		return set3Weight;
	}
	public void setSet3Weight(int set3Weight) {
		this.set3Weight = set3Weight;
	}
	public int getSet3Count() {
		return set3Count;
	}
	public void setSet3Count(int set3Count) {
		this.set3Count = set3Count;
	}
	@Override
	public String toString() {
		return "exLog [uid=" + uid + ", date=" + date + ", exNum=" + exNum + ", exercise=" + exercise + ", set1Weight="
				+ set1Weight + ", set1Count=" + set1Count + ", set2Weight=" + set2Weight + ", set2Count=" + set2Count
				+ ", set3Weight=" + set3Weight + ", set3Count=" + set3Count + "]";
	}
	
	
}
