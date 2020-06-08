package Action;

import java.util.ArrayList;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.hibernate.service.ServiceRegistry;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Bean.Admin;

import Bean.Student;
import Bean.Teacher;

public class adminAction extends ActionSupport implements ModelDriven {
	private Session sess;
	private Transaction tx;
	private Student s;
	Admin a=new Admin();
	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return a;
	}
	private void init()
	{
		//����Ĭ�ϵ������ļ�hibernate.cfg.xml
		Configuration conf=new Configuration().configure();
		SessionFactory sessionfactory=conf.buildSessionFactory();
		//��ʼ��session����
		 sess=sessionfactory.openSession();
	}
	public String login(){
		System.out.println(a.getAname());
		init();
		// ��ʼ����
		tx = sess.beginTransaction();
		Query query1=sess.createQuery("from Admin");
		ArrayList<Admin> admin_list=(ArrayList<Admin>)query1.list();
		for(Admin admin:admin_list){
			System.out.println("******");
			System.out.println(admin.getAname());
			boolean b=false;
			if(admin.getAname().equals(a.getAname())){
				System.out.println("����Ա����");
				b=true;
			}
			while(b){
				System.out.println(admin.getApassword());
				System.out.println(a.getApassword());
				if(admin.getApassword().equals(a.getApassword())){
					System.out.println("��¼�ɹ�");
					return SUCCESS;
				}
				else{
					b=false;
					System.out.println("ʧ��");
					return ERROR;
					
				}
			}
		}
		this.addActionError("�˺Ų����ڻ��������");
		return ERROR;
	}
	public String add(){//���ѧ��
		try{
		    init();
		    tx=sess.beginTransaction();
		    sess.save(s);
		    tx.commit();
		    Query query=sess.createQuery("from Student");
		    ArrayList<Student> student_list=(ArrayList<Student>)query.list();
			ServletActionContext.getServletContext().setAttribute("studentlist",student_list);
		    return SUCCESS;
		}
		catch(Exception e){
			e.printStackTrace();
			return ERROR; 
		  }
	}
	public String delete(){//ɾ��ѧ��
		try{
			init();
		    tx=sess.beginTransaction();
		    int sid=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		    s=sess.get(Student.class,sid);
		    sess.delete(s);
		    tx.commit();
		    Query query=sess.createQuery("from Student");
		    ArrayList<Student> student_list=(ArrayList<Student>)query.list();
			ServletActionContext.getServletContext().setAttribute("studentlist",student_list);
		    return SUCCESS;
		}
		catch(Exception e){
			e.printStackTrace();
		    return ERROR;
		}
	}
	public String Gets() {
		try {
			init();
		    tx=sess.beginTransaction();
		    tx.commit();
		    Query query=sess.createQuery("from Student");
		    ArrayList<Student> student_list=(ArrayList<Student>)query.list();
			ServletActionContext.getServletContext().setAttribute("studentlist",student_list);
		    return SUCCESS;
		    } 
		 catch (Exception exp) {
			 exp.printStackTrace();
			return ERROR;
		}

	}
	public String Get() {
		try {
			init();
		    tx=sess.beginTransaction();
		    int sid=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		    s=sess.get(Student.class,sid);
		    tx.commit();
		    return "sEdit";
			 } 
		 catch (Exception exp) {
			 exp.printStackTrace();
			return ERROR;
		}

	}

	public String edit(){//�޸�ѧ����Ϣ
		try{
			init();
		    tx=sess.beginTransaction();
		    sess.update(s);
		    tx.commit();
		    Query query=sess.createQuery("from Student");
		    ArrayList<Student> student_list=(ArrayList<Student>)query.list();
			ServletActionContext.getServletContext().setAttribute("studentlist",student_list);
		    return SUCCESS;
		}
		catch(Exception e){
			e.printStackTrace();
		    return ERROR;
		}
	}
	public Student getS() {
		return s;
	}
	public void setS(Student s) {
		this.s = s;
	}
}
