package com.boot.music.controller;

import com.boot.music.entity.Document;
import com.boot.music.entity.User;
import com.boot.music.entity.VersionDocument;
import com.boot.music.repositories.DocumentRepo;
import com.boot.music.repositories.UserRepo;
import com.boot.music.repositories.VersionDocumentRepo;
import com.boot.music.repositories.VersionRepo;
import com.boot.music.request.DocumentRequest;
import com.boot.music.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
public class DocumentController {

    @Autowired
    private DocumentService documentService;
    private UserRepo userRepo;
    @Autowired
    private VersionDocumentRepo versionRepository;

    @GetMapping("/documents")
    public String getAllDocuments(Model model) {
        List<Document> documents = documentService.getAllDocuments();
        model.addAttribute("documents", documents);
        return "documents";
    }

    @GetMapping("/documentsLoading")
    public String getAllDocumentsLoading(Model model) {
        List<Document> documents = documentService.getAllDocuments();
        model.addAttribute("documents", documents);
        return "documentsLoading";
    }

    @GetMapping("/homeDocument")
    public String getAllDocumentsHome(Model model) {
        List<Document> documents = documentService.getAllDocuments();
        model.addAttribute("documents", documents);
        return "index";
    }

    @Autowired
    private DocumentRepo documentRepo;


//    1: cho duyet, 3: da duyet, 2: an,


    @GetMapping("/approve/{id}")
    public String approveDocument(@PathVariable int id) {
        Document document = documentRepo.findById(id).orElse(null);
        if (document != null) {
            document.setStatus((short) 1); // Đặt trạng thái thành "Đang chờ duyệt"
            documentRepo.save(document);
        }
        return "redirect:/documents";
    }

    @GetMapping("/decline/{id}")
    public String declineDocument(@PathVariable int id) {
        Document document = documentRepo.findById(id).orElse(null);
        if (document != null) {
            document.setStatus((short) 4); // Đặt trạng thái thành "Từ chối duyệt"
            documentRepo.save(document);
        }
        return "redirect:/documents";
    }

    @PostMapping("/updateDocumentStatus")
    public String updateDocumentStatus(@RequestParam int documentId, @RequestParam int status, RedirectAttributes redirectAttributes) {
        // Gọi phương thức service để cập nhật trạng thái của tài liệu
        documentService.updateDocumentStatus(documentId, status);
        // Thêm thông báo hoặc dữ liệu cần thiết vào redirectAttributes nếu cần
        redirectAttributes.addFlashAttribute("message", "Cập nhật trạng thái tài liệu thành công!");
        // Chuyển hướng người dùng đến trang /documents
        return "redirect:/documentsLoading";
    }

    @PostMapping("/createDocument")
    public String createDocument(@RequestParam("title") String title,
                                 @RequestParam("summary") String summary) {

        Date currentDate = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.add(Calendar.YEAR, 1);
        Date endDate = calendar.getTime();

        try {
            Document document = new Document(title, summary, currentDate, endDate, null);
            documentService.createDocument(document);
            return "redirect:/documents";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/documents";
        }
    }


    @GetMapping("/{id}")
    public String details(@RequestParam("id") int id, Model model) {
        Document doc = documentService.getDocumentById(id);
        if (doc == null) { //Nếu Tài liệu ko tồn tại > báo lỗi > về trang tài liệu
            model.addAttribute("error", "Tài liệu " + id + " không tồn tại!");
            return "redirect:/documents";
        } else {
            model.addAttribute("doc", doc);
            return "redirect:/documents";
        }
    }

    @GetMapping("/documents/{id}")
    public String viewDocumentDetail(@PathVariable("id") int id, Model model) {
        Document document = documentService.getDocumentById(id);
        model.addAttribute("document", document);
        return "documentDetail";
    }

    @PostMapping("/addDocument")
    public String addDocument(@RequestParam("title") String title,
                              @RequestParam("summary") String summary,
                              @RequestParam("dateStart") Date dateStart,
                              @RequestParam("dateEnd") Date dateEnd) {
        Document document = new Document();
        document.setTitle(title);
        document.setSumary(summary);
        document.setDateStart(dateStart);
        document.setDateEnd(dateEnd);


        documentRepo.save(document);

        return "redirect:/documents"; // Điều hướng đến trang thành công sau khi thêm tài liệu
    }

    @GetMapping("/viewVersions")
    public String viewVersions(@RequestParam("documentId") int documentId, Model model) {
        List<VersionDocument> versions = versionRepository.findByDocumentId(documentId);
        System.out.println("version"+ versions);
        model.addAttribute("versions", versions);
        return "viewVersions";
    }


}