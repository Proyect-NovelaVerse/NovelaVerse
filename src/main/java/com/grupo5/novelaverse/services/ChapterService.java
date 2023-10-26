package com.grupo5.novelaverse.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.grupo5.novelaverse.models.Chapter;
import com.grupo5.novelaverse.repositories.ChapterRepository;

@Service
public class ChapterService extends BaseService<Chapter> {

    private final ChapterRepository chapterRepository;

    public ChapterService(ChapterRepository repository) {
        super(repository);
        this.chapterRepository = repository;
    }
    
    public Chapter getChapterByNovelAndChapterOrder(Long novelId, Integer chapterOrder) {
        return chapterRepository.findByNovelIdAndOrder(novelId, chapterOrder);
    }

    public Chapter getNextChapterByNovelAndChapterOrder(Long novelId, Integer currentChapterOrder) {
        return chapterRepository.findFirstByNovelIdAndOrderGreaterThanOrderByOrderAsc(novelId, currentChapterOrder);
    }
    
    public Chapter getPreviousChapterByNovelAndChapterOrder(Long novelId, Integer currentChapterOrder) {
        return chapterRepository.findFirstByNovelIdAndOrderLessThanOrderByOrderDesc(novelId, currentChapterOrder);
    }
    
    public List<Chapter> getAllChaptersForNovel(Long novelId) {
        return chapterRepository.getAllChaptersForNovel(novelId);
    }
}
