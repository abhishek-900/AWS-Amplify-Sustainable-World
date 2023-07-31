// /* Amplify Params - DO NOT EDIT
// 	API_SUSTAINABLEWORLD_GRAPHQLAPIENDPOINTOUTPUT
// 	API_SUSTAINABLEWORLD_GRAPHQLAPIIDOUTPUT
// 	API_SUSTAINABLEWORLD_GRAPHQLAPIKEYOUTPUT
// 	API_SUSTAINABLEWORLD_USERDETAILTABLE_ARN
// 	API_SUSTAINABLEWORLD_USERDETAILTABLE_NAME
// 	AUTH_SUSTAINABLEWORLD9A1EB3E2_USERPOOLID
// 	ENV
// 	REGION
// Amplify Params - DO NOT EDIT */

// /**
//  * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
//  */

// import AWS from 'aws-sdk';

// const cognitoIdentityProvider = new AWS.CognitoIdentityServiceProvider();
// const dynamoDB = new AWS.DynamoDB.DocumentClient();

// const USER_POOL_ID = 'eu-north-1_IdPhnZXJj'; // Your Cognito User Pool ID
// const DYNAMODB_TABLE_NAME = 'UserDetail';

// export async function handler(event, context) {
//   const signUpEvent = event.arguments;
//   const username = signUpEvent.userName;
//   const email = signUpEvent.email;
//   const groupName = getGroupName(email);

//   if (groupName) {
//     await mapUserToGroup(username, groupName);
//     await saveUserDetailsToDynamoDB(username, email, groupName);
//   }

//   return null;
// }

// function getGroupName(email) {
//   return 'RECYCLER';
// }

// async function mapUserToGroup(username, groupName) {
//   const addUserToGroupParams = {
//     UserPoolId: USER_POOL_ID,
//     Username: username,
//     GroupName: groupName,
//   };

//   try {
//     await cognitoIdentityProvider.adminAddUserToGroup(addUserToGroupParams).promise();
//   } catch (error) {
//     console.error('Error mapping user to group:', error);
//     throw error;
//   }
// }

// async function saveUserDetailsToDynamoDB(username, email, groupName) {
//   const putItemParams = {
//     TableName: DYNAMODB_TABLE_NAME,
//     Item: {
//       email: email,
//       userType: groupName,
//     },
//   };

//   try {
//     await dynamoDB.put(putItemParams).promise();
//   } catch (error) {
//     console.error('Error saving user details to DynamoDB:', error);
//     throw error;
//   }
// }



const { handleSignUp } = require('./lambda-function');

// Simulate the event and context objects for testing locally
exports.handler = async (event, context) => {
  try {
    return await handleSignUp(event, context);
  } catch (error) {
    console.error('Error executing Lambda function:', error);
    throw error;
  }
};
