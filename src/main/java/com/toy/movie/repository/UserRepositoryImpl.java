package com.toy.movie.repository;

import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.toy.movie.dto.UserDto;
import com.toy.movie.entity.QUser;
import com.toy.movie.entity.User;
import jakarta.persistence.EntityManager;

import static com.toy.movie.entity.QUser.user;

/**
 * packageName    : com.toy.movie.repository
 * fileName       : UserRepositoryImpl
 * author         : shipowner
 * date           : 2023-09-21
 * description    : User 엔티티를 관리하기 위한 Custom Repository 구현체
 */
public class UserRepositoryImpl  implements UserRepositoryCustom {

    private final JPAQueryFactory queryFactory;

    public UserRepositoryImpl(EntityManager em){
        this.queryFactory = new JPAQueryFactory(em);
    }

    @Override
    public UserDto findUserDtoByEmail(String email) {
        return queryFactory
                .select(Projections.fields(UserDto.class
                        , user.email
                        , user.name
                ))
                .from(user)
                .where(user.email.eq(email))
                .fetchOne();
    }
}
