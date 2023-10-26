package com.grupo5.novelaverse.repositories;

import java.util.List;

import com.grupo5.novelaverse.models.Novel;
import com.grupo5.novelaverse.models.Rating;

public interface RatingRepository extends BaseRepository<Rating>{
    Rating findByUserIdAndNovelId(Long userId, Long novelId);
    List<Rating> findByNovel(Novel novel);
}
