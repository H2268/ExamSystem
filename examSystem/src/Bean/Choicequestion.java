package Bean;

import java.util.Comparator;

/**
 * Choicequestion entity. @author MyEclipse Persistence Tools
 */

public class Choicequestion implements java.io.Serializable,Comparable<Choicequestion>{

	// Fields

	private Integer id;
	
	private String question;
	private String anser;
	private String optionA;
	private String optionB;
	private String optionC;
	private String optionD;

	// Constructors

	/** default constructor */
	public Choicequestion() {
	}

	/** full constructor */
	public Choicequestion( String question, String anser, String optionA, String optionB, String optionC,
			String optionD) {
		
		this.question = question;
		this.anser = anser;
		this.optionA = optionA;
		this.optionB = optionB;
		this.optionC = optionC;
		this.optionD = optionD;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
    public String getQuestion() {
		return this.question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnser() {
		return this.anser;
	}

	public void setAnser(String anser) {
		this.anser = anser;
	}

	public String getOptionA() {
		return this.optionA;
	}

	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}

	public String getOptionB() {
		return this.optionB;
	}

	public void setOptionB(String optionB) {
		this.optionB = optionB;
	}

	public String getOptionC() {
		return this.optionC;
	}

	public void setOptionC(String optionC) {
		this.optionC = optionC;
	}

	public String getOptionD() {
		return this.optionD;
	}

	public void setOptionD(String optionD) {
		this.optionD = optionD;
	}
	
	public int compare(Choicequestion o1, Choicequestion o2) {
		// TODO Auto-generated method stub
		return o1.getId().compareTo(o2.getId());
	}

	
	public int compareTo(Choicequestion o1) {
		// TODO Auto-generated method stub
		if(o1.getId()==this.id)
			return 0;
		else if(o1.getId()<this.id)
			return 1;
		else
			return -1;
	}

	
	

}