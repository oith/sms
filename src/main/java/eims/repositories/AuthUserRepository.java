package eims.repositories;

import eims.model.security.AuthUser;
import java.math.BigInteger;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthUserRepository extends JpaRepository<AuthUser, BigInteger> {

    public AuthUser findByUsername(String username);

    public Boolean deleteByUsername(String username);
}
