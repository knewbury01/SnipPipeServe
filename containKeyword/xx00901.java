|    CustomUserDetails userDetails = 
        (CustomUserDetails) SecurityContextHolder
            .getContext()
            .getAuthentication()
            .getPrincipal();
    
