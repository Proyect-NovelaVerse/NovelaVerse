package com.grupo5.novelaverse.services;

import org.springframework.stereotype.Service;

import com.grupo5.novelaverse.models.View;
import com.grupo5.novelaverse.repositories.ViewRepository;

@Service
public class ViewService extends BaseService<View> {

    public ViewService(ViewRepository Repository) {
        super(Repository);
    }
    
}
