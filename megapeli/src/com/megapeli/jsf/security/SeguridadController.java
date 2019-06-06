package com.megapeli.jsf.security;

import java.io.IOException;
import java.io.Serializable;
import javax.faces.bean.*;
import javax.faces.context.FacesContext;
import com.megapeli.jpa.bean.LoginBean;
import com.megapeli.jpa.entity.Usuariop;

@ManagedBean(name = "security")
@RequestScoped
public class SeguridadController implements Serializable {

	@ManagedProperty("#{bean1}")
	private LoginBean bean1;

	public void verificarSesion() {

		FacesContext context = FacesContext.getCurrentInstance();
		Usuariop validado = bean1.getValidado();
		if (validado == null) {
			try {
				context.getExternalContext().redirect("login.xhtml");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	public void verificarLogin() {
		FacesContext context = FacesContext.getCurrentInstance();
		Usuariop validado = bean1.getValidado();
		if (validado != null) {
			try {
				context.getExternalContext().redirect("inicio.xhtml");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void menuGenero() {
		FacesContext context = FacesContext.getCurrentInstance();
		Usuariop validado = bean1.getValidado();
		if (validado.getIdTipoUsuario()==1) {
			try {
				context.getExternalContext().redirect("inicio.xhtml");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public LoginBean getBean1() {
		return bean1;
	}

	public void setBean1(LoginBean bean1) {
		this.bean1 = bean1;
	}
}
