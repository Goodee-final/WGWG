package com.min.edu.ctrl.emp;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.min.edu.vo.emp.Emp;

@Service
public class LoginValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		Emp emp = (Emp)target;
		if(emp.getPw().trim()=="") {
			errors.rejectValue("pw", "errorCode", "비밀번호를 입력하세요.");
		}
		if(emp.getEmp_no()==0) {
			errors.rejectValue("emp_no", "errorCode", "사원번호를 입력하세요.");
		}
	}

}
