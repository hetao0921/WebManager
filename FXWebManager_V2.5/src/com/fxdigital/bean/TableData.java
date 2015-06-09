package com.fxdigital.bean;

import java.util.List;

/**
 * jqGrid表格数据格式
 * 
 * @author hxht
 * @version 2014-9-12
 */
public class TableData {
	
	// * 页码
	private int page;
	// * 总页数
	private int total;
	// * 数据总数
	private long records;
	// * 呈现的数据
	private List<? extends DataRow> rows;
	
	public int getPage() {
		return page;
	}
	/**
	 * 页码
	 * @param page
	 */
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotal() {
		return total;
	}
	/**
	 * 总页数
	 * @param total
	 */
	public void setTotal(int total) {
		this.total = total;
	}
	public long getRecords() {
		return records;
	}
	/**
	 * 数据总数
	 * @param records
	 */
	public void setRecords(long records) {
		this.records = records;
	}
	public List<? extends DataRow> getRows() {
		return rows;
	}
	/**
	 * 呈现的数据
	 * @param rows
	 */
	public void setRows(List<? extends DataRow> rows) {
		this.rows = rows;
	}
	
}
