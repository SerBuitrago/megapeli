package com.megapeli.jpa.bean;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import org.primefaces.model.DefaultStreamedContent;
import com.megapeli.jpa.dao.GeneroDao;
import com.megapeli.jpa.dao.PeliculaDao;
import com.megapeli.jpa.dao.SuscripcionDao;
import com.megapeli.jpa.dao.ComentarioDao;
import com.megapeli.jpa.entity.Comentariop;
import com.megapeli.jpa.entity.Generop;
import com.megapeli.jpa.entity.Pelicula;
import com.megapeli.jpa.entity.Peliculap;
import com.megapeli.jpa.entity.Suscripcion;

@ManagedBean(name = "bean2")
@SessionScoped
public class PeliculaBean {
	
	@ManagedProperty("#{bean1}")
	private UsuarioBean bean1;

	private List<Pelicula> peliculagenero;
	private List<Pelicula> peliculas;
	
	
	private Pelicula selecionada;
	private List<Comentariop> comentarios;
	
	@PostConstruct
	public void intPeliculas() {
		if(peliculas==null) {
			peliculas= new ArrayList<>();
			PeliculaDao daoP = new PeliculaDao();
			SuscripcionDao daoS = new SuscripcionDao();
			List<Suscripcion> suscripcion = new ArrayList<>();
			
			suscripcion= daoS.findByFieldListInt("idUsuario", bean1.getValidado().getId());
			for(int i=0; i<suscripcion.size(); i++) {
				List<Peliculap> tmp= new ArrayList<>();
				tmp=daoP.findByFieldListInt("idUsuario", suscripcion.get(i).getIdSuscripto());
				for(int j=0; j<tmp.size(); j++)
				{
					Pelicula pelicula= new Pelicula();
					pelicula.setPelicula(tmp.get(j));
					InputStream input = new ByteArrayInputStream(tmp.get(0).getImagen());
					pelicula.setFoto(new DefaultStreamedContent(input, "image/jpg|jpn|jpe"));
					peliculas.add(pelicula);					
				}			
			}
		}
	}	
	
	public void accion() {
		recursivo("accion");
	}
	
	public void recursivo(String genero) {
		peliculagenero = new ArrayList<>();
		PeliculaDao dao = new PeliculaDao();
		Generop g = new Generop();
		GeneroDao daoG = new GeneroDao();
		g = daoG.findByField("descripcion", genero);
		System.out.print(""+genero +"\nid: "+g.getId());
		List<Peliculap> tmp=dao.findByFieldListInt("idGenero", g.getId());
		System.out.print("\nt: "+tmp.size());
		for(int i=0; i<tmp.size(); i++) {
			peliculagenero.add(new Pelicula(tmp.get(i)));
			InputStream input = new ByteArrayInputStream(tmp.get(i).getImagen());
			peliculagenero.get(i).setFoto(new DefaultStreamedContent(input, "image/jpg"));
			
		}
		System.out.print("\nt: "+peliculagenero.size());
	}
	
	public String peliculaSele(Pelicula p) {
		this.selecionada=p;
		this.comentarios= new ArrayList<>();
		ComentarioDao daoC= new ComentarioDao();
		this.comentarios= daoC.findByFieldListInt("idPelicula", p.getPelicula().getId());
		return "pelicula.xhtml";
	}
/////////////////////////////////////////////// GETTER Y SETTERS ///////////////////////////

	public List<Pelicula> getPeliculagenero() {
		return peliculagenero;
	}

	public void setPeliculagenero(List<Pelicula> peliculagenero) {
		this.peliculagenero = peliculagenero;
	}

	public List<Pelicula> getPeliculas() {
		return peliculas;
	}

	public void setPeliculas(List<Pelicula> peliculas) {
		this.peliculas = peliculas;
	}

	public UsuarioBean getBean1() {
		return bean1;
	}

	public void setBean1(UsuarioBean bean1) {
		this.bean1 = bean1;
	}

	public Pelicula getSelecionada() {
		return selecionada;
	}

	public void setSelecionada(Pelicula selecionada) {
		this.selecionada = selecionada;
	}

	public List<Comentariop> getComentarios() {
		return comentarios;
	}

	public void setComentarios(List<Comentariop> comentarios) {
		this.comentarios = comentarios;
	}
}
