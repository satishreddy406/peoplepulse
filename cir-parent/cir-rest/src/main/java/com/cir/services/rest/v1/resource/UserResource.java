package com.cir.services.rest.v1.resource;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cir.services.rest.v1.model.User;
import com.cir.services.rest.v1.service.api.UserService;
import com.cir.services.rest.v1.service.impl.UserServiceImpl;

@Path("/v1/user")
@Component
public class UserResource {

	@Autowired
	UserService userService;

	/*
	 * @GET public Response getName() { String name = "Arjun"; return
	 * Response.status(Status.OK).entity(name).build(); }
	 */
	/*@GET
	public Response getUsers() {

		List<User> users = userService.getUsers();
		return Response.status(Status.OK).entity(users).build();
	}*/
	
	/*@GET
	@Path("{id}")
	public Response getUserById(@PathParam("id") String id) {
		User user  =userService.getUser(id);
		user.setUserId(01);
		user.setUsername("reddylakshmi");
		user.setLocation("Hyderabad");
		return Response.status(Status.OK).entity(user).build();
	}
	
	@DELETE
	@Path("{id}")
	public String deleteUserById(@PathParam("id") String id) {
		int rows  =userService.deleteUser(id);
		return "Deleted Successfully";
	}*/
	
	
    @POST
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.TEXT_PLAIN})
    public String createUser(User user) throws Exception{
        int result = userService.createUser(user);
        System.out.println("result :: " + result);
        return "ok";
    }
    
    /*@PUT
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.TEXT_PLAIN})
    public String updateUser(User user) throws Exception{
        int result = userService.updateUser(user);
        System.out.println("result :: " + result);
        return "ok";
    }*/
}
