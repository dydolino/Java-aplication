package JDBC;

import Others.Movie;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MoviesDAO {

    private static final String URL = "jdbc:mysql://localhost:3306/movieagregator?serverTimezone=UTC&useSSL=false&characterEncoding=utf8";
    private static final String USER = "root";
    private static final String PASS = "dydolino96";
    private Connection connection = null;

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

    public void addMovie(Movie movie) {
        final String sql = "insert into movies(title, director, URL, year) values(?, ?, ?,?)";
        try {
            PreparedStatement prepStmt = connection.prepareStatement(sql);
            prepStmt.setString(1, movie.getTitle());
            prepStmt.setString(2, movie.getDirector());
            prepStmt.setString(3, movie.getURL());
            prepStmt.setString(4, movie.getYear());
            prepStmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Could not save record");
            e.printStackTrace();
        }

    }

    public Movie getMovie(int id) {
        final String sql = "select id, title, director, URL, year from movies where id = ?";
        try {
            PreparedStatement prepStmt = connection.prepareStatement(sql);
            prepStmt.setInt(1, id);
            ResultSet result = prepStmt.executeQuery();
            if (result.next()) {
                Movie movie = new Movie();
                movie.setId(result.getInt("id"));
                movie.setTitle(result.getString("title"));
                movie.setDirector(result.getString("director"));
                movie.setURL(result.getString("URL"));
                movie.setYear(result.getString("year"));
                return movie;
            }
        } catch (SQLException e) {
            System.out.println("Could not get movie");
        }
        return null;
    }

    public List<Movie> getAllMovies() {
        List<Movie> movieList = new ArrayList<>();

        final String sql = "select * from movies";
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                Movie movie = new Movie();
                movie.setId(resultSet.getInt("id"));
                movie.setTitle(resultSet.getString("title"));
                movie.setDirector(resultSet.getString("director"));
                movie.setURL(resultSet.getString("URL"));
                movie.setYear(resultSet.getString("year"));
                movieList.add(movie);
            }

        } catch (SQLException var10) {
            System.out.println("Nie można wczytać zawartości bazy");
        }

        return movieList;
    }

    public void removeMovie(int id) {

        final String sql = "delete from movies where id = ?";
        try {
            PreparedStatement prepStmt = connection.prepareStatement(sql);
            prepStmt.setLong(1, id);
            prepStmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Could not delete row");
        }

    }

    public void close() {
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }


}
