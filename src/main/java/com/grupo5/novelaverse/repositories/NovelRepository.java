package com.grupo5.novelaverse.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

import com.grupo5.novelaverse.models.Novel;

public interface NovelRepository extends BaseRepository<Novel> {
    @Query("SELECT n FROM Novel n WHERE n.category = :category")
    List<Novel> findByCategory(String category);
    
    Optional<Novel> findByTitle(String title);

    @Query("SELECT n FROM Novel n ORDER BY n.createAt ASC LIMIT ?1")
    List<Novel> findFirstNByOrderByCreateAtAsc(int count);

    @Query("SELECT n FROM Novel n ORDER BY n.createAt DESC LIMIT ?1")
    List<Novel> findFirstNByOrderByCreateAtDesc(int count);

    @Query("SELECT n FROM Novel n WHERE n.category = :category AND (n.avgRating IS NULL OR n.avgRating <= :rating) ORDER BY n.avgRating DESC")
    List<Novel> findNovelsByCategoryAndRatingOrderByDesc(String category, Double rating);



}
