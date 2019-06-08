package com.megapeli.jpa.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.SessionScoped;
import com.megapeli.jpa.dao.PeliculaDao;
import com.megapeli.jpa.dao.SuscripcionDao;
import com.megapeli.jpa.entity.Suscripcion;

@ManagedBean(name = "bean4")
@SessionScoped
public class AdministradorBean implements Serializable{

	@ManagedProperty("#{bean1}")
	private LoginBean bean1;

	public int seguidores(int id) {
		SuscripcionDao dao = new SuscripcionDao();
		return (dao.findByFieldListInt("idSuscripto", id).size());
	}

	public int peliculasPublicadas(int id) {
		PeliculaDao daoP = new PeliculaDao();
		return daoP.findByFieldListInt("idUsuario", id).size();
	}

	public boolean esSuscriptor(int id) {
		SuscripcionDao dao = new SuscripcionDao();
		Boolean esSuscriptor=false;
		List<Suscripcion> s = new ArrayList<>();
		s = dao.findByFieldListInt("idUsuario", bean1.getValidado().getId());
		for (Suscripcion tmp : s) {
			if (tmp.getIdSuscripto() == id) {
				esSuscriptor=true;
			}
		}
		return esSuscriptor;
	}

	//////////////////////////////////////// GETTER Y SETTERS
	//////////////////////////////////////// //////////////////////////////
	public LoginBean getBean1() {
		return bean1;
	}

	public void setBean1(LoginBean bean1) {
		this.bean1 = bean1;
	}
}
