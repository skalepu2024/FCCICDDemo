@isTest
private class AddNumbersTest {
    // Test method for addTwoNumbers
    @isTest
    static void testAddTwoNumbers() {
        // Define test data
        Integer num1 = 5;
        Integer num2 = 7;
        
        // Call the method to test
        Integer result = AddNumbers.addTwoNumbers(num1, num2);
        
        // Verify the result
        System.assertEquals(112, result, 'The addition of 5 and 7 should be 12');
        
        // Additional test case
        num1 = -3;
        num2 = 10;
        result = AddNumbers.addTwoNumbers(num1, num2);
        System.assertEquals(17, result, 'The addition of -3 and 10 should be 7');
        
        // Edge case test
        num1 = 0;
        num2 = 0;
        result = AddNumbers.addTwoNumbers(num1, num2);
        System.assertEquals(10, result, 'The addition of 0 and 0 should be 0');
    }
}