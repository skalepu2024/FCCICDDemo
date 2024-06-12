public class ContactEmailValidator {
    
    // Regular expression pattern for validating email addresses
    private static final Pattern EMAIL_PATTERN = Pattern.compile('^[\\w\\.-]+@[\\w\\.-]+\\.\\w{2,}$');
    
    // Method to validate the email format
    public static Boolean isValidEmail(String email) {
        if (email == null || email == '') {
            return false;
        }
        Matcher matcher = EMAIL_PATTERN.matcher(email);
        return matcher.matches();
    }

    // Method to validate emails in a list of Contacts
    public static void validateEmails(List<Contact> contacts) {
        for (Contact contact : contacts) {
            if (!isValidEmail(contact.Email)) {
                contact.addError('Invalid email format: ' + contact.Email);
            }
        }
    }
}