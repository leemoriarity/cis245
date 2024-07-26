import java.sql.*;

public class JDBCselect
{
    public static void main(String[] args)
    {
        String connectionUrl =  "jdbc:sqlserver://38.115.60.114:1433;" +
                                "databaseName=ONL01_Student14_DB;" +
                                "encrypt=false"; //PKIX path building failed workaround
        String user = "ONL01_Student14";
        String password = "AFEBCVFXGS;";

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(connectionUrl, user, password);
            stmt = conn.createStatement();
            String s = "select * from OWNER";
            rs = stmt.executeQuery(s);
            while (rs.next())
            {
                System.out.println(rs.getString("Address"));
            }
            conn.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(rs != null) try { rs.close(); } catch(Exception e) {}
            if(stmt != null) try { stmt.close(); } catch(Exception e) {}
            if(conn != null) try { conn.close(); } catch(Exception e) {}
        }
    }
}