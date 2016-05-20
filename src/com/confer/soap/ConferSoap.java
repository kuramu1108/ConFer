package com.confer.soap;

import javax.annotation.Resource;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.servlet.ServletContext;
import javax.xml.ws.Endpoint;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;

import com.confer.*;

/* http://localhost:8080/{projectname}/soap/confer
 * 
 */
@WebService
public class ConferSoap {
	@Resource
	private WebServiceContext context;
	
	private ConferApplication getConferApp() throws Exception {
		// This needs to be local variable in your "getDiaryApp" method
		// It will not work if declared as a field (since field initializers
		// are executed before dependency injection takes place).
		ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
		synchronized (application) {
			ConferApplication conferApp = (ConferApplication)application.getAttribute("conferApp");
			if (conferApp == null) {
				conferApp = new ConferApplication();
				conferApp.setUserFilePath(application.getRealPath("WEB-INF/users.xml"));
				conferApp.setPollFilePath(application.getRealPath("WEB-INF/polls.xml"));
				application.setAttribute("conferApp", conferApp);
			}
			return conferApp;
		}
	}
	
	
	// create poll
	@WebMethod
	public void serviceCreate() {
		
	}
	
	// view a list of poll
	@WebMethod
	public Polls getPolls() {
		try {
			ConferApplication conferApp = getConferApp();
			Polls polls = new Polls();
			return polls;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	@WebMethod
	public int add(int a, int b)
	{
		return a+b;
	}
}
