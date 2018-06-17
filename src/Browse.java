import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/browse")
public class Browse extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        MoviesDAO moviesDAO=new MoviesDAO();


        List<String>titles=new ArrayList<>();
        for (Movie m:moviesDAO.getAllMovies()){
            titles.add(m.getTitle());
        }
        request.setAttribute("titles",titles);
        request.getRequestDispatcher("/browse.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
