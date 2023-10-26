package com.grupo5.novelaverse.models;

import java.util.List;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name="usuarios")
public class User extends BaseModel {

    @NotNull(message = "El nombre no debe estar vacio")
    @NotBlank
    @Size(max = 20)
    @Column(nullable = false, unique = true)
    private String nickname;

    @NotNull
    @NotBlank(message = "El email no debe estar vacio")
    @Email(message = "email invalido")
    @Column(nullable = false, unique = true, length = 64)
    private String email;

    @NotNull
    @NotBlank(message = "LA contraseña no debe estar vacio")
    @Size(min = 5, message = "Constraseña muy corta, contener al menos 5 caracteres")
    @Column(nullable = false)
    private String password;

    @Transient
    private String passwordConfirmation;
    
    @OneToMany(mappedBy = "creator", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Novel> postedNovels;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "chapter_comments",
        joinColumns = @JoinColumn(name = "user_id"),
        inverseJoinColumns = @JoinColumn(name = "chapter_id")
    )
    private List<Chapter> commentsChapters;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "novel_comments",
        joinColumns = @JoinColumn(name = "user_id"),
        inverseJoinColumns = @JoinColumn(name = "novel_id")
    )
    private List<Novel> commentsNovels;
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "ratings",
        joinColumns = @JoinColumn(name = "user_id"),
        inverseJoinColumns = @JoinColumn(name = "novel_id")
    )
    private Set<Novel> novelsRatings;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "views",
        joinColumns = @JoinColumn(name = "user_id"),
        inverseJoinColumns = @JoinColumn(name = "novel_id")
    )
    private Set<Novel> viewNovels;
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "add_biblioteca",
        joinColumns = @JoinColumn(name = "user_id"),
        inverseJoinColumns = @JoinColumn(name = "novel_id")
    )
    private Set<Novel> biblioNovel;
}

