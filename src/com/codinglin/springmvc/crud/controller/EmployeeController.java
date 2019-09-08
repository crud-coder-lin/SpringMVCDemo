package com.codinglin.springmvc.crud.controller;


import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codinglin.springmvc.crud.beans.Department;
import com.codinglin.springmvc.crud.beans.Employee;
import com.codinglin.springmvc.crud.dao.DepartmentDao;
import com.codinglin.springmvc.crud.dao.EmployeeDao;

@Controller
public class EmployeeController {
	@Autowired
	private EmployeeDao employeeDao;
	@Autowired
	private DepartmentDao departmentDao;
	
	/* Map
	 * Model model  
	 * ModelMap
	 */
	@RequestMapping("/emps")
	public String listAllEmps(Model model) {
		
		//获取所有的员工
		Collection<Employee> emps = employeeDao.getAll();
		//将获取的所有的员工传递给list页面
		model.addAttribute("emps",emps);
		return "list";
		
	}
	/**
	 * 跳转到新增页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/emp",method=RequestMethod.GET)
	public String toAddPage(Model model) {
		
		//获取所有的员工
	    Collection<Department> depts = departmentDao.getDepartments();
		//将获取的所有的员工传递给list页面
		model.addAttribute("depts",depts);
		//因为使用Spring的form标签处理radio，所以需要将性别统一封装到一个Map集合中
		Map<String,String> genders = new HashMap<String,String>();
		genders.put("1", "男");
		genders.put("0", "女");
		model.addAttribute("genders", genders);
		
		
		Employee emp = new Employee();
		model.addAttribute("emp", emp);
		return "input";
		
	}
	/**
	 * 完成新增操作
	 * @param model
	 * @return
	 */
	@RequestMapping(value="emp" ,method=RequestMethod.POST)
	public String addEmp(Employee emp) {
		//保存员工
		employeeDao.save(emp);
		//重定向到list页面
		return "redirect:/emps";
		
		
	}
	
	/*
	 * 
	 * 跳转到修改的页面
	 */
	@RequestMapping(value="/emp/{id}")
	public String toEditPage(@PathVariable("id") Integer id,Model model) {
		//获取所有的员工
	    Collection<Department> depts = departmentDao.getDepartments();
		//将获取的所有的员工传递给list页面
		model.addAttribute("depts",depts);
		Map<String,String> genders = new HashMap<String, String>();
		genders.put("1", "男");
		genders.put("0", "女");
		model.addAttribute("genders", genders);
		
		Employee emp = employeeDao.get(id);
		model.addAttribute("emp",emp);
		return "input";
		
	}
	/*
	 * 修改员工页面
	 */
	@RequestMapping(value="/emp",method=RequestMethod.PUT)
	public String editEmp(Employee emp) {
		employeeDao.save(emp);
		return "redirect:/emps";
			
	}
	/**
	 * 	删除员工
	 */
	@RequestMapping(value = "/emp/{id}",method = RequestMethod.DELETE)
	public String delEmp(@PathVariable("id")Integer id) {
		employeeDao.delete(id);
		return "redirect:/emps";
	}
	

}
