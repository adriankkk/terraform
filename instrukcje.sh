#local
PS C:\terraform\azterra\weatherapi> dotnet run
https://localhost:5001/weatherforecast

#docker
docker build -t binarythistle/weatherapi .
docker run -p 8080:80 binarythistle/weatherapi
http://localhost:8080/weatherforecast
docker push kuczuraa/weatherapi

#git
C:\terraform\azterra\weatherapi> git init
