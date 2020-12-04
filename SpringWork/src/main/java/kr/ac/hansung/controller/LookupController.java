package kr.ac.hansung.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.hansung.model.Subject;
import kr.ac.hansung.service.LookupService;

@Controller
public class LookupController {

	@Autowired
	private LookupService lookupservice;

	@RequestMapping("/LookupMenu")
	public String showMenu(Model model) {

		return "LookupMenu";
	}

	@RequestMapping("/Lookup")
	public String showSubject(Model model) {

		List<Subject> subjects = lookupservice.getSemester();
		model.addAttribute("subjects", subjects);

		return "Lookup";
	}

	@RequestMapping("/DetailLookup")
	public String showDtail(@RequestParam(value = "subNum", required = false) String subNum, Model model) {

		int num = Integer.parseInt(subNum);
		List<Subject> subjects = lookupservice.getSubject(num);
		model.addAttribute("subjects", subjects);

		return "DetailLookup";
	}

	@RequestMapping("/Apply")
	public String apply(Model model) {

		model.addAttribute("subject", new Subject());

		return "Apply";
	}

	// 데이터 검증을 위해 객체에 대해 검증을 해주는 Valid annotation 부착
	// 검증을 한 결과는 BindingResult에 저장된다
	@RequestMapping("/doApply")
	public String doApply(Model model, @Valid Subject subject, BindingResult result) {

		if (result.hasErrors()) {
			List<ObjectError> errors = result.getAllErrors();

			for (ObjectError error : errors)
				System.out.println(error.getDefaultMessage());
			return "Apply"; // 입력데이터가 올바르지 못한 경우 다시 입력창으로 되돌아감
		}

		lookupservice.insertApply(subject);

		return "ApplySuccessed";
	}
	
	@RequestMapping("/ApplyLookup")
	public String showDtail(Model model) {

		int n = 211;
		List<Subject> subjects = lookupservice.getSubject(n);
		model.addAttribute("subjects", subjects);

		return "ApplyLookup";
	}
	
	@RequestMapping("/deleteApply")
	public String deleteApply() {

		lookupservice.deleteApply();
		
		return "deleteSuccessed";
	}

}
