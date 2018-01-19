package org.sup2is.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.util.ObjectUtils;
import org.springframework.validation.FieldError;

import lombok.Data;
import lombok.EqualsAndHashCode;


@Data
@EqualsAndHashCode(callSuper = false)
public class JsonObject extends HashMap<String, Object>{
	
	@Autowired 
	private MessageSource message;
	 
	private static String KEY_RESULT = "result";
	private static String KEY_FILEDERROR = "fieldError";
	private static String KEY_REASON = "reason";
	//private static String KEY_GLOBALERROR = "globalError";
	private static String KEY_PARAM = "param";

	public JsonObject() {
		this(Result.success);
	}
	
	public JsonObject(Result result) {
		this(result , null);
	} 
	 
	public JsonObject(Exception e) {
		this(Result.failed , e.getCause() != null ? e.getCause().getMessage() : e.getMessage());
	}
	
	public JsonObject(String reason) {
		this(Result.failed, reason);
	}

/*	public JsonObject(BindingResult bindingResult) {
		this(bindingResult.hasErrors() ? Result.failed : Result.success , null, bindingResult);
	}*/

	public JsonObject(List<String> fieldErrors) {
		this(ObjectUtils.isEmpty(fieldErrors) ? Result.success : Result.failed , null , fieldErrors);
	}
	
	public JsonObject(Result result, String reason) {
		this(result, reason , null);
	}
	
	/*public JsonObject(Result result, String reason, BindingResult bindingResult) {
		setResult(result);
		setFieldErrors(new ArrayList<>());
		setReason(reason);
		
		if(bindingResult != null) {
			setBindingResult(bindingResult);
		}
		
	}*/

	public JsonObject(Result result, String reason, List<String> fieldErrors) {
		setResult(result);
		setReason(reason);
		setFieldErrors(new ArrayList<>());
		
		if(!ObjectUtils.isEmpty(fieldErrors)) {
			setFieldErrors(fieldErrors);
		}
	} 

	private void setParam(Object param) {
		put(KEY_PARAM, param);
	}

	public static JsonObject create() {
		return new JsonObject();
	}
	
	public static JsonObject create(Exception e) {
		return new JsonObject(e);
	}
/*	public static JsonObject create(BindingResult bindingResult) {
		return new JsonObject(bindingResult);
	}*/
	
	public static JsonObject create(Object param) {
		JsonObject result = new JsonObject();
		result.setParam(param);
		return result;
	}
	public static JsonObject create(String reason) {
		return new JsonObject(reason);
	}
	
	
	public static JsonObject create(List<String> fieldErrors) {
		return new JsonObject(fieldErrors);
	}
	
	private void setResult(Result result) {
		put(KEY_RESULT, result);
	}
	
/*	private void setBindingResult(BindingResult bindingResult) {
		
		List<FieldError> fieldErrors = getFieldErrors();
		
		if(fieldErrors == null) {
			fieldErrors = new ArrayList<>();
		}
		
		for(FieldError fieldError : bindingResult.getFieldErrors()) {
			System.out.println(message);
			fieldErrors.add(new FieldError(fieldError.getObjectName(), fieldError.getField(), fieldError.getDefaultMessage()));
		}
		setFieldErrors(fieldErrors);
	}

*/
	
	
	private void setReason(String reason) {
		put(KEY_REASON, reason);
	}

/*	private void setFieldErrors(List<FieldError> fieldErrors) {
		put(KEY_FILEDERROR, fieldErrors);
	}*/
	private void setFieldErrors(List<String> fieldErrors) {
		put(KEY_FILEDERROR, fieldErrors);
	}

	private List<FieldError> getFieldErrors() {
		return (List<FieldError>) get(KEY_FILEDERROR);
	}
	
	
	public enum Result {
		success,failed
	}
	
	
}

