package com.grupo5.novelaverse.models;

import org.springframework.lang.NonNull;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@Entity
@Table(name ="chapter_comments")
public class ChapterCommentary extends BaseModel {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn( name = "chapter_id")
    @NonNull
    private Chapter chapter;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @Size(max = 20000)
    private String comment;
}
