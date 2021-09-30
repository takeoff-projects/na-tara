# go-pets
Prerequisites:
1. Need a Google Cloud Project created (project ID)
2. Create service account with access right: Owner, Datastore Editor.
3. Need to create a Service Account with access rights - Owner, Datastore Editor
4. Create and download a service account key to your local machine
5. Enter your project ID and path to your service account key whenever promoted


 
To run execute: ./start.sh 
To destroy execute: ./end.sh


For POST API that adds new record to DB use the following CURL command (you can update the field values):

curl -X POST -H "Content-Type: application/json"  -d '{"Added":"2021-09-28T10:02:04.274Z","Caption":"best cat ever","Email":"test5@mail.com","Image":"https://images.unsplash.com/photo-1555685812-4b943f1cb0eb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1740&q=80","Likes":500,"Owner":"Renaud","Petname":"Lyon"}' https://go-pets-app-edtahor7iq-lm.a.run.app/pets
