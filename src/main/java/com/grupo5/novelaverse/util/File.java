package com.grupo5.novelaverse.util;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class File {
    
    public String uploadFile(MultipartFile file, String saveDirectory, String prefixFileName, Long fileId){
        
        if (file.isEmpty() || saveDirectory == null || prefixFileName == null || fileId == null) {
            return null;
        }

        String originalFilename = file.getOriginalFilename();
        int lastDotIndex = originalFilename.lastIndexOf(".");
        String fileExtension =  "";
        
        if (lastDotIndex > 0) {
            fileExtension = originalFilename.substring(lastDotIndex);
        }
        try {

            String filename = prefixFileName + "_" + fileId.toString() + fileExtension;
            Path savePath = Paths.get(saveDirectory + filename);
            Files.write(savePath, file.getBytes());

            return filename;
            
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}
