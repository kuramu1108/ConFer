package com.confer.soap.client;

public class ConferSoapProxy implements com.confer.soap.client.ConferSoap {
  private String _endpoint = null;
  private com.confer.soap.client.ConferSoap conferSoap = null;
  
  public ConferSoapProxy() {
    _initConferSoapProxy();
  }
  
  public ConferSoapProxy(String endpoint) {
    _endpoint = endpoint;
    _initConferSoapProxy();
  }
  
  private void _initConferSoapProxy() {
    try {
      conferSoap = (new com.confer.soap.client.ConferSoapServiceLocator()).getConferSoapPort();
      if (conferSoap != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)conferSoap)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)conferSoap)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (conferSoap != null)
      ((javax.xml.rpc.Stub)conferSoap)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.confer.soap.client.ConferSoap getConferSoap() {
    if (conferSoap == null)
      _initConferSoapProxy();
    return conferSoap;
  }
  
  public java.lang.String createPoll(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3, java.lang.String arg4, java.lang.String[] arg5) throws java.rmi.RemoteException{
    if (conferSoap == null)
      _initConferSoapProxy();
    return conferSoap.createPoll(arg0, arg1, arg2, arg3, arg4, arg5);
  }
  
  public com.confer.soap.client.Polls getPolls(java.lang.String creatorID, java.lang.String status, int minRespose) throws java.rmi.RemoteException{
    if (conferSoap == null)
      _initConferSoapProxy();
    return conferSoap.getPolls(creatorID, status, minRespose);
  }
  
  public void closePoll(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2) throws java.rmi.RemoteException{
    if (conferSoap == null)
      _initConferSoapProxy();
    conferSoap.closePoll(arg0, arg1, arg2);
  }
  
  public boolean validPassword(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException{
    if (conferSoap == null)
      _initConferSoapProxy();
    return conferSoap.validPassword(arg0, arg1);
  }
  
  
}