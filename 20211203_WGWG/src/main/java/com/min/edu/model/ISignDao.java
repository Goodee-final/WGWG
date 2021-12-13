package com.min.edu.model;

import java.util.List;

import com.min.edu.vo.Sign;

public interface ISignDao {

	public List<Sign> selectSignList(int empno);

	public int insertSign(Sign sign);

	public int deleteSign(int signNo);

	public Sign selectSignOne(int sign_no);

}
