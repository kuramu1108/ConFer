package com.confer.rest;

import javax.ws.rs.*;
import javax.ws.rs.core.*;

@Path("/confer")
public class ConferService {
	@Path("hello")
	@GET
	@Produces(MediaType.TEXT_PLAIN)
	public String hello() {
	 return "Hello World";
	}
}
