package com.megapeli.jpa.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import org.primefaces.PrimeFaces;
import com.megapeli.jpa.dao.PeliculaDao;
import com.megapeli.jpa.dao.SuscripcionDao;
import com.megapeli.jpa.dao.UsuarioDAO;
import com.megapeli.jpa.entity.Suscripcion;
import com.megapeli.jpa.entity.Usuariop;

@ManagedBean(name = "bean3")
@SessionScoped
public class UsuarioBean implements Serializable{

	@ManagedProperty("#{bean1}")
	private LoginBean bean1;
	
	@ManagedProperty("#{bean2}")
	private PeliculaBean bean2;

	private Usuariop actualizar;

	public List<Suscripcion>  initSuscriptores() {		
		if (bean1.getValidado() != null) {
			if (bean1.getValidado().getIdTipoUsuario() == 1) {
				List<Suscripcion> suscriptores= new ArrayList<>();
				SuscripcionDao daoS = new SuscripcionDao();
				suscriptores = daoS.findByFieldListInt("idUsuario", bean1.getValidado().getId());
				return suscriptores;
			}
		}
		return null;
	}
	
	public List<Usuariop> listaAdministradores(){
		List<Usuariop> usuario= new ArrayList<>();
		UsuarioDAO dao= new UsuarioDAO();
		usuario=dao.findByFieldListInt("idTipoUsuario", 2);
		return usuario;
	}
	
	public Usuariop conocerUsuario(int i) {
		UsuarioDAO dao= new UsuarioDAO();
		Usuariop u= new Usuariop();
		u=dao.find(i);
		return u;
	}
	
	public int peliculasPublicadas(int id) {
		PeliculaDao daoP= new PeliculaDao();
		return daoP.findByFieldListInt("idUsuario", id).size();
	}

	public void dejarSeguir(Suscripcion s) {
		SuscripcionDao daoS = new SuscripcionDao();
		daoS.delete(s);
		bean2.setPeliculas(null);
	}

	public void seguir(Suscripcion s) {
		SuscripcionDao daoS = new SuscripcionDao();
		daoS.insert(s);
	}

	public void actualizarUsuario() {
		FacesMessage message = null;
		if (actualizar != null) {
			UsuarioDAO daoU = new UsuarioDAO();
			daoU.update(actualizar);
			message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Success", "Actualizado Correctamente");
		} else {
			message = new FacesMessage(FacesMessage.SEVERITY_WARN, "", "Error al Actualizar Usuario");
		}
		FacesContext.getCurrentInstance().addMessage(null, message);
		PrimeFaces.current().ajax().addCallbackParam("loggeddIn", (actualizar != null) ? true : false);
	}

	public void eliminarCuenta() {
		UsuarioDAO daoU = new UsuarioDAO();
		daoU.delete(bean1.getValidado());
	}

////////////////////////////////////GETTER Y SETTERS //////////////////////////////////// /////////////////////////////////////////

	public LoginBean getBean1() {
		return bean1;
	}

	public void setBean1(LoginBean bean1) {
		this.bean1 = bean1;
	}

	public Usuariop getActualizar() {
		return actualizar;
	}

	public void setActualizar(Usuariop actualizar) {
		this.actualizar = actualizar;
	}

	public PeliculaBean getBean2() {
		return bean2;
	}

	public void setBean2(PeliculaBean bean2) {
		this.bean2 = bean2;
	}	
}
