const AWS = require('aws-sdk');
const date = require('date-and-time');

const cognitoIdentityProvider = new AWS.CognitoIdentityServiceProvider();
const dynamoDB = new AWS.DynamoDB.DocumentClient();

const USER_POOL_ID = 'eu-north-1_IdPhnZXJj'; // Your Cognito User Pool ID
const DYNAMODB_TABLE_NAME = 'UserDetail-sk4s3it2fbfujl4hpfr2iq7ify-staging';

function getGroupName(userRole) {
  if(userRole == 'RECYCLER')
     return 'RECYCLER';
  return 'DISPOSER';
}

function getCurrentTimestampInSeconds() {
    const currentDate = new Date();
    const timestampInSeconds = Math.floor(currentDate.getTime() / 1000);
    return timestampInSeconds;
  }

async function mapUserToGroup(username, groupName) {
  const addUserToGroupParams = {
    UserPoolId: USER_POOL_ID,
    Username: username,
    GroupName: groupName,
  };

  try {
    await cognitoIdentityProvider.adminAddUserToGroup(addUserToGroupParams).promise();
  } catch (error) {
    console.error('Error mapping user to group:', error);
    throw error;
  }
}

async function saveUserDetailsToDynamoDB(username, email, groupName, firstName, lastName, companyAddress, companyAddress) {

  const currentDate = new Date().toISOString();

  const putItemParams = {
    TableName: DYNAMODB_TABLE_NAME,
    Item: {
      id: username,
      email: email,
      userType: groupName,
      firstName: firstName,
      lastName : lastName,
      companyAddress: companyAddress,
      companyName: companyName,
      _version: 2, // A version field, if you want to track item versions
      _lastChangedAt: getCurrentTimestampInSeconds(), // A timestamp indicating when the item was last changed
      createdAt: currentDate, // A timestamp indicating when the item was created
      updatedAt: currentDate, // A t 2023-07-28T18:29:03.068Z
    },
  };

  try {
    await dynamoDB.put(putItemParams).promise();
  } catch (error) {
    console.error('Error saving user details to DynamoDB:', error);
    throw error;
  }
}

module.exports = {
  handleSignUp: async (event, context) => {
    if (
        event.request.userAttributes.email
        && event.triggerSource === "PostConfirmation_ConfirmSignUp"){
    const { userName, request } = event;

 
    const userAttributes = request?.userAttributes;
    
    // Assuming you have the user's email in the request.userAttributes object
    const email = request?.userAttributes?.email || '';
  
    const userRole = userAttributes['custom:userRole'] || '';
    const firstName = userAttributes['custom:firstName'] || '';
    const lastName = userAttributes['custom:lastName'] || '';
    const companyAddress = userAttributes['custom:companyAddress'] || '';
    const companyName = userAttributes['custom:companyName'] || '';
    
    console.log('%s', event);
    console.log('Username %s', userName);
    console.log('request %o', request);
    console.log('userAttributes %o', userAttributes);


    console.log('User Role: %s', userRole);
    console.log('First Name: %s', firstName);
    console.log('Last Name: %s', lastName);
    console.log('Company Address: %s', companyAddress);
    console.log('Company Name: %s', companyName);
    const groupName = getGroupName(userRole);
   
    if (groupName) {
      await mapUserToGroup(userName, groupName);
      await saveUserDetailsToDynamoDB(userName, email, groupName,firstName,lastName,companyAddress,companyAddress);
    }
   }

    return null;
  },
};
