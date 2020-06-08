package Action;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Bean.Choicequestion;
import Bean.Paper;
import Bean.Score;
import Bean.Student;

public class studentAction extends ActionSupport implements ModelDriven{
	
	Student s=new Student();
    Choicequestion c=new Choicequestion();
    Score s2=new Score();
    public Choicequestion getC() {
		return c;
	}
	public void setC(Choicequestion c) {
		this.c = c;
	}
	private String anser;
	public String getAnser() {
		return anser;
	}
	public void setAnser(String anser) {
		this.anser = anser;
	}
	private Paper p;
    public Paper getP() {
		return p;
	}
	public void setP(Paper p) {
		this.p = p;
	}
	private Session sess;
	private Transaction tr; 
    @Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return s;
	}
	private void init(){
		Configuration conf = new Configuration().configure();
        SessionFactory sf = conf.buildSessionFactory();
		// 创建Session
		sess = sf.openSession();
	}
	public String login(){
		init();
		// 开始事务
		tr = sess.beginTransaction();
		Query query1=sess.createQuery("from Student");
		ArrayList<Student> student_list=(ArrayList<Student>)query1.list();
		for(Student student:student_list){
			boolean a=false;
			if(student.getSnumber().equals(s.getSnumber())){
				ServletActionContext.getRequest().getSession().setAttribute("name",student.getSname());
				a=true;
			}
			while(a){
				if(student.getSpassword().equals(s.getSpassword())){
					return SUCCESS;
				}
				else{
					a=false;
					return ERROR;
					
				}
					
			}
		}
		this.addActionError("账号不存在或密码错误");
		return INPUT;
		
	}
	public String Get(){
		try {
			init();
		    tr=sess.beginTransaction();
		    tr.commit();
		    Query query=sess.createQuery("from Paper");
		    ArrayList<Paper> paper_list=(ArrayList<Paper>)query.list();
			ServletActionContext.getServletContext().setAttribute("paperlist",paper_list);
		    return SUCCESS;
		    } 
		 catch (Exception exp) {
			 exp.printStackTrace();
			return ERROR;
		}
	}
	public String Gets(){
		try {
			init();
		    tr=sess.beginTransaction();
		    int sid=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		    p=sess.get(Paper.class,sid);
		    Set<Choicequestion> c_list= p.getQuestions();
		    Set <Choicequestion> set1 = new TreeSet <Choicequestion>(); 
		    for(Choicequestion c:c_list)
		    	set1.add(c);
		    ServletActionContext.getRequest().getSession().setAttribute("paperId",sid);
		    ServletActionContext.getServletContext().setAttribute("clist",set1);
		    tr.commit();
		    return "sJoin";
			 } 
		 catch (Exception exp) {
			 exp.printStackTrace();
			return ERROR;
		}

	}
	public String Check(){//批改试卷
		init();
		tr=sess.beginTransaction();
		String name=ServletActionContext.getRequest().getParameter("sName");
		int sid=Integer.parseInt(ServletActionContext.getRequest().getParameter("paperId"));
		p=sess.get(Paper.class,sid);
		String pName=p.getPname();
		ServletActionContext.getRequest().getSession().setAttribute("pName", pName);
		Set<Choicequestion> c_list= p.getQuestions();
	    Set <Choicequestion> set1 = new TreeSet <Choicequestion>(); 
	    for(Choicequestion c:c_list)
	    	set1.add(c);
	    ArrayList<String> an=new ArrayList<String>();
	    for(Choicequestion c1:set1)
	    	an.add(c1.getAnser());
	    String[] a=anser.split("");
	    int score=100;
	    int i=a.length-1;	
	    while(i>=0){
	    	if(!an.get(i).equals(a[i]))
	    		score-=20;
	    	i--;
	    }
	    ServletActionContext.getRequest().getSession().setAttribute("score",score);
	    s2.setName(name);
	    s2.setScore(score);
	    s2.setPname(pName);
	    sess.save(s2);
	    tr.commit();
	    return "score";
	}

}
