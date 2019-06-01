package com.megapeli.jpa.bean;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.faces.model.SelectItemGroup;

import org.primefaces.PrimeFaces;

import com.megapeli.jpa.dao.TipoUsuarioDao;
import com.megapeli.jpa.dao.UsuarioDAO;
import com.megapeli.jpa.entity.Tipousuario;
import com.megapeli.jpa.entity.Usuariop;

@ManagedBean(name = "bean1")
@SessionScoped
public class UsuarioBean {

	private Usuariop usuario = new Usuariop();
	private Usuariop validar = null;

	private String id, fecha;
	private List<SelectItem> tipousuarios;

	@PostConstruct
	public void tipoUsuario() {
		if (tipousuarios == null) {
			SelectItemGroup s = new SelectItemGroup("Tipo Usuario");
			TipoUsuarioDao daoT = new TipoUsuarioDao();
			List<Tipousuario> tipoUsuario = daoT.list();

			s.setSelectItems(new SelectItem[] {
					new SelectItem("" + tipoUsuario.get(0).getId(), "" + tipoUsuario.get(0).getDescripcion()),
					new SelectItem("" + tipoUsuario.get(1).getId(), "" + tipoUsuario.get(1).getDescripcion()) });

			tipousuarios = new ArrayList<SelectItem>();
			tipousuarios.add(s);
		}
	}

	public String logearse() {
		UsuarioDAO daoU = new UsuarioDAO();
		this.validar = null;
		Usuariop us = daoU.findByField("email", usuario.getEmail());
		if (us != null) {
			if (usuario.getPassword().contentEquals(us.getPassword())) {
				this.validar = us;
				return "inicio";
			}
		}
		return "login";
	}

	public String registrarse() {
		FacesMessage message = null;
		UsuarioDAO daoU = new UsuarioDAO();
		Usuariop us = daoU.findByField("email", usuario.getEmail());
		if (us == null) {
			usuario.setFechaNacimiento(java.sql.Date.valueOf(fecha));
			Calendar c = Calendar.getInstance();
			String dia = Integer.toString(c.get(Calendar.DATE));
			String mes = Integer.toString(c.get(Calendar.MONTH) + 1);
			String annio = Integer.toString(c.get(Calendar.YEAR));
			int tmp = Integer.parseInt(mes);
			mes = (tmp < 10) ? "0" + tmp : "" + tmp;
			String fechaactual = annio + "-" + mes + "-" + dia;
			usuario.setFechaRegistro(java.sql.Date.valueOf(fechaactual));
			daoU.insert(usuario);
			message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Success",
					"Te registrarse correctamente ahora inicia sesion");
		} else {
			message = new FacesMessage(FacesMessage.SEVERITY_WARN, "", "Email ya en USO");
		}
		FacesContext.getCurrentInstance().addMessage(null, message);
		PrimeFaces.current().ajax().addCallbackParam("loggeddIn", (us != null) ? true : false);
		return "login";
	}

	public void forgotPassword() {
		FacesMessage message = null;
		UsuarioDAO daoU = new UsuarioDAO();
		Usuariop us = daoU.findByField("email", usuario.getEmail());
		if (us != null) {
			if (usuario.getPassword().length() >= 10) {
				us.setPassword(usuario.getPassword());
				daoU.update(us);
				message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Success",
						"Cambiaste Correctamente la contraseña");
			} else {
				message = new FacesMessage(FacesMessage.SEVERITY_WARN, "", "Contraseña muy corta");
			}
		} else {
			message = new FacesMessage(FacesMessage.SEVERITY_WARN, "", "Email No Existe!");
		}
		FacesContext.getCurrentInstance().addMessage(null, message);
		PrimeFaces.current().ajax().addCallbackParam("loggedIn", (us != null) ? true : false);
	}

	public Usuariop getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuariop usuario) {
		this.usuario = usuario;
	}

	public Usuariop getValidar() {
		return validar;
	}

	public void setValidar(Usuariop validar) {
		this.validar = validar;
	}

	public List<SelectItem> getTiposUsuarios() {
		return tipousuarios;
	}

	public void setUsuarios(List<SelectItem> tipousuarios) {
		this.tipousuarios = tipousuarios;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

}
