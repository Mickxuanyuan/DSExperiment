package com.hpu.fyx.model;

public class User {
	private Integer id;
	private String userId;
	private String username;
	private String password;
	private String telephone;
	private String email;
	private Integer userRole;
	private String majorName;
	private int signTotal;
	private int hadNotSignTotal;
	private int hadNotUpload;
	
	public Integer getId() {
		return id;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getTelephone() {
		return telephone;
	}
	
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public Integer getUserRole() {
		return userRole;
	}
	
	public void setUserRole(Integer userRole) {
		this.userRole = userRole;
	}
	
	public String getMajorName() {
		return majorName;
	}
	
	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}
	
	public int getSignTotal() {
		return signTotal;
	}

	public void setSignTotal(int signTotal) {
		this.signTotal = signTotal;
	}

	public int getHadNotSignTotal() {
		return hadNotSignTotal;
	}

	public void setHadNotSignTotal(int hadNotSignTotal) {
		this.hadNotSignTotal = hadNotSignTotal;
	}

	public int getHadNotUpload() {
		return hadNotUpload;
	}

	public void setHadNotUpload(int hadNotUpload) {
		this.hadNotUpload = hadNotUpload;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((majorName == null) ? 0 : majorName.hashCode());
		result = prime * result
				+ ((password == null) ? 0 : password.hashCode());
		result = prime * result
				+ ((telephone == null) ? 0 : telephone.hashCode());
		result = prime * result
				+ ((userRole == null) ? 0 : userRole.hashCode());
		result = prime * result
				+ ((username == null) ? 0 : username.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (majorName == null) {
			if (other.majorName != null)
				return false;
		} else if (!majorName.equals(other.majorName))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (telephone == null) {
			if (other.telephone != null)
				return false;
		} else if (!telephone.equals(other.telephone))
			return false;
		if (userRole == null) {
			if (other.userRole != null)
				return false;
		} else if (!userRole.equals(other.userRole))
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", telephone=" + telephone + ", email=" + email
				+ ", userRole=" + userRole + ", majorName=" + majorName + "]";
	}
}
