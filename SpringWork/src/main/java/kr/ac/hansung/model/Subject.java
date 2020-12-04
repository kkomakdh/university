package kr.ac.hansung.model;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Subject {

	private int year;
	private int semester;
	private int subNum;

	@NotEmpty(message = "Credit cannot be empty")
	private String credit;

	@Size(min = 2, max = 20, message = "subject name must be between 2 and 20 chars")
	@NotEmpty(message = "subject name cannot be empty")
	private String subName;

	@Size(min = 2, max = 4, message = "subject type must be between 2 and 4 chars")
	@NotEmpty(message = "subject type cannot be empty")
	private String subType;

	@NotEmpty(message = "professor cannot be empty")
	private String professor;
}
