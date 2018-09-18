package com.deepdraw.deepsearch.controller;

import org.python.util.PythonInterpreter;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@RestController
public class searchControllers {


    @GetMapping(value="/getSearchWjc")
    public Object  findOneUser(HttpServletRequest request,HttpServletResponse response) throws FileNotFoundException {
        String word = (String) request.getParameter("searchWords");


        PythonInterpreter interpreter = new PythonInterpreter();
        Process proc = null;
        try {
            Runtime.getRuntime().exec("cmd /c [your command]");
            Runtime.getRuntime().exec("C:\\Users\\hc\\Desktop\\hc.py");
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            proc.waitFor();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        //interpreter.execfile("C:\\Users\\hc\\Documents\\Tencent Files\\136680555\\FileRecv\\saas\\hc.py");
        //interpreter.exec("print(sorted(a));");  //此处python语句是3.x版本的语法


        //PythonInterpreter interpreter = new PythonInterpreter();

        //PyFunction func = (PyFunction) interpreter.get("input",
        //        PyFunction.class);
        //
        //PyObject pyobj = func.__call__(new PyString(word));
        //System.out.println("anwser = " + pyobj.toString());

        return null;
    }



}
