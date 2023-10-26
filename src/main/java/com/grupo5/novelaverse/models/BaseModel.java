package com.grupo5.novelaverse.models;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@MappedSuperclass
public abstract class BaseModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createAt;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date update_at;

    @PrePersist
    protected void onCreate(){
        this.createAt = new Date();
    }

    @PreUpdate
    protected void onUpdate(){
        this.update_at = new Date();
    }
}
