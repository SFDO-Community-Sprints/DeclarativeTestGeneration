/**
 * Created by chpifer on 10/18/2019.
 */

@IsTest
public with sharing class DeclarativeTestRunner {
    @IsTest
    /**
     * testRun1 - functionality example
     * Queries TestFlowRun metadata1, which is currently Test_Flow_Account_Update_Process_Builder
     * Functionality Tested: Process Builder sets Account.Phone to Contact.HomePhone when Account.Phone is changed
     * Flow description: Flow creates account, contact, edits Account.Phone to a know value
     * Flow Assertion: Contact.HomePhone = Known value.
     * Test class description: Query Metadata for flow name and runAs user, run flow as user, assert result='success'.
     */
    static void testRun1() {
        string runNumber = '1';

        string result; //variable that will record the result of the test flow
        string profileName; //variable to store run as profile
        string flowName;
        List<TestFlowRun__mdt> thisTestRun = [SELECT Id, Flow_Api_Name__c, Run_As_Profile__c FROM TestFlowRun__mdt WHERE Label =: runNumber LIMIT 1];
        if(thisTestRun.size() > 0){
            if(thisTestRun[0].Run_As_Profile__c == null){
                profileName = 'System Administrator';
            } else {
                profileName = thisTestRun[0].Run_As_Profile__c;
            }
            flowName = thisTestRun[0].Flow_Api_Name__c;
        }
        system.debug('Running ' + flowName);

        list<profile> testProfile = [SELECT Id FROM Profile WHERE Name =: profileName LIMIT 1];



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
            Flow.Interview testFlow = Flow.Interview.createInterview(flowName, nothing);

            //Check to ensure that the flow is found and if it is run it.
            if (testFlow != null){
                testFlow.start();
                result = (string)(testFlow.getVariableValue('result'));
            }

            system.assertEquals('Success', result);

        }

        Test.stopTest();
    }
    /**
     * testRun2 - example of a test failure
     * Queries testFlowRun metadata type record #2, which is currently set to TestOppSize_Amount1000_Medium
     * Tested functionality: When Opportunity Amount >= 1000, workflow sets opportunity size = medium.
     * Actual functionality: When Opportunity Amount > 1000, workflow sets opportunity size = medium.
     * Flow description: Insert Opportunity where amount = $1000
     * Flow assertion: Opportunity_Size__c = 'medium'
     * Actual result: Opportunity_Size__c = null - test will fail, result = 'Opportunity Size should be Medium'
     */

    @IsTest
    static void testRun2() {
        string runNumber = '2';

        string result; //variable that will record the result of the test flow
        string profileName; //variable to store run as profile
        string flowName;
        List<TestFlowRun__mdt> thisTestRun = [SELECT Id, Flow_Api_Name__c, Run_As_Profile__c FROM TestFlowRun__mdt WHERE Label =: runNumber LIMIT 1];
        if(thisTestRun.size() > 0){
            if(thisTestRun[0].Run_As_Profile__c == null){
                profileName = 'System Administrator';
            } else {
                profileName = thisTestRun[0].Run_As_Profile__c;
            }
            flowName = thisTestRun[0].Flow_Api_Name__c;
        }
        system.debug('Running ' + flowName);

        list<profile> testProfile = [SELECT Id FROM Profile WHERE Name =: profileName LIMIT 1];



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
            Flow.Interview testFlow = Flow.Interview.createInterview(flowName, nothing);

            //Check to ensure that the flow is found and if it is run it.
            if (testFlow != null){
                testFlow.start();
                result = (string)(testFlow.getVariableValue('result'));
            }

            system.assertEquals('Success', result);

        }

        Test.stopTest();
    }
    /**
     * testRun3 - additional test support
     * Queries testFlowRun metadata type record #3 through #50, which do not yet exist.
     * Calls a standardized helper class to process the metadata record.
     */
    @IsTest
    static void testRun3(){
        String result = testRunner('3');
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun4(){
        String result = testRunner('4');
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun5(){
        String result = testRunner('5');
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun6(){
        String result = testRunner('6');
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun7(){
        String result = testRunner('7');
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun8(){
        String result = testRunner('8');
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun9(){
        String result = testRunner('9');
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun10(){
        String result = testRunner('10');
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun11(){
        String result = testRunner('11');
        System.assertEquals('Success', result);
        Test.stopTest();
    }
    @IsTest
    static void testRun12(){
        String result = testRunner('12');
        System.assertEquals('Success', result);
        Test.stopTest();
    }


    /**
     * testRunner helper class
     *
     * @param runNumber
     *
     * @return
     */

    static string testRunner(String runNumber) {

        string result; //variable that will record the result of the test flow
        string profileName; //variable to store run as profile
        string flowName;
        List<TestFlowRun__mdt> thisTestRun = [SELECT Id, Flow_Api_Name__c, Run_As_Profile__c FROM TestFlowRun__mdt WHERE Label =: runNumber LIMIT 1];
        if(thisTestRun.size() > 0){
            if(thisTestRun[0].Run_As_Profile__c == null){
                profileName = 'System Administrator';
            } else {
                profileName = thisTestRun[0].Run_As_Profile__c;
            }
            flowName = thisTestRun[0].Flow_Api_Name__c;
            system.debug('Running ' + flowName);

            list<profile> testProfile = [SELECT Id FROM Profile WHERE Name =: profileName LIMIT 1];



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
                Flow.Interview testFlow = Flow.Interview.createInterview(flowName, nothing);

                //Check to ensure that the flow is found and if it is run it.
                if (testFlow != null){
                    testFlow.start();
                    result = (string)(testFlow.getVariableValue('result'));
                }

            }
        } else {
            Test.startTest();
            //No metadata found, assume no test to run here.
            System.debug('No flowTestRunner metadata found for run '+runNumber+', nothing to test.' +
                    'If you expected a test to run, check your metadata naming');
            result = 'Success';
        }

        return result;

    }

}