/**
 * Created by chpifer on 10/18/2019.
 */

@IsTest
public with sharing class DeclarativeTestRunner {
    
    private static List<String> getFlowList(){
        List<String> testFlows = new List<String>();
        List<FlowDefinitionView> testFlowsDefinitions = new List<FlowDefinitionView>();
        try{
            testFlowsDefinitions = [SELECT Id, ApiName, ProcessType FROM FlowDefinitionView WHERE Label like 'Test%'];
        } catch(DmlException e) {
            System.debug('Error - no flows meet naming criteria');
        }
        for(FlowDefinitionView thisFlow : testFlowsDefinitions){
            testFlows.add(thisFlow.ApiName);
        }
        return testFlows;
    }
    /** 
    @isTest
    static void testRun(){
        List<String> flowList = new List<String>();
        flowList.addAll(getFlowList());
        
        for(String flowName : flowList){
            String result = testRunner(flowName);
            System.assertEquals(flowName + '| Result: Success', flowName + '| Result: ' + result);            
        }
        Test.stopTest();
    }
    **/
    
    static string testRunner(Integer flowNumber) {
        string result; //variable that will record the result of the test flow
        string profileName; //variable to store run as profile
        String flowName;
        List<String> flowList = new List<String>();
        flowList.addAll(getFlowList());
        if(flowList.size() > flowNumber){
            flowName = flowList[flowNumber];
        }
        List<TestFlowRun__mdt> thisTestRun = [SELECT Id, Flow_Api_Name__c, Run_As_Profile__c FROM TestFlowRun__mdt LIMIT 1];
        System.debug('Execution slot number '+ String.valueOf(flowNumber));
        System.debug('Executing for ' + flowName);
        if(flowName != null){
            if(thisTestRun[0].Run_As_Profile__c == null){
                profileName = 'System Administrator';
            } else {
                profileName = thisTestRun[0].Run_As_Profile__c;
            }            
            system.debug('Running ' + flowName);

            list<profile> testProfile = [SELECT Id FROM Profile WHERE Name =: profileName LIMIT 1];



            //create and insert the test user to run the flow test as
            user testUser = new User(Alias = 'FlowT', Email= 'test' + 'Test@test.com',
                    EmailEncodingKey='UTF-8', LastName='test',
                    LanguageLocaleKey='en_US', LocaleSidKey='en_US',
                    ProfileId = testProfile[0].Id, TimeZoneSidKey='America/Los_Angeles',
                    UserName= 'test3452345' + 'Test@test.com');

            Map<String, Object> nothing = new Map<String, Object>();            
            //start the test
            Test.startTest();

            //run the test as a test user with the chosen profile
            System.runAs(testUser){
                Flow.Interview testFlow = Flow.Interview.createInterview(flowName, nothing);

                //Check to ensure that the flow is found and if it is run it.
                if (testFlow != null){
                    testFlow.start();
                    result = (string)(testFlow.getVariableValue('result'));
                }

            }
        } else {
            Test.startTest();
            //No flow found, this flow slot is empty.
            System.debug(flowNumber);
            System.debug('No flow found named '+flowName+', nothing to test.' +
                    'If you expected a test to run, check your flow naming');
            result = 'Success';
        }
        return result;

    }


    /** Test execution slots, allowing for individual tests to run in parallel **/
    @IsTest
    static void testRun1(){        
        String result = testRunner(1);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun2(){
        String result = testRunner(2);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun3(){
        String result = testRunner(3);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    /**
    @IsTest
    static void testRun4(){
        String result = testRunner(4);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun5(){
        String result = testRunner(5);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun6(){
        String result = testRunner(6);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun7(){
        String result = testRunner(7);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun8(){
        String result = testRunner(8);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun9(){
        String result = testRunner(9);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun10(){
        String result = testRunner(10);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun11(){
        String result = testRunner(11);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun12(){
        String result = testRunner(12);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun13(){
        String result = testRunner(13);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun14(){
        String result = testRunner(14);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun15(){
        String result = testRunner(15);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun16(){
        String result = testRunner(16);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun17(){
        String result = testRunner(17);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun18(){
        String result = testRunner(18);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun19(){
        String result = testRunner(19);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun20(){
        String result = testRunner(20);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun21(){
        String result = testRunner(21);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun22(){
        String result = testRunner(22);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun23(){
        String result = testRunner(23);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun24(){
        String result = testRunner(24);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun25(){
        String result = testRunner(25);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun26(){
        String result = testRunner(26);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun27(){
        String result = testRunner(27);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun28(){
        String result = testRunner(28);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun29(){
        String result = testRunner(29);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun30(){
        String result = testRunner(30);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun31(){
        String result = testRunner(31);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun32(){
        String result = testRunner(32);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun33(){
        String result = testRunner(33);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun34(){
        String result = testRunner(34);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun35(){
        String result = testRunner(35);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun36(){
        String result = testRunner(36);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun37(){
        String result = testRunner(37);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun38(){
        String result = testRunner(38);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun39(){
        String result = testRunner(39);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun40(){
        String result = testRunner(40);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun41(){
        String result = testRunner(41);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun42(){
        String result = testRunner(42);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun43(){
        String result = testRunner(43);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun44(){
        String result = testRunner(44);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun45(){
        String result = testRunner(45);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun46(){
        String result = testRunner(46);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun47(){
        String result = testRunner(47);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun48(){
        String result = testRunner(48);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun49(){
        String result = testRunner(49);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun50(){
        String result = testRunner(50);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun51(){
        String result = testRunner(51);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun52(){
        String result = testRunner(52);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun53(){
        String result = testRunner(53);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun54(){
        String result = testRunner(54);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun55(){
        String result = testRunner(55);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun56(){
        String result = testRunner(56);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun57(){
        String result = testRunner(57);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun58(){
        String result = testRunner(58);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun59(){
        String result = testRunner(59);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun60(){
        String result = testRunner(60);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun61(){
        String result = testRunner(61);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun62(){
        String result = testRunner(62);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun63(){
        String result = testRunner(63);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun64(){
        String result = testRunner(64);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun65(){
        String result = testRunner(65);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun66(){
        String result = testRunner(66);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun67(){
        String result = testRunner(67);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun68(){
        String result = testRunner(68);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun69(){
        String result = testRunner(69);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun70(){
        String result = testRunner(70);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun71(){
        String result = testRunner(71);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun72(){
        String result = testRunner(72);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun73(){
        String result = testRunner(73);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun74(){
        String result = testRunner(74);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun75(){
        String result = testRunner(75);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun76(){
        String result = testRunner(76);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun77(){
        String result = testRunner(77);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun78(){
        String result = testRunner(78);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun79(){
        String result = testRunner(79);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun80(){
        String result = testRunner(80);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun81(){
        String result = testRunner(81);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun82(){
        String result = testRunner(82);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun83(){
        String result = testRunner(83);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun84(){
        String result = testRunner(84);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun85(){
        String result = testRunner(85);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun86(){
        String result = testRunner(86);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun87(){
        String result = testRunner(87);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun88(){
        String result = testRunner(88);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun89(){
        String result = testRunner(89);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun90(){
        String result = testRunner(90);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun91(){
        String result = testRunner(91);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun92(){
        String result = testRunner(92);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun93(){
        String result = testRunner(93);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun94(){
        String result = testRunner(94);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun95(){
        String result = testRunner(95);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun96(){
        String result = testRunner(96);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun97(){
        String result = testRunner(97);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun98(){
        String result = testRunner(98);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun99(){
        String result = testRunner(99);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun100(){
        String result = testRunner(100);
        System.assertEquals('Success', result);
        Test.stopTest();
    }
     */
}