@isTest
public class ContactEmailValidatorTest {
    
    @isTest
    static void testValidEmails() {
        List<Contact> contacts = new List<Contact>{
            new Contact(LastName = 'Test', Email = 'valid.email@example.com'),
            new Contact(LastName = 'Test', Email = 'another.valid.email@example.org')
        };
        Test.startTest();
        insert contacts;
        Test.stopTest();
        
        // No errors should be thrown
        System.assertEquals(2, [SELECT COUNT() FROM Contact WHERE Id IN :contacts]);
    }

    @isTest
    static void testInvalidEmails() {
        List<Contact> contacts = new List<Contact>{
            new Contact(LastName = 'Test', Email = 'invalid.email@com'),
            new Contact(LastName = 'Test', Email = 'another.invalid.email@.org')
        };
        Test.startTest();
        try {
            insert contacts;
            System.assert(false, 'Expected an email format exception.');
        } catch (DmlException e) {
            // Expected behavior
            System.assert(e.getMessage().contains('Invalid email format'));
        }
        Test.stopTest();
    }

    @isTest
    static void testMixedEmails() {
        List<Contact> contacts = new List<Contact>{
            new Contact(LastName = 'Test', Email = 'valid.email@example.com'),
            new Contact(LastName = 'Test', Email = 'invalid.email@com')
        };
        Test.startTest();
        try {
            insert contacts;
            System.assert(false, 'Expected an email format exception.');
        } catch (DmlException e) {
            // Expected behavior
            System.assert(e.getMessage().contains('Invalid email format'));
        }
        Test.stopTest();
    }
}