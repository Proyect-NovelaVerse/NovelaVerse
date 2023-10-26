package com.grupo5.novelaverse.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.grupo5.novelaverse.models.Novel;


public interface SearchRepository extends BaseRepository<Novel> {

    @Query("SELECT n FROM Novel n WHERE n.title LIKE %:busqueda%")
    List<Novel> findSimilarNames(@Param("busqueda") String busqueda);
}
