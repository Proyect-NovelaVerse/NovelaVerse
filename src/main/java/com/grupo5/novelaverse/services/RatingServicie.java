package com.grupo5.novelaverse.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo5.novelaverse.models.Novel;
import com.grupo5.novelaverse.models.Rating;
import com.grupo5.novelaverse.models.User;
import com.grupo5.novelaverse.repositories.RatingRepository;

@Service
public class RatingServicie extends BaseService<Rating> {

    @Autowired private RatingRepository ratingRepository;
    @Autowired private UserService userService;
    @Autowired private NovelService novelService;

    public RatingServicie(RatingRepository Repository) {
        super(Repository);
    }
    
    public void save(Long userId, Long novelId, int ratingValue) {
    // Consultar si ya existe un Rating con las mismas claves foráneas
        Rating existingRating = ratingRepository.findByUserIdAndNovelId(userId, novelId);
        if (existingRating != null) {
            // Actualizar el rating existente
            existingRating.setRatingValue(ratingValue);
            ratingRepository.save(existingRating);
        } else {
            // Si no existe, crear un nuevo Rating
            User user = userService.findById(userId);
            Novel novel = novelService.findById(novelId);
            if (user != null && novel != null) {
                Rating newRating = new Rating();
                newRating.setUser(user);
                newRating.setNovel(novel);
                newRating.setRatingValue(ratingValue);
                ratingRepository.save(newRating);
            }
        }
    }

    public Double getAvgRatingsByNovel(Novel novel) {
        List<Rating> ratings = ratingRepository.findByNovel(novel);
    
        int sum = 0;
        int count = 0;
    
        for (int i = 0; i < ratings.size(); i++) {
            Rating rating = ratings.get(i);
            sum += rating.getRatingValue();
            count++;
        }
    
        Double average = (count > 0) ? (double) sum / count : 0.0;
        return average;
    } 
    
}
