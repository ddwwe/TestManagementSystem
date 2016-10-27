package com.refresh;

import java.util.Arrays;

public class TableType {

	private int[][] arr;
	private int[][] yesArr;
	private int[] hSum;
	private int[] yesHSum;
	private int[] vSum;
	private int[] yesVSum;
	private int total;
	private int yesTotal;
	
	public TableType() {
		super();
	}

	public TableType(int[][] arr, int[][] yesArr, int[] hSum, int[] yesHSum, int[] vSum, int[] yesVSum, int total,
			int yesTotal) {
		super();
		this.arr = arr;
		this.yesArr = yesArr;
		this.hSum = hSum;
		this.yesHSum = yesHSum;
		this.vSum = vSum;
		this.yesVSum = yesVSum;
		this.total = total;
		this.yesTotal = yesTotal;
	}

	public int[][] getArr() {
		return arr;
	}

	public void setArr(int[][] arr) {
		this.arr = arr;
	}

	public int[][] getYesArr() {
		return yesArr;
	}

	public void setYesArr(int[][] yesArr) {
		this.yesArr = yesArr;
	}

	public int[] gethSum() {
		return hSum;
	}

	public void sethSum(int[] hSum) {
		this.hSum = hSum;
	}

	public int[] getYesHSum() {
		return yesHSum;
	}

	public void setYesHSum(int[] yesHSum) {
		this.yesHSum = yesHSum;
	}

	public int[] getvSum() {
		return vSum;
	}

	public void setvSum(int[] vSum) {
		this.vSum = vSum;
	}

	public int[] getYesVSum() {
		return yesVSum;
	}

	public void setYesVSum(int[] yesVSum) {
		this.yesVSum = yesVSum;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getYesTotal() {
		return yesTotal;
	}

	public void setYesTotal(int yesTotal) {
		this.yesTotal = yesTotal;
	}

	@Override
	public String toString() {
		return "TableType [arr=" + Arrays.toString(arr) + ", yesArr=" + Arrays.toString(yesArr) + ", hSum="
				+ Arrays.toString(hSum) + ", yesHSum=" + Arrays.toString(yesHSum) + ", vSum=" + Arrays.toString(vSum)
				+ ", yesVSum=" + Arrays.toString(yesVSum) + ", total=" + total + ", yesTotal=" + yesTotal + "]";
	}
	
}
