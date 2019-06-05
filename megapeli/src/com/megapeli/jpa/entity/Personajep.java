package com.megapeli.jpa.entity;

public class Personajep {
	private Personaje personaje;
	private Actorp nombre;

	public Personaje getPersonaje() {
		return personaje;
	}

	public void setPersonaje(Personaje personaje) {
		this.personaje = personaje;
	}

	public Actorp getActor() {
		return nombre;
	}

	public void setActor(Actorp actor) {
		this.nombre = actor;
	}
}
