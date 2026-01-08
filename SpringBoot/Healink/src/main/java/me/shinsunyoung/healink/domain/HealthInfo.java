package me.shinsunyoung.healink.domain;

import jakarta.persistence.*;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;


@EntityListeners(AuditingEntityListener.class)
@Table(name="HEALTH_INFO")
@Entity
public class HealthInfo {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long health_info_id;
    @Column(nullable = false)
    private String title;
    private String summary;
    @Column(nullable = false)
    private String content;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Category category;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private SourceType source_type;

    @CreatedDate
    private LocalDateTime created_at;

    @LastModifiedDate
    private LocalDateTime updated_at;


}
