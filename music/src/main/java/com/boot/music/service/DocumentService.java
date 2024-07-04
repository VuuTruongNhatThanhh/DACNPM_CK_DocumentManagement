package com.boot.music.service;

import com.boot.music.entity.Document;
import com.boot.music.entity.User;
import com.boot.music.repositories.DocumentRepo;
import com.boot.music.repositories.UserRepo;
import com.boot.music.request.DocumentRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class DocumentService {

    @Autowired
    private DocumentRepo documentRepository;
    private UserRepo userRepo;
    public List<Document> getAllDocuments() {
        return documentRepository.findAll();
    }
    // Cập nhật tiêu đề và tóm tắt của tài liệu
    public void updateDocument(int id, String title, String summary) {
        Optional<Document> documentOptional = documentRepository.findById(id);
        if (documentOptional.isPresent()) {
            Document document = documentOptional.get();
            document.setTitle(title);
            document.setSumary(summary);
            documentRepository.save(document);
        } else {
            throw new IllegalArgumentException("Không tìm thấy tài liệu với ID " + id);
        }
    }
    public void updateDocumentStatus(int documentId, int newStatus) {
        Optional<Document> optionalDocument = documentRepository.findById(documentId);
        if (optionalDocument.isPresent()) {
            Document document = optionalDocument.get();
            document.setStatus( newStatus);
            documentRepository.save(document);
        } else {
            // Xử lý trường hợp không tìm thấy tài liệu
            throw new RuntimeException("Không tìm thấy tài liệu với ID: " + documentId);
        }
    }

    public void createDocument(Document document) {
        documentRepository.save(document);
    }

    public Document getDocumentById(int id) {
        return documentRepository.findById(id).orElseThrow(() ->
                new RuntimeException("Không tìm thấy tài liệu với ID: " + id));
    }



    public Document addDocument(Document document) {
        // Có thể thực hiện các xác thực hoặc kiểm tra dữ liệu ở đây

        // Lưu tài liệu vào cơ sở dữ liệu và trả về tài liệu đã lưu
        return documentRepository.save(document);
    }
    }

