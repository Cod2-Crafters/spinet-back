package com.codecrafter.typhoon.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.codecrafter.typhoon.domain.entity.Member;
import com.codecrafter.typhoon.domain.response.PostShopResponse;
import com.codecrafter.typhoon.domain.response.member.SimpleShopResponse;
import com.codecrafter.typhoon.repository.member.MemberRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class MemberService {

	private final MemberRepository memberRepository;

	public List<Member> getMemberList() {
		return memberRepository.findAll();
	}

	public List<SimpleShopResponse> getShopList(Pageable pageable) {
		List<SimpleShopResponse> list = memberRepository.findAll(Sort.by("id").descending())
			.stream().map(SimpleShopResponse::new)
			.toList();

		return list;
	}

	public PostShopResponse getPostShop(Long memberId) {
		PostShopResponse postShop = memberRepository.getPostShop(memberId);
		return postShop;
	}
}
