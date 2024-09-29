const AWS = require("aws-sdk");
const sqs = new AWS.SQS();

exports.handler = async (event) => {
  const record = event.Records[0];
  const bucketName = record.s3.bucket.name;
  const fileName = decodeURIComponent(record.s3.object.key.replace(/\+/g, " "));

  const message = {
    bucket: bucketName,
    file: fileName,
    type: "ac",
  };

  const params = {
    MessageBody: JSON.stringify(message),
    QueueUrl: process.env.SQS_QUEUE_URL,
  };

  try {
    await sqs.sendMessage(params).promise();
    console.log("Message sent to SQS");
    return { statusCode: 200, body: "Message sent to SQS" };
  } catch (error) {
    console.error("Error sending message to SQS:", error);
    return { statusCode: 500, body: "Error sending message to SQS" };
  }
};
