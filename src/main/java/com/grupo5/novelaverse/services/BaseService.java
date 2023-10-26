package com.grupo5.novelaverse.services;

import java.util.List;
import java.util.Optional;


import com.grupo5.novelaverse.repositories.BaseRepository;


public abstract class BaseService<T> {
    
    BaseRepository<T> baseRepository;

    public BaseService(BaseRepository<T> baseRepository){
        this.baseRepository = baseRepository;
    }

    public List<T> findAll(){
        return baseRepository.findAll();
    }

    public T save(T objeto) {
        return baseRepository.save(objeto);
    }
    
    public T findById(Long id) {
        Optional<T> optional= baseRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        } else {
            return null;
        }
    }

    public T update(T objeto){
        return save(objeto);
    }


    public void delete(Long id) {
        baseRepository.deleteById(id);
    }
}
 