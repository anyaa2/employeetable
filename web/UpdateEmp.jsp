<%@page contentType="text/html" import="java.sql.*" %>
<html>
<body>
<h1>Updating Employee Record</h1>
<%
String eno=request.getParameter("txtEno");
String sal = request.getParameter("txtSal");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con =
DriverManager.getConnection("jdbc:mysql://localhost:3306/empdb","root","1234");
PreparedStatement stmt = con.prepareStatement("select * from emp where empno=?");
stmt.setString(1, eno);
ResultSet rs = stmt.executeQuery();
if(rs.next()){
out.println("<h1> Employee "+rs.getString(2)+" Exist </h1>");
PreparedStatement pst= con.prepareStatement("update emp set salary=? where empno=?");
pst.setString(1, sal);
pst.setString(2, eno);
pst.executeUpdate();
out.println("<h1>Employee Record updated !!!!!</h1>");
}
else{
out.println("<h1>Employee Record not exist !!!!!</h1>");
}
}catch(Exception e){out.println(e);}
%>
</body>
</html>