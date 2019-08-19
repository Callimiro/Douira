package modele;

import java.io.InputStream;

public class Image {
	
	private long idimage;
	
	private long idbien;
	
	private InputStream img;

	public long getIdimage() {
		return idimage;
	}

	public void setIdimage(long idimage) {
		this.idimage = idimage;
	}

	public long getIdbien() {
		return idbien;
	}

	public void setIdbien(long idbien) {
		this.idbien = idbien;
	}

	public InputStream getImg() {
		return img;
	}

	public void setImg(InputStream img) {
		this.img = img;
	}
	
	

}
