package com.grupo5.novelaverse.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.grupo5.novelaverse.models.Novel;
import com.grupo5.novelaverse.repositories.SearchRepository;

@Service
public class SearchService extends BaseService<Novel>{

    private SearchRepository searchRepository;

    public SearchService(SearchRepository searchRepository) {
        super(searchRepository);
        this.searchRepository = searchRepository;
    }
    
    public List<Novel> buscarNovelasPorTitulo(String busqueda) {
        return searchRepository.findSimilarNames(busqueda);
    }

    public List<Novel> getAllNovels() {
        return searchRepository.findAll();
    }
}
