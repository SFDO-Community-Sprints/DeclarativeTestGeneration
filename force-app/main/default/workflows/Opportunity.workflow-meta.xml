<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>FieldUpdateOppSize_Big</fullName>
        <field>Opportunity_Size__c</field>
        <literalValue>Big</literalValue>
        <name>FieldUpdateOppSize-Big</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FieldUpdateOppSize_Medium</fullName>
        <field>Opportunity_Size__c</field>
        <literalValue>Medium</literalValue>
        <name>FieldUpdateOppSize-Medium</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FieldUpdateOppSize_Small</fullName>
        <field>Opportunity_Size__c</field>
        <literalValue>Small</literalValue>
        <name>FieldUpdateOppSize-Small</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>UpdateOppSize-Big</fullName>
        <actions>
            <name>FieldUpdateOppSize_Big</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Amount  &gt;= 5000</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>UpdateOppSize-Medium</fullName>
        <actions>
            <name>FieldUpdateOppSize_Medium</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Amount  &gt; 1000 &amp;&amp; Amount &lt; 5000</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>UpdateOppSize-Small</fullName>
        <actions>
            <name>FieldUpdateOppSize_Small</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updating the Opportunity Size field based on the opp amount</description>
        <formula>Amount  &gt;= 0 &amp;&amp; Amount &lt; 1000</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
