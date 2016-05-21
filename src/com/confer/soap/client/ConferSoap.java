/**
 * ConferSoap.java
 *
 * このファイルはWSDLから自動生成されました / [en]-(This file was auto-generated from WSDL)
 * Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java生成器によって / [en]-(by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.)
 */

package com.confer.soap.client;

public interface ConferSoap extends java.rmi.Remote {
    public java.lang.String createPoll(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3, java.lang.String arg4, java.lang.String[] arg5) throws java.rmi.RemoteException;
    public com.confer.soap.client.Polls getPolls(com.confer.soap.client.RequestParam arg0) throws java.rmi.RemoteException;
    public void closePoll(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2) throws java.rmi.RemoteException;
    public boolean validPassword(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException;
}
