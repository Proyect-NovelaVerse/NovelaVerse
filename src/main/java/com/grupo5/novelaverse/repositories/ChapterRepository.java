package com.grupo5.novelaverse.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.grupo5.novelaverse.models.Chapter;

public interface ChapterRepository extends BaseRepository<Chapter> {

    Chapter findByNovelIdAndOrder(Long novelId, Integer chapterOrder);

    Chapter findFirstByNovelIdAndOrderGreaterThanOrderByOrderAsc(Long novelId, Integer currentChapterOrder);

    Chapter findFirstByNovelIdAndOrderLessThanOrderByOrderDesc(Long novelId, Integer currentChapterOrder);

    @Query("SELECT c FROM Chapter c WHERE c.novel.id = :novelId ORDER BY c.order ASC")
    List<Chapter> getAllChaptersForNovel(Long novelId);
}
