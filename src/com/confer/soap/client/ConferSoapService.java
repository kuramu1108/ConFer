/**
 * ConferSoapService.java
 *
 * このファイルはWSDLから自動生成されました / [en]-(This file was auto-generated from WSDL)
 * Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java生成器によって / [en]-(by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.)
 */

package com.confer.soap.client;

public interface ConferSoapService extends javax.xml.rpc.Service {
    public java.lang.String getConferSoapPortAddress();

    public com.confer.soap.client.ConferSoap getConferSoapPort() throws javax.xml.rpc.ServiceException;

    public com.confer.soap.client.ConferSoap getConferSoapPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
