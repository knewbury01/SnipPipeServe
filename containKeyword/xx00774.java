|     SecurityContextHolder.getContext().getAuthentication() != null &&
     SecurityContextHolder.getContext().getAuthentication().isAuthenticated() &&
     //when Anonymous Authentication is enabled
     !(SecurityContextHolder.getContext().getAuthentication() 
              instanceof AnonymousAuthenticationToken) 
     
