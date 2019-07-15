package mail;

import javax.mail.*;

public class GoogleAuthentication extends Authenticator {
    PasswordAuthentication passAuth;
    
    
    public GoogleAuthentication() {
        passAuth = new PasswordAuthentication("yuskim123", "rladydtn13");
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
        return passAuth;
    }
}
