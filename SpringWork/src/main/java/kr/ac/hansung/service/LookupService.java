package kr.ac.hansung.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.dao.LookupDao;
import kr.ac.hansung.model.Subject;

@Service
public class LookupService {

	@Autowired
	private LookupDao lookupdao;

	public List<Subject> getSemester() {
		return lookupdao.getSemester();
	}

	public List<Subject> getSubject(int subNum) {
		return lookupdao.getSubject(subNum);
	}

	public void insertApply(Subject subject) {
		lookupdao.insertApply(subject);
	}
	
	public void deleteApply() {
		lookupdao.deleteApply();
	}
}
