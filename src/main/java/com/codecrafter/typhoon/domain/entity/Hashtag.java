package com.codecrafter.typhoon.domain.entity;

import static com.codecrafter.typhoon.CustomUtils.*;
import static jakarta.persistence.GenerationType.*;
import static lombok.AccessLevel.*;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

import org.hibernate.annotations.Comment;
import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access = PROTECTED)
public class Hashtag {
	@OneToMany(mappedBy = "hashtag")
	private final Set<PostHashtag> postHashtagSet = new HashSet<>();
	@Id
	@GeneratedValue(strategy = IDENTITY)
	private Long id;
	private String tagName;
	@CreationTimestamp
	@Comment("생성일자")
	private LocalDateTime createdAt;

	@Comment("초성")
	private String chosung;

	public Hashtag(String tagName) {
		this.tagName = tagName;
		this.chosung = getChosungString(tagName);
	}

	public void addPostHashtag(PostHashtag postHashtag) {
		postHashtagSet.add(postHashtag);
	}

	@Override
	public String toString() {
		return "Hashtag{" +
			"id=" + id +
			", tagName='" + tagName + '\'' +
			", createdAt=" + createdAt +
			'}';
	}
}
