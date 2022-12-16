package com.heartpet.util;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class CheckMimeType {
    
    public String contentType(String filePath) throws Exception {
        System.out.println("filePath : "+filePath);
        Path source = Paths.get(filePath);
        String mimeType = Files.probeContentType(source);
        System.out.println("mimeType"+mimeType);

        return mimeType;
    }
}
