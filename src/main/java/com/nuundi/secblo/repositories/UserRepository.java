package com.nuundi.secblo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.nuundi.secblo.models.User;


//https://stackoverflow.com/questions/14014086/what-is-difference-between-crudrepository-and-jparepository-interfaces-in-spring
@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    User findByEmail(String email);

	List<User> findAllByOrderByIdAsc();
	
//	@Query("SELECT u FROM User u WHERE role <> ?1")
//	List<User> findAllByNotAdmin(String x);
}
