var unirest = require("unirest");

var req = unirest("GET", "https://api.windy.com/api/webcams/v2/list/country=FR");



req.query({
	"lang": "en"
});

req.headers({
	"x-windy-key": "FijejgDuQIzg5LkORTpU51llgEd58Ifv",
	//"x-rapidapi-key": "442eeec4bamshf2dad67f709b582p19b762jsn84374ac914fe"
});


req.end(function (res) {
	if (res.error) throw new Error(res.error);

	console.log(JSON.stringify(res.body));
});

/*var req = unirest("GET", 
"https://webcamstravel.p.rapidapi.com/webcams/list/category=traffic/continent=europe/orderby=popularity/limit=20");

req.query({
	"lang": "fr"
});

req.headers({
	"x-rapidapi-host": "webcamstravel.p.rapidapi.com",
	"x-rapidapi-key": "442eeec4bamshf2dad67f709b582p19b762jsn84374ac914fe"
});


req.end(function (res) {
	if (res.error) throw new Error(res.error);

	console.log(res.body);
});*/