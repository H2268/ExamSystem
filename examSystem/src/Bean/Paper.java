package Bean;

import java.util.Set;

/**
 * Paper entity. @author MyEclipse Persistence Tools
 */

public class Paper implements java.io.Serializable {

	// Fields

	private Integer id;
	private String pname;
	private Set<Choicequestion> questions;

	// Constructors

	/** default constructor */
	public Paper() {
	}

	public Set<Choicequestion> getQuestions() {
		return questions;
	}

	public void setQuestions(Set<Choicequestion> questions) {
		this.questions = questions;
	}

	/** full constructor */
	public Paper(String pname) {
		this.pname = pname;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPname() {
		return this.pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

}