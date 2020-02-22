@IsTest
public class flowTest {
	@IsTest
	static void testFlow() {
	
		string result; //variable that will record the result of the test flow
		string profileName = 'System Administrator'; //the profile that will be assigned to the test user if applicable. Defaults to Admin.
		
		list<profile> testProfile = [SELECT Id FROM Profile WHERE Name =: profileName LIMIT 1];
		
		//if no matching profile is found, use the system administrator profile.
		if(testProfile[0] == null){
			testProfile = [SELECT Id FROM Profile WHERE Name =: 'System Administrator' LIMIT 1];
		}
		
		//create and insert the test user to run the flow test as
		user testUser = new User(Alias = 'FlowT', Email= 'test' + 'Test@test.com', 
								 EmailEncodingKey='UTF-8', LastName='test', 
								 LanguageLocaleKey='en_US', LocaleSidKey='en_US', 
								 ProfileId = testProfile[0].Id, TimeZoneSidKey='America/Los_Angeles', 
								 UserName= 'test3452345' + 'Test@test.com');
								 
	
		//start the test
		
        Map<String, Object> nothing = new Map<String, Object>();
		Test.startTest();
		
		//run the test as a test user with the chosen profile
		System.runAs(testUser){
			Flow.Interview testFlow = Flow.Interview.createInterview('Test_Flow_Account_Update_Process_Builder', nothing);
			
			//Check to ensure that the flow is found and if it is run it.
			if (testFlow != null){
				testFlow.start();
				result = (string)(testFlow.getVariableValue('result'));
			}
			
			system.assertEquals('Success', result);
            
            Flow.Interview testFlow2 = Flow.Interview.createInterview('TestOppSize_Amount1000_Medium', nothing);
			
			//Check to ensure that the flow is found and if it is run it.
			if (testFlow2 != null){
				testFlow2.start();
				result = (string)(testFlow2.getVariableValue('result'));
			}
            
            
            
		}
		
		Test.stopTest();
	}
}