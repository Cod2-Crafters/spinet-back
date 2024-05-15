package com.codecrafter.typhoon.domain.request.member;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import lombok.*;

@Getter
@NoArgsConstructor
@Setter
public class EmailPasswordRequest {

	@NotEmpty
	@Email
	private String email;

	@NotEmpty
	private String password;



	@Builder
	public EmailPasswordRequest(String email, String password) {
		this.email = email;
		this.password = password;
	}
}
