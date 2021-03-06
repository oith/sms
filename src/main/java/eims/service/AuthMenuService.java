package eims.service;

import eims.model.security.AuthMenu;
import eims.exception.AuthMenuNotFoundException;
import eims.dto._SearchDTO;
import java.math.BigInteger;

public interface AuthMenuService {



    public AuthMenu findById(BigInteger id);
    
    public AuthMenu create(AuthMenu authMenu);
    
    public AuthMenu update(AuthMenu authMenu) throws AuthMenuNotFoundException;
    
    public AuthMenu copy(AuthMenu authMenu);
    
    public AuthMenu delete(BigInteger id) throws AuthMenuNotFoundException;
   
    public Iterable<AuthMenu> search(_SearchDTO pageable);
    
    public Iterable<AuthMenu> findAll(_SearchDTO pageable);
    
    public Iterable<AuthMenu> findAll();
}