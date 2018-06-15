import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MoviesDAO {

    private static final String URL = "jdbc:mysql://localhost:3306/movieagregator?serverTimezone=UTC&useSSL=false&characterEncoding=utf8";
    private static final String USER = "root";
    private static final String PASS = "dydolino96";
    private Connection connection=null;

    public MoviesDAO() {


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USER, PASS);
            if (connection != null) {
                System.out.println("Connection established");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void close() {
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        MoviesDAO moviesDAO=new MoviesDAO();
        //moviesDAO.close();
    }


}
