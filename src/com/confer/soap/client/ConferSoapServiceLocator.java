/**
 * ConferSoapServiceLocator.java
 *
 * このファイルはWSDLから自動生成されました / [en]-(This file was auto-generated from WSDL)
 * Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java生成器によって / [en]-(by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.)
 */

package com.confer.soap.client;

public class ConferSoapServiceLocator extends org.apache.axis.client.Service implements com.confer.soap.client.ConferSoapService {

    public ConferSoapServiceLocator() {
    }


    public ConferSoapServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public ConferSoapServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // ConferSoapPortのプロキシクラスの取得に使用します / [en]-(Use to get a proxy class for ConferSoapPort)
    private java.lang.String ConferSoapPort_address = "http://localhost:8080/confer/soap/confer";

    public java.lang.String getConferSoapPortAddress() {
        return ConferSoapPort_address;
    }

    // WSDDサービス名のデフォルトはポート名です / [en]-(The WSDD service name defaults to the port name.)
    private java.lang.String ConferSoapPortWSDDServiceName = "ConferSoapPort";

    public java.lang.String getConferSoapPortWSDDServiceName() {
        return ConferSoapPortWSDDServiceName;
    }

    public void setConferSoapPortWSDDServiceName(java.lang.String name) {
        ConferSoapPortWSDDServiceName = name;
    }

    public com.confer.soap.client.ConferSoap getConferSoapPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(ConferSoapPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getConferSoapPort(endpoint);
    }

    public com.confer.soap.client.ConferSoap getConferSoapPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.confer.soap.client.ConferSoapPortBindingStub _stub = new com.confer.soap.client.ConferSoapPortBindingStub(portAddress, this);
            _stub.setPortName(getConferSoapPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setConferSoapPortEndpointAddress(java.lang.String address) {
        ConferSoapPort_address = address;
    }

    /**
     * 与えられたインターフェースに対して、スタブの実装を取得します。 / [en]-(For the given interface, get the stub implementation.)
     * このサービスが与えられたインターフェースに対してポートを持たない場合、 / [en]-(If this service has no port for the given interface,)
     * ServiceExceptionが投げられます。 / [en]-(then ServiceException is thrown.)
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.confer.soap.client.ConferSoap.class.isAssignableFrom(serviceEndpointInterface)) {
                com.confer.soap.client.ConferSoapPortBindingStub _stub = new com.confer.soap.client.ConferSoapPortBindingStub(new java.net.URL(ConferSoapPort_address), this);
                _stub.setPortName(getConferSoapPortWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("インターフェースに対するスタブの実装がありません: / [en]-(There is no stub implementation for the interface:)  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * 与えられたインターフェースに対して、スタブの実装を取得します。 / [en]-(For the given interface, get the stub implementation.)
     * このサービスが与えられたインターフェースに対してポートを持たない場合、 / [en]-(If this service has no port for the given interface,)
     * ServiceExceptionが投げられます。 / [en]-(then ServiceException is thrown.)
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("ConferSoapPort".equals(inputPortName)) {
            return getConferSoapPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://soap.confer.com/", "ConferSoapService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://soap.confer.com/", "ConferSoapPort"));
        }
        return ports.iterator();
    }

    /**
    * 指定したポート名に対するエンドポイントのアドレスをセットします / [en]-(Set the endpoint address for the specified port name.)
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("ConferSoapPort".equals(portName)) {
            setConferSoapPortEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" 未知のポートに対してはエンドポイントのアドレスをセットできません / [en]-(Cannot set Endpoint Address for Unknown Port)" + portName);
        }
    }

    /**
    * 指定したポート名に対するエンドポイントのアドレスをセットします / [en]-(Set the endpoint address for the specified port name.)
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
