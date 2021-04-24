package com.dao.user;

import com.entity.user.User;

/**
 * @Author: Liulq
 * @Description:
 * @Date: 11:20 2021/4/23
 */
public interface userDao {
    //添加新用户
    boolean register(User user);
    //查找用户验证该用户存在否
    boolean searchUser(User user);
}
