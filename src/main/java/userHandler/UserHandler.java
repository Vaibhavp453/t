package userHandler;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import databaseDriver.DBSQL;

public class UserHandler
{
	public int createAccount(String uname, String pword, 
			String email, String phone)
	{
		System.out.println("UNAME="+uname);
		System.out.println("PWORD="+pword);
		System.out.println("e="+email);
		System.out.println("ph="+phone);
		
		int valid=-1;
		
		DBSQL sql=new DBSQL("Accounts");
		
		String query="SELECT * FROM endUsers "
				+"WHERE username='"+uname+"';";
				
		System.out.println("Q="+query);
		
		ArrayList<Object[]> data=sql.select(query);
		
		String tmpQuery="SELECT * FROM endUsers "
				+"WHERE username='"+email+"';";
		ArrayList<Object[]> tmpData=sql.select(query);
		
		if(data.size()!=0)
		{
			System.out.println(0);
			System.out.println("Username taken!");
			
			valid=0; //Username taken error
		}
		else if(tmpData.size()!=0)
		{
			System.out.println(1);
			System.out.println("Email taken!");
			
			valid=1; //Email taken error
		}
		else if(uname.contains("\"")//username
				|| uname.contains("\'")
				|| uname.contains(" ")
				|| uname.length()>32
				|| uname.length()<4)
		{
			System.out.println(2);
			System.out.println("Username doesnt meet criteria");
				
			valid=2; //Username doesnt meet criteria
		}
		else if(pword.contains("\"")//Password
				|| pword.contains("\'")
				|| pword.contains(" ")
				|| pword.length()>32
				|| pword.length()<4)
		{
			System.out.println(3);
			System.out.println("Password doesnt meet criteria");
				
			valid=3; //Password doesnt meet criteria
		}
		else if(email.contains("\"")//email
				|| email.contains("\'")
				|| email.contains(" ")
				|| email.length()>64
				|| email.length()<4)
		{
			System.out.println(4);
			System.out.println("Email doesnt meet criteria");
				
			valid=4; //Email doesnt meet criteria
		}
		else if(phone.contains("\"")//Phone
				|| phone.contains("\'")
				|| phone.contains(" ")
				|| phone.length()>32
				|| phone.length()<4)
		{
			System.out.println(5);
			System.out.println("Phone number doesnt meet criteria");
				
			valid=5; //Phone number doesnt meet criteria
		}
		else
		{
			//Insert into endUsers VALUES (1, 'Admin', 'root', 'Admin@gmail.com', '6090001111', true, '2001-01-01 00:00:00', true);
			
			String table="endUsers";
			int uid=getNewAccountID();
			
			String CAQuery="INSERT INTO "+table+" VALUES ("
					+uid+", \'"+uname+"\', \'"+pword+"\', \'"
					+email+"\', \'"+phone+"\', \'"
					+getLastAccessed()+"\', "+true+");";
			
			System.out.println(CAQuery);
			
			sql.updateTable(CAQuery);
			
			System.out.println(6);
			System.out.println("Account Created");
					
			//System.out.println(sql.getRowCount("endUsers"));
			
			valid=6; //Account created
		}
		
		return valid;
	}
	
	public boolean deleteAccount(String uname, String pword)
	{
		boolean isDeleted=false;
		
		DBSQL sql=new DBSQL("Accounts");
		
		String query="SELECT * FROM endUsers "
				+"WHERE username=\'"+uname+"\' AND isActive=true;";
		
		ArrayList<Object[]> data=sql.select(query);
		
		if(data.size()!=1)
		{
			System.out.println(1);
			System.out.println("Incorrect information");
			
			isDeleted=false;
		}
		else if(!data.get(0)[2].equals(pword))
		{
			System.out.println(2);
			System.out.println("Incorrect information");
			
			isDeleted=false;
		}
		else if(uname.contains("\"")
				|| uname.length()>32)
		{
			System.out.println(3);
			System.out.println("Incorrect information");
				
			isDeleted=false;
		}
		else if(pword.contains("\"")
			|| pword.length()>32)
		{
			System.out.println(3);
			System.out.println("Incorrect information");
					
			isDeleted=false;
		}
			else
			{
				sql.delete(uname);
				
				isDeleted=true;
			}
		
		return isDeleted;
	}
	
	public String getLastAccessed()
	{
		String lastAccessed="2001-01-01 00:00:00";
		
		LocalDateTime datetime = LocalDateTime.now();
		DateTimeFormatter formatter 
			= DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		
		lastAccessed=datetime.format(formatter);
		
		return lastAccessed;
	}
	
	public int getNewAccountID()
	{
		DBSQL sql=new DBSQL("Accounts");
		
		return sql.getRowCount("endUsers")+1;
	}
	
	public boolean isAdmin(String uname)
	{
		boolean isCR=false;
		
		DBSQL sql=new DBSQL("Accounts");
		
		String query="SELECT * FROM administrator "
				+"WHERE username=\'"+uname+"\' AND isActive=true;";
				
		System.out.println(query);
		
		ArrayList<Object[]> data=sql.select(query);
		
		if(data.size()!=1)
		{
			System.out.println(1);
			System.out.println("Incorrect information");
			
			isCR=false;
		}
		else
		{
			isCR=true;
		}
		
		return isCR;
	}
	
	public boolean isCustomerRep(String uname)
	{
		boolean isCR=false;
		
		DBSQL sql=new DBSQL("Accounts");
		
		String query="SELECT * FROM customerReps "
				+"WHERE username=\'"+uname+"\' AND isActive=true;";
				
		System.out.println(query);
		
		ArrayList<Object[]> data=sql.select(query);
		
		if(data.size()!=1)
		{
			System.out.println(1);
			System.out.println("Incorrect information");
			
			isCR=false;
		}
		else
		{
			isCR=true;
		}
		
		return isCR;
	}
	
	public boolean loginAccount(String uname, String pword)
	{
		//System.out.println(uname);
		//System.out.println(pword);
		
		boolean valid=false;
		
		DBSQL sql=new DBSQL("Accounts");
		
		String query="SELECT * FROM endUsers "
				+"WHERE username=\'"+uname+"\' AND isActive=true;";
				
		System.out.println(query);
		
		ArrayList<Object[]> data=sql.select(query);
		
		if(data.size()!=1)
		{
			System.out.println(1);
			System.out.println("Incorrect information");
			
			valid=false;
		}
		else if(!data.get(0)[2].equals(pword))
		{
			System.out.println(2);
			System.out.println("Incorrect information");
			
			valid=false;
		}
		else if(uname.contains("\"")
			|| uname.length()>32)
		{
			System.out.println(3);
			System.out.println("Incorrect information");
			
			valid=false;
		}
		else if(pword.contains("\"")
				|| pword.length()>32)
			{
				System.out.println(3);
				System.out.println("Incorrect information");
				
				valid=false;
			}
		else
		{
			System.out.println(4);
			System.out.println("LOGIN");
			
			String euTable="endUsers";
			String crTable="customerReps";
			String aTable="administrator";
			
			String updateEUQuery="UPDATE "+euTable+" SET lastAccessed=\'"
					+getLastAccessed()+"\' WHERE username=\'"+uname
					+"\' AND isActive=true;";
			
			String updateCRQuery="UPDATE "+crTable+" SET lastAccessed=\'"
					+getLastAccessed()+"\' WHERE username=\'"+uname
					+"\' AND isActive=true;";
			
			String updateAQuery="UPDATE "+aTable+" SET lastAccessed=\'"
					+getLastAccessed()+"\' WHERE username=\'"+uname
					+"\' AND isActive=true;";
			
			sql.updateTable(updateEUQuery);
			sql.updateTable(updateCRQuery);
			sql.updateTable(updateAQuery);
			
			valid=true;
		}
		
		return valid;
	}
	
	public void searchItems(String[] keywords)
	{
		DBSQL sql=new DBSQL("Items");
		
		String query="SELECT * FROM Items "
				+"WHERE ";
		
		
		//query+="xyz like \"%"+keywords[i]+"%\" ";
		boolean isFirst=true;
		for(int i=0; i<keywords.length; i++)
		{
			if(keywords[i].length()>0)
			{
				if(isFirst)
				{
					isFirst=false;
				}
				else
				{
					query+="OR "; //Can later check for quotes to use AND
				}
				
				query+="UPPER(name) LIKE \"%"+keywords[i].toUpperCase()
						+"%\" ";
			}
		}
		
		System.out.println(query);
		
		ArrayList<Object[]> data=sql.select(query);
		
		//return data;
	}
	
	public ArrayList<String> searchProfile(String[] keywords)
	{
		DBSQL sql=new DBSQL("Accounts");
		
		ArrayList<String> users=new ArrayList<String>();
		
		for(int i=0; i<keywords.length; i++)
		{
			String query="SELECT * FROM endUsers "
					+"WHERE username=\'"+keywords[i]+"\';";
					
			System.out.println(query);
			
			ArrayList<Object[]> data=sql.select(query);
			
			if(data.size()!=1)
			{
				System.out.println(1);
				System.out.println("Incorrect information");
			}
			else
			{
				users.add(String.valueOf(data.get(0)[1]));
			}
		}
		
		return users;
	}
}