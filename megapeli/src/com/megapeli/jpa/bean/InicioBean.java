package com.megapeli.jpa.bean;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import com.megapeli.jpa.dao.PeliculaDao;
import com.megapeli.jpa.dao.SuscripcionDao;
import com.megapeli.jpa.entity.Peliculap;
import com.megapeli.jpa.entity.Suscripcion;
import com.megapeli.jpa.entity.Usuariop;

@ManagedBean
@SessionScoped
public class InicioBean {
    
	Usuariop usuario= new Usuariop();
	List<Suscripcion> suscripcion;
	List<Peliculap> peliculas;
	
	
	@PostConstruct
	public void listar() {
		SuscripcionDao daoS= new SuscripcionDao();
		suscripcion= new ArrayList<>();
		suscripcion= daoS.findByFieldList("idUsuario", usuario.getId());
		
		List<Suscripcion> tmp=suscripcion;
		
		PeliculaDao daoP= new PeliculaDao();
		peliculas= new ArrayList<>();
		List<Peliculap> tmpp=new ArrayList<>();
		
		for(int i=0; i<tmp.size()-1; i++) {
			tmpp=daoP.findByFieldList("idUsuario", tmp.get(i).getIdUsuario());
			for(int j=0; j<tmpp.size()-1; j++) {
				peliculas.add(tmpp.get(j));	
			}
			
		}
	}


	public Usuariop getUsuario() {
		return usuario;
	}


	public void setUsuario(Usuariop usuario) {
		this.usuario = usuario;
	}


	public List<Suscripcion> getSuscripcion() {
		return suscripcion;
	}


	public void setSuscripcion(List<Suscripcion> suscripcion) {
		this.suscripcion = suscripcion;
	}


	public List<Peliculap> getPeliculas() {
		return peliculas;
	}


	public void setPeliculas(List<Peliculap> peliculas) {
		this.peliculas = peliculas;
	}
	
	
}
