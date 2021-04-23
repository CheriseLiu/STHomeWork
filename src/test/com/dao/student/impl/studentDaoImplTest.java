package com.dao.student.impl;

import com.entity.student.Student;
import org.junit.Test;

public class studentDaoImplTest {

    com.dao.student.studentDao studentDao = new studentDaoImpl();
    com.dao.student.impl.studentDaoImpl studentDaoImpl = new studentDaoImpl();

    @Test
    public void testAddStudent() {
        Student student = new Student();
        student.setID(1);
        student.setName("xiaohua");
        student.setBirDate("2000.1.1");
        student.setGender("male");
        boolean flag = studentDaoImpl.addStudent(student);
        if (flag){
            System.out.println("添加成功！");
        }else {
            System.out.println("添加失败！");
        }
    }

    @Test
    public void testSearchStuent(){
        Student student = new Student();
        student.setID(1);
        student.setName("xiaohua");
        boolean flag = studentDaoImpl.searchStudent(student);
        if (flag){
            System.out.println(student.getID()+"------"+student.getName());
        }
    }
}