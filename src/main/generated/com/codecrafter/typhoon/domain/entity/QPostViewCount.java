package com.codecrafter.typhoon.domain.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QPostViewCount is a Querydsl query type for PostViewCount
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QPostViewCount extends EntityPathBase<PostViewCount> {

    private static final long serialVersionUID = -1082486447L;

    public static final QPostViewCount postViewCount = new QPostViewCount("postViewCount");

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final NumberPath<Long> postId = createNumber("postId", Long.class);

    public final NumberPath<Long> viewCount = createNumber("viewCount", Long.class);

    public final DatePath<java.time.LocalDate> viewDay = createDate("viewDay", java.time.LocalDate.class);

    public QPostViewCount(String variable) {
        super(PostViewCount.class, forVariable(variable));
    }

    public QPostViewCount(Path<? extends PostViewCount> path) {
        super(path.getType(), path.getMetadata());
    }

    public QPostViewCount(PathMetadata metadata) {
        super(PostViewCount.class, metadata);
    }

}

