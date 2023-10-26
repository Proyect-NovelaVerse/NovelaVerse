package com.grupo5.novelaverse.models;

import java.util.List;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
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
@Table (name = "novelas")
public class Novel extends BaseModel{ 

    @NotNull
    @NotBlank(message = "El título es obligatorio")
    @Size(max = 90)
    private String title;

    private String frontpage;

    @NotNull (message = "No debe estar vacío")
    @NotBlank (message = "No debe estar vacío")
    @Size(max = 2000000000)
    private String description; 

    @NotNull
    private String category;

    private Double avgRating;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "creator_id")
    private User creator;

    @OneToMany(mappedBy = "novel", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Chapter> chapters;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "novel_comments",
        joinColumns = @JoinColumn(name = "novel_id"),
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private List<User>  commentsUsers;
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "ratings",
        joinColumns = @JoinColumn(name = "novel_id"),
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private Set<User> usersRatings;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "views",
        joinColumns = @JoinColumn(name = "novel_id"),
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private Set<User> vieUsers;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "add_biblioteca",
        joinColumns = @JoinColumn(name = "novel_id"),
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private Set<User> biblioUser;
}
