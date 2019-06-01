package com.megapeli.jpa.util;

import java.util.ArrayList;
import java.util.List;

import com.megapeli.jpa.dao.PeliculaDao;
import com.megapeli.jpa.entity.Peliculap;

public class Maina {

	public static void main(String[] args) {

		List<Peliculap> peliculas;
		PeliculaDao daoP = new PeliculaDao();
		peliculas = new ArrayList<>();
		peliculas = daoP.findByFieldList("nombre", "Feliz dia de tu muerte 2");
		System.out.println(peliculas.get(0).getIdioma());
	}

}
