package com.grupo5.novelaverse.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.grupo5.novelaverse.models.Chapter;
import com.grupo5.novelaverse.models.ChapterCommentary;
import com.grupo5.novelaverse.repositories.ChapterCommentaryRepository;

@Service
public class ChapterCommentaryService extends BaseService<ChapterCommentary> {

    private final ChapterCommentaryRepository commentaryRepository;

    public ChapterCommentaryService(ChapterCommentaryRepository repository) {
        super(repository);
        this.commentaryRepository = repository;
    }

    public ChapterCommentary guardarComentario(ChapterCommentary comentario) {
        return save(comentario); // Llama al método save heredado de BaseService
    }  

    public List<ChapterCommentary> getComentariosByChapter(Chapter chapter) {
        return commentaryRepository.findByChapter(chapter);
    }
}
