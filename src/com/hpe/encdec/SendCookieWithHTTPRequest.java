package com.hpe.encdec;

import java.net.URL;

import java.net.URLConnection;

public class SendCookieWithHTTPRequest {

    public static void main(String[] args) throws Exception {

        URL url = new URL("http://localhost:8080/");

        URLConnection conn = url.openConnection();

        // Set the cookie value to send

        conn.setRequestProperty("userCookie", "name=zjKjKARQMDn9tfI4jlHgKA==");

 

        // Send the request to the server

        conn.connect();

    }

}
