package com.megapeli.jpa.bean;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import org.primefaces.model.DefaultStreamedContent;
import com.megapeli.jpa.dao.PeliculaDao;
import com.megapeli.jpa.dao.PersonajeDao;
import com.megapeli.jpa.dao.SuscripcionDao;
import com.megapeli.jpa.dao.ActorDao;
import com.megapeli.jpa.dao.DirectorDao;
//import com.megapeli.jpa.dao.ComentarioDao;
import com.megapeli.jpa.dao.GeneroDao;
//import com.megapeli.jpa.entity.Comentariop;
import com.megapeli.jpa.entity.Generop;
import com.megapeli.jpa.entity.Pelicula;
import com.megapeli.jpa.entity.Peliculap;
import com.megapeli.jpa.entity.Personaje;
import com.megapeli.jpa.entity.Personajep;
import com.megapeli.jpa.entity.Suscripcion;

@ManagedBean(name = "bean2")
@SessionScoped
public class PeliculaBean {

	@ManagedProperty("#{bean1}")
	private UsuarioBean bean1;

	private List<Pelicula> peliculas;

	private Pelicula selecionada;

	private List<Pelicula> peliculagenero;

	@PostConstruct
	public void intPeliculas() {
		if (peliculas == null) {
			peliculas = new ArrayList<>();
			PeliculaDao daoP = new PeliculaDao();
			SuscripcionDao daoS = new SuscripcionDao();
			List<Suscripcion> suscripcion = new ArrayList<>();

			suscripcion = daoS.findByFieldListInt("idUsuario", bean1.getValidado().getId());
			for (int i = 0; i < suscripcion.size(); i++) {
				List<Peliculap> tmp = new ArrayList<>();
				tmp = daoP.findByFieldListInt("idUsuario", suscripcion.get(i).getIdSuscripto());
				for (int j = 0; j < tmp.size(); j++) {
					Pelicula pelicula = new Pelicula();
					pelicula.setPelicula(tmp.get(j));
					InputStream input = new ByteArrayInputStream(pelicula.getPelicula().getImagen());
					pelicula.setFoto(new DefaultStreamedContent(input, "image/jpg|jpn|jpe"));
					peliculas.add(pelicula);
				}
			}
		}
	}

	public String peliculaSelec(Pelicula p) {
		this.selecionada = p;
		//ComentarioDao daoC = new ComentarioDao();
		ActorDao daoA = new ActorDao();
		PersonajeDao daoPe = new PersonajeDao();
		DirectorDao daoD= new DirectorDao();
		selecionada.setDirector(daoD.findByFieldInt("id", p.getPelicula().getIdDirector()));
		// selecionada.setComentarios(daoC.findByFieldListInt("idPelicula",
		// p.getPelicula().getId()));

		List<Personaje> personajes = daoPe.findByFieldListInt("idPelicula", p.getPelicula().getId());
		for (Personaje pe : personajes) {
			Personajep per = new Personajep();
			per.setActor(daoA.find(pe.getIdActor()));
			per.setPersonaje(pe);
			selecionada.getPersonajes().add(per);
		}
		return "pelicula.xhtml";
	}

	/******************* PELICULA POR GENERO *********************************/
	public void accion() {
		FacesContext context = FacesContext.getCurrentInstance();
		recursivo("accion");
		try {
			context.getExternalContext().redirect("selecionada.xhtml");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void animacion() {
		FacesContext context = FacesContext.getCurrentInstance();
		recursivo("animacion");
		try {
			context.getExternalContext().redirect("selecionada.xhtml");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void aventura() {
		FacesContext context = FacesContext.getCurrentInstance();
		recursivo("aventura");
		try {
			context.getExternalContext().redirect("selecionada.xhtml");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void cienciaFiccion() {
		FacesContext context = FacesContext.getCurrentInstance();
		recursivo("ciencia ficcion");
		try {
			context.getExternalContext().redirect("selecionada.xhtml");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void comedia() {
		FacesContext context = FacesContext.getCurrentInstance();
		recursivo("comedia");
		try {
			context.getExternalContext().redirect("selecionada.xhtml");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void crimen() {
		FacesContext context = FacesContext.getCurrentInstance();
		recursivo("crimen");
		try {
			context.getExternalContext().redirect("selecionada.xhtml");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void drama() {
		FacesContext context = FacesContext.getCurrentInstance();
		recursivo("drama");
		try {
			context.getExternalContext().redirect("selecionada.xhtml");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void fantasia() {
		FacesContext context = FacesContext.getCurrentInstance();
		recursivo("fantasia");
		try {
			context.getExternalContext().redirect("selecionada.xhtml");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void misterio() {
		FacesContext context = FacesContext.getCurrentInstance();
		recursivo("misterio");
		try {
			context.getExternalContext().redirect("selecionada.xhtml");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void romantica() {
		FacesContext context = FacesContext.getCurrentInstance();
		recursivo("romantica");
		try {
			context.getExternalContext().redirect("selecionada.xhtml");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void suspenso() {
		FacesContext context = FacesContext.getCurrentInstance();
		recursivo("suspenso");
		try {
			context.getExternalContext().redirect("selecionada.xhtml");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void terror() {
		FacesContext context = FacesContext.getCurrentInstance();
		recursivo("terror");
		try {
			context.getExternalContext().redirect("selecionada.xhtml");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void recursivo(String genero) {
		List<Pelicula> tmp = this.peliculas;
		peliculagenero = new ArrayList<>();
		Generop g = new Generop();
		GeneroDao daoG = new GeneroDao();
		g = daoG.findByField("descripcion", genero);
		System.out.print("" + genero + "\nid: " + g.getId());
		for (Pelicula p : tmp) {
			if (p.getPelicula().getIdGenero() == g.getId()) {
				Pelicula pelicula = new Pelicula();
				pelicula.setPelicula(p.getPelicula());
				InputStream input = new ByteArrayInputStream(pelicula.getPelicula().getImagen());
				pelicula.setFoto(new DefaultStreamedContent(input, "image/jpg"));
				peliculagenero.add(pelicula);
			}
		}
	}
/////////////////////////////////////////////// GETTER Y SETTERS ///////////////////////////

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

	public List<Pelicula> getPeliculagenero() {
		return peliculagenero;
	}

	public void setPeliculagenero(List<Pelicula> peliculagenero) {
		this.peliculagenero = peliculagenero;
	}
}
