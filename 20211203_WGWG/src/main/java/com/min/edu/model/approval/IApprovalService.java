package com.min.edu.model.approval;

import java.util.List;
import java.util.Map;

import com.min.edu.vo.approval.Approval_Doc;
import com.min.edu.vo.approval.Approval_line;
import com.min.edu.vo.approval.Approval_Page;
import com.min.edu.vo.emp.Department;
import com.min.edu.vo.emp.Emp;
import com.min.edu.vo.emp.Position;
import com.min.edu.vo.approval.Approver;

public interface IApprovalService {

  //전체 문서목록 조회
	public List<Approval_Doc> selectmyAllDoc(int empno);
  //제목으로 검색
	public List<Approval_Doc> searchdoclist(String title, int empno);
	//문서 상세
	public Approval_Doc selectOneDoc(int docno);
  //기안하기 작성자 정보
	public Emp selectEmpInfo(int empno);
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

	//문서 상태 업데이트
	public int updateDocSt(Approval_Doc doc);
	
	//결재자 정보 없데이트
	public int updateApproval(Approval_line line);
	
	//페이징
	public List<Approval_Doc> selectDocPaging(Approval_Doc doc);
	//리스트갯수
	public int selectTotalPaging(Approval_Doc doc);
}
