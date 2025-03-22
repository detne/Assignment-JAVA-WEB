package persistence;

import java.time.LocalDateTime;
import java.util.Arrays;

public class Document {
	private String id;
	private String title;
	private String fileName;
	private byte[] fileData;
	private String id_course;
	private String id_category;
	private String username;
	private String status;
	private LocalDateTime datePublished;
	private String description;

	private Document() {
	}

	public String getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}

	public String getFileName() {
		return fileName;
	}

	public byte[] getFileData() {
		return fileData;
	}

	public String getIdCourse() {
		return id_course;
	}

	public String getIdCategory() {
		return id_category;
	}

	public String getUsername() {
		return username;
	}

	public String getStatus() {
		return status;
	}

	public LocalDateTime getDatePublished() {
		return datePublished;
	}

	public String getDescription() {
		return description;
	}

	public static class Builder {
		private final Document document;

		public Builder() {
			document = new Document();
		}

		public Builder setId(String id) {
			document.id = id;
			return this;
		}

		public Builder setTitle(String title) {
			document.title = title;
			return this;
		}

		public Builder setFileName(String fileName) {
			document.fileName = fileName;
			return this;
		}

		public Builder setFileData(byte[] fileData) {
			document.fileData = fileData;
			return this;
		}

		public Builder setIdCourse(String id_course) {
			document.id_course = id_course;
			return this;
		}

		public Builder setIdCategory(String id_category) {
			document.id_category = id_category;
			return this;
		}

		public Builder setUsername(String username) {
			document.username = username;
			return this;
		}

		public Builder setStatus(String status) {
			document.status = status;
			return this;
		}

		public Builder setDatePublished(LocalDateTime datePublished) {
			document.datePublished = datePublished;
			return this;
		}

		public Builder setDescription(String description) {
			document.description = description;
			return this;
		}

		public Document build() {
			return document;
		}
	}

	@Override
	public String toString() {
		return "Document [id=" + id + ", title=" + title + ", fileName=" + fileName + ", fileData="
				+ Arrays.toString(fileData) + ", id_course=" + id_course + ", id_category=" + id_category
				+ ", username=" + username + ", status=" + status + ", datePublished=" + datePublished
				+ ", description=" + description + "]\n";
	}

}
