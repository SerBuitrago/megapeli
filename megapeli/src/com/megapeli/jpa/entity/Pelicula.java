package com.megapeli.jpa.entity;


import java.util.ArrayList;
import java.util.List;
import org.primefaces.model.StreamedContent;


public class Pelicula{
	private StreamedContent foto;
	private Peliculap pelicula;
	private List<Personajep> personajes= new ArrayList<>();
	private List<Comentariop> comentarios= new ArrayList<>();
	private Directorp director;
	
	public Pelicula() {
	}
	
	public Pelicula(Peliculap p) {
		this.pelicula=p;
	}
	
	/////////////////////////////////// GETTER Y SETTERS ////////////////////////////////////
	
	public StreamedContent getFoto() {
		return foto;
	}

	public Peliculap getPelicula() {
		return pelicula;
	}

	public void setPelicula(Peliculap pelicula) {
		this.pelicula = pelicula;
	}

	public void setFoto(StreamedContent foto) {
		this.foto = foto;
	}

	public List<Personajep> getPersonajes() {
		return personajes;
	}

	public void setPersonajes(List<Personajep> personajes) {
		this.personajes = personajes;
	}

	public Directorp getDirector() {
		return director;
	}

	public void setDirector(Directorp director) {
		this.director = director;
	}

	public List<Comentariop> getComentarios() {
		return comentarios;
	}

	public void setComentarios(List<Comentariop> comentarios) {
		this.comentarios = comentarios;
	}
}
