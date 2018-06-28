package Others;

import JDBC.MoviesDAO;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/browse")
public class Browse extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        MoviesDAO moviesDAO = null;
        moviesDAO = getMoviesDAO(moviesDAO);
        List<Movie> movieList = moviesDAO.getAllMovies();

        request.setAttribute("moviesList", movieList);

        request.getRequestDispatcher("/browse.jsp").forward(request, response);
    }

    static MoviesDAO getMoviesDAO(MoviesDAO moviesDAO) {
        try {
            moviesDAO = new MoviesDAO();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NamingException e) {
            e.printStackTrace();
        }
        return moviesDAO;
    }
}
