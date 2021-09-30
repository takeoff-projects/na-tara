# go-pets
# Prerequisites:
1. Need a Google Cloud Project created (project ID)
2. Create service account with access right: Owner, Datastore Editor.
3. Need to create a Service Account with access rights - Owner, Datastore Editor
4. Create and download a service account key to your local machine
5. Enter your project ID and path to your service account key whenever promoted


 
To run execute: ./start.sh 
To destroy execute: ./end.sh


For POST API that adds new record to DB use the following CURL command (you can update the field values):

curl -X POST -H "Content-Type: application/json"  -d '{"Added":"2021-09-28T10:02:04.274Z","Caption":"best cat ever","Email":"test5@mail.com","Image":"https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fimages%2Fanimals%2Fkitten&psig=AOvVaw0DB2tLQeA2b9lWh41yVymy&ust=1633075823352000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCKDN1dSfpvMCFQAAAAAdAAAAABAP","Likes":500,"Owner":"Renaud","Petname":"Lyon"}' https://go-pets-app-edtahor7iq-lm.a.run.app/pets
