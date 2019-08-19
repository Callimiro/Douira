package modele;

public class Commentaire {
	
	private long idcomment;
	
	private long idclient;
	
	private long idbien;
	
	private String contenu;
	
	private String datepub;
	
	private String etat;
	
	private String rasionsignal;
	
	private String nomclient;

	public long getIdcomment() {
		return idcomment;
	}

	public void setIdcomment(long idcomment) {
		this.idcomment = idcomment;
	}

	public long getIdclient() {
		return idclient;
	}

	public void setIdclient(long idclient) {
		this.idclient = idclient;
	}

	public long getIdbien() {
		return idbien;
	}

	public void setIdbien(long idbien) {
		this.idbien = idbien;
	}

	public String getContenu() {
		return contenu;
	}

	public void setContenu(String contenu) {
		this.contenu = contenu;
	}

	public String getDatepub() {
		return datepub;
	}

	public void setDatepub(String datepub) {
		this.datepub = datepub;
	}

	public String getEtat() {
		return etat;
	}

	public void setEtat(String etat) {
		this.etat = etat;
	}

	public String getRasionsignal() {
		return rasionsignal;
	}

	public void setRasionsignal(String rasionsignal) {
		this.rasionsignal = rasionsignal;
	}

	public String getNomclient() {
		return nomclient;
	}

	public void setNomclient(String nomclient) {
		this.nomclient = nomclient;
	}

}
