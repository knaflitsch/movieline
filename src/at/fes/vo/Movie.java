package at.fes.vo;

import java.sql.Date;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Movie {
	private String title;
	private Date date;
	private int likes;
	private String plott;
	private Date premiere;
	private String scenario;
	private int duration;
	private int country;
	private int regie;
	private int ageRating;
	private int camera;
	private int music;
	private int scanrioActor;
	private int company;
	private int producer;

	public Movie() {

	}

	public Movie(String title, Date date, int likes, String plott,
			Date premiere, String scenario, int duration, int country,
			int regie, int ageRating, int camera, int music, int scanrioActor,
			int company, int producer) {
		super();
		this.title = title;
		this.date = date;
		this.likes = likes;
		this.plott = plott;
		this.premiere = premiere;
		this.scenario = scenario;
		this.duration = duration;
		this.country = country;
		this.regie = regie;
		this.ageRating = ageRating;
		this.camera = camera;
		this.music = music;
		this.scanrioActor = scanrioActor;
		this.company = company;
		this.producer = producer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public String getPlott() {
		return plott;
	}

	public void setPlott(String plott) {
		this.plott = plott;
	}

	public Date getPremiere() {
		return premiere;
	}

	public void setPremiere(Date premiere) {
		this.premiere = premiere;
	}

	public String getScenario() {
		return scenario;
	}

	public void setScenario(String scenario) {
		this.scenario = scenario;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public int getCountry() {
		return country;
	}

	public void setCountry(int country) {
		this.country = country;
	}

	public int getRegie() {
		return regie;
	}

	public void setRegie(int regie) {
		this.regie = regie;
	}

	public int getAgeRating() {
		return ageRating;
	}

	public void setAgeRating(int ageRating) {
		this.ageRating = ageRating;
	}

	public int getCamera() {
		return camera;
	}

	public void setCamera(int camera) {
		this.camera = camera;
	}

	public int getMusic() {
		return music;
	}

	public void setMusic(int music) {
		this.music = music;
	}

	public int getScanrioActor() {
		return scanrioActor;
	}

	public void setScanrioActor(int scanrioActor) {
		this.scanrioActor = scanrioActor;
	}

	public int getCompany() {
		return company;
	}

	public void setCompany(int company) {
		this.company = company;
	}

	public int getProducer() {
		return producer;
	}

	public void setProducer(int producer) {
		this.producer = producer;
	}

}
