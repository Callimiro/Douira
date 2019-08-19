package modele;

import java.io.Serializable;

public class Utilisateur implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private long idusr;
	
	private String email;
	
	private String password;
	
	private String nom;
	
	private String prenom;
	
	private String sexe;
	
	private String daten;
	
	private String ntel;

	public long getIdusr() {
		return idusr;
	}

	public void setIdusr(final long idusr) {
		this.idusr = idusr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getSexe() {
		return sexe;
	}

	public void setSexe(String sexe) {
		this.sexe = sexe;
	}

	public String getDaten() {
		return daten;
	}

	public void setDaten(String daten) {
		this.daten = daten;
	}

	public String getNtel() {
		return ntel;
	}

	public void setNtel(String ntel) {
		this.ntel = ntel;
	}
	
	

}
