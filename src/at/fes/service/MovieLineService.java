package at.fes.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import at.fes.vo.Encryptor;
import at.fes.vo.Movie;
import at.fes.vo.User;

@Path("movieDetails")
public class MovieLineService {
	private Connection getConnection() throws SQLException {
		Connection connect;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connect = DriverManager
					.getConnection("jdbc:mysql://10.115.1.7/DB_movieLine?user=nettest&password=test");
			return connect;
		} catch (ClassNotFoundException e) {
			return null;
		}

	}

	@GET
	@Path("/movie/")
	@Produces({ MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON })
	public List<Movie> getInfo() throws SQLException {
		Connection c = getConnection();
		Statement stmt = c.createStatement();
		List<Movie> MovieList = new ArrayList<Movie>();

		ResultSet resultSet = stmt.executeQuery("select * from Movie");
		resultSet.first();

		while (!(resultSet.isAfterLast())) {
			Movie m = new Movie(resultSet.getString(1), resultSet.getDate(2),
					resultSet.getInt(3), resultSet.getString(4),
					resultSet.getDate(5), resultSet.getString(6),
					resultSet.getInt(7), resultSet.getInt(8),
					resultSet.getInt(9), resultSet.getInt(10),
					resultSet.getInt(11), resultSet.getInt(12),
					resultSet.getInt(13), resultSet.getInt(14),
					resultSet.getInt(15));
			MovieList.add(m);

			resultSet.next();
		}
		stmt.close();
		c.close();

		return MovieList;

	}
	
	@POST
	@Path("/login/")
	@Produces({ MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON })
	public Response checkUser(User u) throws SQLException {
		Connection c = getConnection();
		Statement stmt = c.createStatement();
		User realUser = null;

		String hashPW = Encryptor.doOneWayEncrypt(u.getPassword());
		
		System.out.println(u.getName() + " - " + hashPW);
		
		ResultSet resultSet = stmt.executeQuery("select * from User");
		resultSet.first();

		while (!(resultSet.isAfterLast())) {
			realUser =  new User(resultSet.getString(1), resultSet.getString(2));

			resultSet.next();
		}
		stmt.close();
		c.close();
		
		if (realUser.getName().equals(u.getName()) && realUser.getPassword().equals(hashPW)) {
			return Response.status(201).build();
		}
		
		else {
			return Response.status(400).build();
		}

	}
}
