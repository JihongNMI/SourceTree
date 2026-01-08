package me.shinsunyoung.springbootdeveloper.controller;

import me.shinsunyoung.springbootdeveloper.dto.UploadFileDTO;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class UpDownController {
    @PostMapping(value="/upload",
            consumes=MediaType.MULTIPART_FORM_DATA_VALUE)
    public String upload(UploadFileDTO uploadFileDTO){
        // 파일이 있는지 확인
        if(uploadFileDTO.getFiles()!=null){
            for(MultipartFile file : uploadFileDTO.getFiles()){
                System.out.println(file.getOriginalFilename());
            }
        }
        return null;
    }
}
