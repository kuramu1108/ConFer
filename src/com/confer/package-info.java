@XmlSchema( 
    xmlns = {
    		@XmlNs(prefix = "users", namespaceURI = "http://www.confer.com/users"),
    		@XmlNs(prefix = "polls", namespaceURI = "http://www.confer.com/polls")
    },
    elementFormDefault = XmlNsForm.QUALIFIED) 
package com.confer;
 
import javax.xml.bind.annotation.*;