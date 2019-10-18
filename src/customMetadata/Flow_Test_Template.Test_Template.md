<?xml version="1.0" encoding="UTF-8"?>
<CustomMetadata xmlns="http://soap.sforce.com/2006/04/metadata" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <label>Test_Template</label>
    <protected>false</protected>
    <values>
        <field>Template__c</field>
        <value xsi:type="xsd:string">/*--
----This class was created automatically as part of the dynamic test generation tool
----The method name corresponds to the name of an autolaunch flow and the class name
----corresponds to the name of a custom metadata type record. The information below
----including created date and created by was also automatically generated
----Created By:   **CREATEDBY**
----Created Date: **CREATEDDATE** 
--*/

@IsTest
public class **CLASSNAME**{
    @IsTest
    static void **FLOWNAME**() {
    
        string result; //variable that will record the result of the test flow
        string profileName = &apos;**PROFILE**&apos;; //the profile that will be assigned to the test user if applicable. Defaults to Admin.
        
        list&lt;profile&gt; testProfile = [SELECT Id FROM Profile WHERE Name =: profileName LIMIT 1];
        
        //if no matching profile is found, use the system administrator profile.
        if(testProfile.size() == 0){
            testProfile = [SELECT Id FROM Profile WHERE Name =: &apos;System Administrator&apos; LIMIT 1];
        }
        
        //create and insert the test user to run the flow test as
        user testUser = new User(Alias = &apos;FlowT&apos;, Email= &apos;test&apos; + &apos;Test@test.com&apos;, 
                                 EmailEncodingKey=&apos;UTF-8&apos;, LastName=&apos;test&apos;, 
                                 LanguageLocaleKey=&apos;en_US&apos;, LocaleSidKey=&apos;en_US&apos;, 
                                 ProfileId = testProfile[0].Id, TimeZoneSidKey=&apos;America/Los_Angeles&apos;, 
                                 UserName= &apos;test3452345&apos; + &apos;Test@test.com&apos;);
                                 
    
        //start the test
        
        Map&lt;String, Object&gt; nothing = new Map&lt;String, Object&gt;();
        Test.startTest();
        
        //run the test as a test user with the chosen profile
        System.runAs(testUser){
            Flow.Interview testFlow = Flow.Interview.createInterview(&apos;**FLOWNAME**&apos;, nothing);
            
            //Check to ensure that the flow is found and if it is run it.
            if (testFlow != null){
                testFlow.start();
                result = (string)(testFlow.getVariableValue(&apos;result&apos;));
            }
            
            system.assertEquals(&apos;Success&apos;, result);        
        }
        
        Test.stopTest();
    }
}</value>
    </values>
</CustomMetadata>
