let Web3 = require("web3");
let web3 = new Web3(new Web3.providers.HttpProvider("http://127.0.0.1:7545")); 
web3.eth.getBalance("0xc82853c429D8813D53d0629322f3c091D21D46AD").then(console.log);
web3.eth.getBalance("0xc82853c429D8813D53d0629322f3c091D21D46AD").then(function(result) {console.log(web3.utils.fromWei(result,"ether"))});
web3.eth.sendTransaction({from: "0xc82853c429D8813D53d0629322f3c091D21D46AD", to: "0x907a142C421336654b7A71c747bd7656153A7175", value:web3.utils.toWei("1", "ether")});
