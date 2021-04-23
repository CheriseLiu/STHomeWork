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

    //查找该学生验证存在否
    boolean searchStudent(Student student);

    boolean deleteStudent(int ID);

    boolean updateStudent(Student student);
}
