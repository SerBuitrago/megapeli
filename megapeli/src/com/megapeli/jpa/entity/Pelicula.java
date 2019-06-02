package com.megapeli.jpa.entity;


import org.primefaces.model.StreamedContent;


public class Pelicula{
	StreamedContent foto;
	private Peliculap pelicula;
	
	
	
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
}
