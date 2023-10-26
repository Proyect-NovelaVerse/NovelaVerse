package com.grupo5.novelaverse.models;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@Entity
@Table(name = "chapters")
public class Chapter extends BaseModel {

    @NotBlank
    @NotEmpty
    @NotNull
    @Size(min = 2, max = 60)
    private String title;

    @NotNull
    @NotBlank
    @Size(max = 2000000000)
    private String description;

    @Column(name = "chapter_order")
    private Integer order; // Nueva propiedad que representa el orden de los capítulos

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "novel_id")
    private Novel novel;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "chapter_comments", joinColumns = @JoinColumn(name = "chapter_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
    private List<User> commentsUsers;
}
