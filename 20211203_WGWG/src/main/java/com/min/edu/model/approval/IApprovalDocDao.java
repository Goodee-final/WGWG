package com.min.edu.model.approval;

import java.util.List;
import java.util.Map;

import com.min.edu.vo.approval.Approval_Doc;
import com.min.edu.vo.approval.Approval_Page;
import com.min.edu.vo.approval.Approval_line;
import com.min.edu.vo.emp.Department;
import com.min.edu.vo.emp.Emp;
import com.min.edu.vo.emp.Position;
import com.min.edu.vo.approval.Approver;

public interface IApprovalDocDao {
	

	//전체문서 출력
	public List<Approval_Doc> selectmyAllDoc(Approval_Doc doc);
	//문서 검색
	public List<Approval_Doc> searchdoclist(String title, int empno);
	//문서 상세
	public Approval_Doc selectOneDoc(int docno);
	//기안할 때 작성자 정보 출력
    public Emp selectEmpInfo(int empno);
    //public Emp selectAppLine(int app_line_no);
    //상신
    public int insertDoc(Approval_Doc doc);

	
	//결재라인
	public List<Emp> selectAllEmp();
	public List<Department> selectAllDept();
	public List<Position> selectAllPosition();

	
	//결재자
	public List<Approval_Doc> selectAllDocApp(int empno);
	//문서 상태에 따른 검색(결재자)
	public List<Approval_Doc> selectListDocStApp(Approval_Doc doc);
	//문서 상태에 따른 검색(상신자)
	public List<Approval_Doc> selectListDocSt(Approval_Doc doc);
	//결재대기함
	public List<Approval_Doc> selectListWait(Approver approver);
	//참조대기함
	public List<Approval_Doc> selectListRef(Approval_Doc doc);

	
	//문서 상태 업데이트
	public int updateDocSt(Approval_Doc doc);
	
	//결재자 정보 없데이트
	public int updateApproval(Approval_line line);
	
	//페이징
	public List<Approval_Doc> selectDocPaging(Approval_Doc doc);
	//리스트갯수
	public int selectTotalPaging(Approval_Doc doc);
	public int selectTotalPagingApp(Approval_Doc doc);
	public int selectTotalPagingRef(Approval_Doc doc);
	public int selectTotalPagingAll(Approval_Doc doc);
	
	//결재자 서명 리스트
	public List<Approver> selectSignList(int appLineNo);
}
