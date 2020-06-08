package Bean;



/**
 * Student entity. @author MyEclipse Persistence Tools
 */

public class Student  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Integer snumber;
     private String sname;
     private String spassword;


    // Constructors

    /** default constructor */
    public Student() {
    }

	/** minimal constructor */
    public Student(Integer snumber, String spassword) {
        this.snumber = snumber;
        this.spassword = spassword;
    }
    
    /** full constructor */
    public Student(Integer snumber, String sname, String spassword) {
        this.snumber = snumber;
        this.sname = sname;
        this.spassword = spassword;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSnumber() {
        return this.snumber;
    }
    
    public void setSnumber(Integer snumber) {
        this.snumber = snumber;
    }

    public String getSname() {
        return this.sname;
    }
    
    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getSpassword() {
        return this.spassword;
    }
    
    public void setSpassword(String spassword) {
        this.spassword = spassword;
    }
   








}