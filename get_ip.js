const fs = require('fs');

fs.readFile('./terraform.tfstate', 'utf8', (err, data) => {
    if (err) {
        console.log(`Error reading file from disk: ${err}`);
    } else {
        const tfstate = JSON.parse(data);
        console.log(tfstate.resources[0].instances[0].attributes.ipv4_address)
    }
});