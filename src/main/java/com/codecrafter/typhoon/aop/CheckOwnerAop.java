package com.codecrafter.typhoon.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.codecrafter.typhoon.config.MockPrincipal;
import com.codecrafter.typhoon.domain.entity.Post;
import com.codecrafter.typhoon.exception.NoPostException;
import com.codecrafter.typhoon.repository.post.PostRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * 권한체크 aop, 쿼리가 2번나감
 */
@Aspect
@Component
@RequiredArgsConstructor
@Slf4j
public class CheckOwnerAop {

	private final PostRepository postRepository;

	private final PlatformTransactionManager tr;

	@Around("@annotation(CheckOwner) && args(postId,..)")
	public Object checkPostOwner(ProceedingJoinPoint joinPoint, Long postId) throws Throwable {

		log.info("checkOwnerAop");

		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = tr.getTransaction(def);
		try {
			MockPrincipal principal = (MockPrincipal)SecurityContextHolder.getContext()
				.getAuthentication()
				.getPrincipal();

			Post post = postRepository.findById(postId).orElseThrow(NoPostException::new);
			if (!post.getMember().getId().equals(principal.getId())) {
				throw new AccessDeniedException("권한이 없다고");
			}
			Object result = joinPoint.proceed();
			log.info("test");
			tr.commit(status);
			return result;
		} catch (Throwable e) {

			throw new BadCredentialsException("권한이 없습니다.");
		}
	}

}
