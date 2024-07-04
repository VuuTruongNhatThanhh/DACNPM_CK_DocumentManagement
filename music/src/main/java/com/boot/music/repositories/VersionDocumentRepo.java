package com.boot.music.repositories;

import com.boot.music.entity.VersionDocument;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface VersionDocumentRepo extends JpaRepository<VersionDocument, Long> {
    VersionDocument findTopByDocumentIdOrderByIdDesc(int documentId);
    List<VersionDocument> findByDocumentId(int documentId);
}
