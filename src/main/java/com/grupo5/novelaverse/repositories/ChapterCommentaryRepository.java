package com.grupo5.novelaverse.repositories;

import java.util.List;

import com.grupo5.novelaverse.models.Chapter;
import com.grupo5.novelaverse.models.ChapterCommentary;

public interface ChapterCommentaryRepository extends BaseRepository<ChapterCommentary> {

    List<ChapterCommentary> findByChapter(Chapter chapter);
}
