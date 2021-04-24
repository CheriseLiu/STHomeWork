package com.dao.student;

import com.entity.student.Student;

import java.util.List;

/**
 * @Author: Liulq
 * @Description:
 * @Date: 23:20 2021/4/22
 */
/**
 * 定义操作数据库的方法
 */
public interface studentDao {
    //添加新学生
    boolean addStudent(Student student);

    //查找该学生信息
    String[][] searchStudent(String name);

    boolean deleteStudent(Student student);

    boolean updateStudent(Student student);

    String[][] list(int pageNum);
}
