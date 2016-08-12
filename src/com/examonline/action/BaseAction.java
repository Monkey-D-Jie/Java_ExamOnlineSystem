package com.examonline.action;

import java.lang.reflect.ParameterizedType;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.examonline.util.PageInfo;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("unchecked")
public abstract class BaseAction<T> extends ActionSupport implements ModelDriven<T>{

	private static final long serialVersionUID = 1L;
	
	protected T model;
	protected HttpServletRequest requset;
	protected PageInfo pageInfo;
	public BaseAction() {
		try {
			ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
			Class<T> clazz=(Class<T>) type.getActualTypeArguments()[0];
			//---------
			/*
			 * 分页显示改动处
			 */
			this.requset=ServletActionContext.getRequest();
			//这里原来是用拦截的方式来获取到request的，但是会报错，说是找不到session等一类的错误，没有sessionFactory，也就没有可得的request的嘛
			//换成是这样后就变成了由程序自己来找到运行着的上下文中的request对象。。。。。（不晓得这样理解是否是对的）
			this.pageInfo=new PageInfo(requset);//这样就完成了用页面那边传递过来的数据出事后PageBean
			//---------分页显示改动处
			this.model=clazz.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public T getModel() {
		return model;
	}
}
