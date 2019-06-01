package com.megapeli.jpa.bean;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;

import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;

import com.megapeli.jpa.dao.PeliculaDao;
import com.megapeli.jpa.dao.SuscripcionDao;
import com.megapeli.jpa.entity.Peliculap;
import com.megapeli.jpa.entity.Suscripcion;
import com.megapeli.jpa.entity.Usuariop;

@ManagedBean(name = "bean2")
@SessionScoped
public class InicioBean {

	@ManagedProperty("#{bean1}")
	private UsuarioBean bean1;

	private List<Suscripcion> suscripcion;
	private List<StreamedContent> imagen;
	private List<Peliculap> peliculas;

	@PostConstruct
	public void imagen() {
		PeliculaDao daoP = new PeliculaDao();
		SuscripcionDao daoS = new SuscripcionDao();
		
		peliculas = new ArrayList<>();
		suscripcion= daoS.findByFieldList("idUsuario", bean1.getValidar().getId());
		for(int i=0; i<suscripcion.size(); i++) {
			List<Peliculap> p= new ArrayList<>();
			p=daoP.findByFieldList("idUsuario", suscripcion.get(0).getIdSuscripto());
			for(int j=0; j<p.size(); j++) {
				peliculas.add(daoP.find(p.get(j).getId()));
				InputStream input = new ByteArrayInputStream(p.get(j).getImagen());
				imagen.add(new DefaultStreamedContent(input, "image/jpg"));
			}
		}
		
		/*peliculas = daoP.find(1);
		InputStream i = new ByteArrayInputStream(peliculas.getImagen());
		System.out.println(peliculas.getImagen().length + "" + peliculas.getIdioma());
		imagen = new DefaultStreamedContent(i, "image/jpg");
		System.out.println(imagen.toString());*/
	}

	public UsuarioBean getBean1() {
		return bean1;
	}

	public void setBean1(UsuarioBean u) {
		this.bean1 = u;
	}

	public List<Suscripcion> getSuscripcion() {
		return suscripcion;
	}

	public void setSuscripcion(List<Suscripcion> suscripcion) {
		this.suscripcion = suscripcion;
	}

	public List<StreamedContent> getImagen() {
		return imagen;
	}

	public void setImagen(List<StreamedContent> imagen) {
		this.imagen = imagen;
	}

	public List<Peliculap> getPeliculas() {
		return peliculas;
	}

	public void setPeliculas(List<Peliculap> peliculas) {
		this.peliculas = peliculas;
	}	
}
