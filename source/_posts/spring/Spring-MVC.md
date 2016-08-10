---
title: Spring MVC
date: 2016-05-11
categories: Spring
tags:
- Java
- Spring
---

# 文档
- [Reference 3.2.x](http://docs.spring.io/autorepo/docs/spring/3.2.x/spring-framework-reference/html/mvc.html)

# 问题
- [conflicts with existing, non-compatible bean definition of same name and class](http://www.cnblogs.com/a2211009/p/4534215.html)
- [HttpServletRequest to MultipartFile](https://www.google.com/search?safe=active&q=HttpServletRequest+to+MultipartFile&oq=HttpServletRequest+to+MultipartFile&gs_l=serp.3...370443.370443.0.370713.1.1.0.0.0.0.119.119.0j1.1.0....0...1c.1.64.serp..0.0.0.0AVyZyRs2iE)：一定要配置 org.springframework.web.multipart.commons.CommonsMultipartResolver 否则 HttpRequest 不能转换
