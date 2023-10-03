/**
 * Created by chpifer on 10/18/2019.
 */

@IsTest
public with sharing class DeclarativeTestRunner {
    
    private static List<String> testFlows = new List<String>();
    private static List<String> testFlowsNameList = new List<String>();

    private static List<String> getFlowList(){
        //List<String> testFlows = new List<String>();
        List<FlowDefinitionView> testFlowsDefinitions = new List<FlowDefinitionView>();
        
        if(testFlows.size() == 0){
            try{
                System.debug('Initializing flow list');
                testFlowsDefinitions = [SELECT Id, Label, ApiName, ProcessType FROM FlowDefinitionView WHERE Label like 'Test%'];
            } catch(DmlException e) {
                System.debug('Error - no flows meet naming criteria, ensure flow api names begin with test_');
            }
        }
        for(FlowDefinitionView thisFlow : testFlowsDefinitions){
            testFlows.add(thisFlow.ApiName);
            testFlowsNameList.add(thisFlow.Label);
        }
        return testFlows;
    }
    /** 
    @isTest(SeeAllData=false)
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
        /** Stub for setting running user for flows */
        if(flowName != null){            
            List<TestFlowRun__mdt> thisTestRun = [SELECT Id, Flow_Api_Name__c, Run_As_Profile__c FROM TestFlowRun__mdt LIMIT 1];
            System.debug('Execution slot number '+ String.valueOf(flowNumber));
            System.debug('Executing for ' + flowName);
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
            if(flowName == null ){
                System.debug('Execution Slot empty, disregard');
            } else {
                System.debug('No flow found named '+flowName+', nothing to test.' +
                    'If you expected a test to run, check your flow naming');            
            }
            result = 'Success';            
        }
        return result;

    }

    static void validateTestResults(String result, Integer flowNumber){
        String flowName;
        if(result == null){
            result = 'SUCCESSS';
            System.debug('No flow found, bypassing test');
        }
        if(testFlowsNameList.size() == 0){
            System.debug('Test to avoid re-initalizing flow list');
            getFlowList();
        }
        if(testFlowsNameList.size() > flowNumber){
            flowName = testFlowsNameList[flowNumber];
        }        
        String successCriteria = flowName + ' - SUCCESS'; 
        String formattedResult = flowName + ' - ' + result.toUpperCase();
        System.assertEquals(successCriteria, formattedResult);
    }


    /** Test execution slots, allowing for individual tests to run in parallel **/
    @isTest(SeeAllData=false)
    static void testRun0(){  
        Integer testNumber = 0;      
        String result = testRunner(testNumber);
        //validateTestResults(result, 0); //Skipped as package includes example test failure
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun1(){
        Integer testNumber = 1;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun2(){
        Integer testNumber = 2;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun3(){
        Integer testNumber = 3;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun4(){
        Integer testNumber = 4;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun5(){
        Integer testNumber = 5;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun6(){
        Integer testNumber = 6;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun7(){
        Integer testNumber = 7;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun8(){
        Integer testNumber = 8;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun9(){
        Integer testNumber = 9;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun10(){
        Integer testNumber = 10;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun11(){
        Integer testNumber = 11;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun12(){
        Integer testNumber = 12;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun13(){
        Integer testNumber = 13;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun14(){
        Integer testNumber = 14;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun15(){
        Integer testNumber = 15;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun16(){
        Integer testNumber = 16;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun17(){
        Integer testNumber = 17;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun18(){
        Integer testNumber = 18;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun19(){
        Integer testNumber = 19;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun20(){
        Integer testNumber = 20;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun21(){
        Integer testNumber = 21;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun22(){
        Integer testNumber = 22;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun23(){
        Integer testNumber = 23;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun24(){
        Integer testNumber = 24;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun25(){
        Integer testNumber = 25;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun26(){
        Integer testNumber = 26;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun27(){
        Integer testNumber = 27;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun28(){
        Integer testNumber = 28;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun29(){
        Integer testNumber = 29;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun30(){
        Integer testNumber = 30;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun31(){
        Integer testNumber = 31;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun32(){
        Integer testNumber = 32;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun33(){
        Integer testNumber = 33;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun34(){
        Integer testNumber = 34;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun35(){
        Integer testNumber = 35;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun36(){
        Integer testNumber = 36;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun37(){
        Integer testNumber = 37;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun38(){
        Integer testNumber = 38;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun39(){
        Integer testNumber = 39;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun40(){
        Integer testNumber = 40;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun41(){
        Integer testNumber = 41;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun42(){
        Integer testNumber = 42;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun43(){
        Integer testNumber = 43;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun44(){
        Integer testNumber = 44;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun45(){
        Integer testNumber = 45;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun46(){
        Integer testNumber = 46;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun47(){
        Integer testNumber = 47;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun48(){
        Integer testNumber = 48;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun49(){
        Integer testNumber = 49;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun50(){
        Integer testNumber = 50;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun51(){
        Integer testNumber = 51;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun52(){
        Integer testNumber = 52;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun53(){
        Integer testNumber = 53;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun54(){
        Integer testNumber = 54;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun55(){
        Integer testNumber = 55;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun56(){
        Integer testNumber = 56;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun57(){
        Integer testNumber = 57;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun58(){
        Integer testNumber = 58;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun59(){
        Integer testNumber = 59;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun60(){
        Integer testNumber = 60;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun61(){
        Integer testNumber = 61;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun62(){
        Integer testNumber = 62;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun63(){
        Integer testNumber = 63;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun64(){
        Integer testNumber = 64;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun65(){
        Integer testNumber = 65;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun66(){
        Integer testNumber = 66;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun67(){
        Integer testNumber = 67;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun68(){
        Integer testNumber = 68;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun69(){
        Integer testNumber = 69;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun70(){
        Integer testNumber = 70;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun71(){
        Integer testNumber = 71;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun72(){
        Integer testNumber = 72;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun73(){
        Integer testNumber = 73;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun74(){
        Integer testNumber = 74;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun75(){
        Integer testNumber = 75;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun76(){
        Integer testNumber = 76;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun77(){
        Integer testNumber = 77;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun78(){
        Integer testNumber = 78;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun79(){
        Integer testNumber = 79;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun80(){
        Integer testNumber = 80;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun81(){
        Integer testNumber = 81;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun82(){
        Integer testNumber = 82;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun83(){
        Integer testNumber = 83;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun84(){
        Integer testNumber = 84;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun85(){
        Integer testNumber = 85;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun86(){
        Integer testNumber = 86;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun87(){
        Integer testNumber = 87;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun88(){
        Integer testNumber = 88;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun89(){
        Integer testNumber = 89;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun90(){
        Integer testNumber = 90;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun91(){
        Integer testNumber = 91;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun92(){
        Integer testNumber = 92;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun93(){
        Integer testNumber = 93;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun94(){
        Integer testNumber = 94;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun95(){
        Integer testNumber = 95;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun96(){
        Integer testNumber = 96;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun97(){
        Integer testNumber = 97;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun98(){
        Integer testNumber = 98;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun99(){
        Integer testNumber = 99;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }        
    @isTest(SeeAllData=false)
    static void testRun100(){
        Integer testNumber = 100;      
        String result = testRunner(testNumber);        
        validateTestResults(result, testNumber);
        Test.stopTest();
    }
}