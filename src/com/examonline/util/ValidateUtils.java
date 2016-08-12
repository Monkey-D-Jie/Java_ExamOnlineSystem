package com.examonline.util;

import java.util.Collection;

public class ValidateUtils {

	/**
	 * 判断集合是否有效
	 * @return
	 */
	public static boolean isValidate(Collection<?> cll){
		if(cll==null||cll.isEmpty()){
			return false;
		}
		return true;
	}
	
}
