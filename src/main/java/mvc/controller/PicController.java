package mvc.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PicController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    static final int LISTCOUNT = 5;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String RequestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = RequestURI.substring(contextPath.length());

        response.setContentType("text/html; charset=utf-8");
        request.setCharacterEncoding("utf-8");

        if (command.equals("/Test.do")) {
            requestTest(request);
        } else if (command.equals("/CreatePicPage.do")) {
            RequestDispatcher rd = request.getRequestDispatcher("./Main/createPic.jsp");
            rd.forward(request, response);
        } else if (command.equals("/ShowLog.do")) {
            requestLog(request);
            RequestDispatcher rd = request.getRequestDispatcher("./Main/showLog.jsp");
            rd.forward(request, response);
        } else if (command.equals("/CreatePic.do")) {
            requestCreatePic(request);
        }
    }

    public void requestTest(HttpServletRequest request) {
    	String scriptPath = "C:\\Users\\dongok\\eclipse-workspace_webServer\\Dalle3\\Test.py";
        ProcessBuilder pb = new ProcessBuilder("python.exe", scriptPath, request.getParameter("text"));
        Process p = null;
        BufferedReader br = null;
        try {
            p = pb.start();
            br = new BufferedReader(new InputStreamReader(p.getInputStream(), "euc-kr"));
            String line;
            while ((line = br.readLine()) != null) {
                // Do something with the line if necessary
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (p != null) {
                p.destroy();
            }
        }
    }

    public void requestCreatePic(HttpServletRequest request) {
        ProcessBuilder pb = new ProcessBuilder("python.exe", "genImage.py", request.getParameter("text"));
        Process p = null;
        BufferedReader br = null;
        try {
            p = pb.start();
            br = new BufferedReader(new InputStreamReader(p.getInputStream(), "euc-kr"));
            String line;
            while ((line = br.readLine()) != null) {
                // Do something with the line if necessary
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (p != null) {
                p.destroy();
            }
        }
    }

    public void requestLog(HttpServletRequest request) {
        // Implement your logic here
    }

    public PicController() {
        // Default constructor
    }
}
