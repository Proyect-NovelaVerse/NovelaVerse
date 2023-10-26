package com.grupo5.novelaverse.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.grupo5.novelaverse.models.Novel;
import com.grupo5.novelaverse.repositories.NovelRepository;


@Service
public class NovelService extends BaseService<Novel> {

    private NovelRepository repository;

    public NovelService(NovelRepository repository) {
        super(repository);
        this.repository = repository;
    }

    public List<Novel> findLatestNovelsAsc(int count) {
        return repository.findFirstNByOrderByCreateAtAsc(count);
    }
    
    public List<Novel> findLatestNovelsDesc(int count) {
        return repository.findFirstNByOrderByCreateAtDesc(count);
    }
    
    public List<Novel> findNovelasFiltradas(String category){
        return repository.findByCategory(category);
    }
    
    public Novel findByTitle(String title) {

        Optional<Novel> novel= repository.findByTitle(title);
        if(novel.isPresent()) {
            return novel.get();
        } else {
            return null;
        }
    }

    public List<Novel> buscarNovelasPorCategoriaYRating(String category, Double rating) {
        return repository.findNovelsByCategoryAndRatingOrderByDesc(category, rating);
    }
}
