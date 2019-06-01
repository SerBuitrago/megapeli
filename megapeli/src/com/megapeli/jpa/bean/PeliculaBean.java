package com.megapeli.jpa.bean;

import java.util.ArrayList;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import com.megapeli.jpa.dao.PeliculaDao;
import com.megapeli.jpa.entity.Peliculap;

@ManagedBean(name = "bean3")
@SessionScoped
public class PeliculaBean {
    private List<Peliculap> peliculagenero;
    
    
    public String accion() {
    	peliculagenero= new ArrayList<>();
    	PeliculaDao dao = new PeliculaDao();
    	peliculagenero=dao.findByFieldList("genero", "accion");	
    	return "genero";
    }


	public List<Peliculap> getPeliculagenero() {
		return peliculagenero;
	}

	public void setPeliculagenero(List<Peliculap> peliculagenero) {
		this.peliculagenero = peliculagenero;
	}
}
