package kr.ac.hansung.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.model.Subject;

@Repository
public class LookupDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	// 학기별 총 학점 조회
	public List<Subject> getSemester() {

		String sqlStatement = "select year, semester, subNum, sum(credit) as '취득학점'"
				+"from subject group by year, semester, subNum order by year";

		return jdbcTemplate.query(sqlStatement, new RowMapper<Subject>() {

			@Override
			public Subject mapRow(ResultSet rs, int rowNum) throws SQLException {

				Subject subject = new Subject();

				subject.setYear(rs.getInt("year"));
				subject.setSemester(rs.getInt("semester"));
				subject.setSubNum(rs.getInt("subNum"));
				subject.setCredit(rs.getString("취득학점"));
			
				return subject;
			}
		});
	}

	// 학기별 상세정보 조회
	public List<Subject> getSubject(int subNum) {

		String sqlStatement = "select year, semester, subName, subType, professor, credit from subject where subNum = ?";

		return jdbcTemplate.query(sqlStatement, new Object[] { subNum }, new RowMapper<Subject>() {

			@Override
			public Subject mapRow(ResultSet rs, int rowNum) throws SQLException {

				Subject subject = new Subject();

				subject.setYear(rs.getInt("year"));
				subject.setSemester(rs.getInt("semester"));
				subject.setSubName(rs.getString("subName"));
				subject.setSubType(rs.getString("subType"));
				subject.setProfessor(rs.getString("professor"));
				subject.setCredit(rs.getString("credit"));

				return subject;
			}
		});
	}

	// 수강신청 내역 insert
	public boolean insertApply(Subject subject) {

		int year = 2021;
		int semester = 1;
		String subName = subject.getSubName();
		String subType = subject.getSubType();
		String professor = subject.getProfessor();
		String credit = subject.getCredit();
		int subNum = 211;

		String sqlStatement = "insert into subject (year, semester, subName, subType, professor, credit, subNum) values(?,?,?,?,?,?,?)";

		return (jdbcTemplate.update(sqlStatement,
				new Object[] { year, semester, subName, subType, professor, credit, subNum }) == 1);
	}

	// 수강신청 내역 delete
	public boolean deleteApply() {

		String sqlStatement = "delete from subject where subNum=211";

		return (jdbcTemplate.update(sqlStatement) == 1);
	}
}
