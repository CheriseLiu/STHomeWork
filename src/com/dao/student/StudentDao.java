package com.dao.student;

import com.entity.student.Student;

/**
 * @Author: Liulq
 * @Description:
 * @Date: 23:20 2021/4/22
 */
/**
 * 定义操作数据库的方法
 */
public interface StudentDao {
    //添加新用户
    boolean addStudent(Student student);

    //查找该用户验证存在否
    boolean searchStudent(Student student);
}
