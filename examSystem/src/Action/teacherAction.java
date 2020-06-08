package Action;

import java.util.ArrayList;
import java.util.Set;
import java.util.TreeSet;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Bean.Choicequestion;
import Bean.Paper;
import Bean.Score;
import Bean.Student;
import Bean.Teacher;
public class teacherAction extends ActionSupport implements ModelDriven {
	Teacher t=new Teacher();
	Paper p=new Paper();
	Choicequestion c=new Choicequestion();
	Score s=new Score();
	public Choicequestion getC() {
		return c;
	}
	public void setC(Choicequestion c) {
		this.c = c;
	}
	private Session sess;
	private Transaction tr;
	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return t;
	}
	public void init(){
		     //����Ĭ�ϵ������ļ�hibernate.cfg.xml
		    Configuration conf=new Configuration().configure();
			//����Session������Ϊ����Session�����ṩ����
				SessionFactory sessionfactory=conf.buildSessionFactory();
				//��ʼ��session����
				 sess=sessionfactory.openSession();
	}
	public String login(){
		init();
		// ��ʼ����
		 tr = sess.beginTransaction();
		Query query1=sess.createQuery("from Teacher");
		ArrayList<Teacher> teacher_list=(ArrayList<Teacher>)query1.list();
		for(Teacher teacher:teacher_list){
			boolean a=false;
			if(teacher.getTname().equals(t.getTname()))
				a=true;
			while(a){
				if(teacher.getTpassword().equals(t.getTpassword())){
					return SUCCESS;
				}
				else{
					a=false;
				    return ERROR;
		       }
					
			}
		}
		this.addActionError("�˺Ų����ڻ��������");
		return ERROR;
	}
	public String Get(){//��ȡ�Ծ���Ϣ
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
	public String get() {
		try {
			init();
		    tr=sess.beginTransaction();
		    int sid=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		    p=sess.get(Paper.class,sid);
		    Set<Choicequestion> c_list= p.getQuestions();
		    Set <Choicequestion> set1 = new TreeSet <Choicequestion>(); 
		    for(Choicequestion c:c_list)
		    	set1.add(c);
		    ServletActionContext.getServletContext().setAttribute("tlist",set1);
		    tr.commit();
		    return "pEdit";
			 } 
		 catch (Exception exp) {
			 exp.printStackTrace();
			return ERROR;
		}

	}
	public Paper getP() {
		return p;
	}
	public void setP(Paper p) {
		this.p = p;
	}
	public String delete(){//ɾ���Ծ�
		try {
			init();
		    tr=sess.beginTransaction();
		    int sid=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		    p=sess.get(Paper.class,sid);
		    if(p!= null)
		    	sess.delete(p);
		    tr.commit();
            Get();
		    return SUCCESS;
			 } 
		 catch (Exception exp) {
			 exp.printStackTrace();
			return ERROR;
		}

	}
	public String cDelete(){//ɾ������
		try {
			init();
		    tr=sess.beginTransaction();
		    int sid=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		    c=sess.get(Choicequestion.class,sid);
		    if(c!= null)
		    	sess.delete(c);
		    tr.commit();
		    return SUCCESS;
			 } 
		 catch (Exception exp) {
			 exp.printStackTrace();
			return ERROR;
		}

	}
	
	public String cAdd(){//��������
		init();
	    tr=sess.beginTransaction();
	    int sid=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
	    p=sess.get(Paper.class,sid);
	    p.getQuestions().add(c);
	    sess.save(p);
	    tr.commit();
	    return SUCCESS;
	}
	public String getScore(){//��ȡ����ѧ���ɼ�
		init();
		tr=sess.beginTransaction();
		tr.commit();
		Query query=sess.createQuery("from Score");
		ArrayList<Score> score_list=(ArrayList<Score>)query.list();
		ServletActionContext.getServletContext().setAttribute("scorelist",score_list);
	    return SUCCESS;
	}
}
