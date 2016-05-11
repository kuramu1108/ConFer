package com.confer.rest;

import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;

import java.io.*;

import com.confer.*;

@Path("/confer")
public class ConferService {
	@Context
	private ServletContext application;
	
	private ConferApplication getConferApp() throws Exception {
		synchronized(application) {
			ConferApplication conferApp = (ConferApplication) application.getAttribute("conferApp");
			if (conferApp == null) {
				conferApp = new ConferApplication();
				conferApp.setUserFilePath(application.getRealPath("WEB-INF/users.xml"));
				conferApp.setPollFilePath(application.getRealPath("WEB-INF/polls.xml"));
				application.setAttribute("conferApp", conferApp);
			}
			return conferApp;
		}
	}
	
	@Path("polls")
	@GET
	@Produces(MediaType.APPLICATION_XML)
	public Polls getPolls() throws Exception {
		ConferApplication conferApp = getConferApp();
		return conferApp.getPolls();
	}
	
	
	
	@Path("hello")
	@GET
	@Produces(MediaType.TEXT_PLAIN)
	public String hello() {
	 return "Hello World";
	}
	
	
}
