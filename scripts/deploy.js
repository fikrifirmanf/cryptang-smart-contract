async function main() {
    const Cryptang = await ethers.getContractFactory("Cryptang");
 
    // Start deployment, returning a promise that resolves to a contract object
    const cryptang = await Cryptang.deploy("Sini bayar utang!");
    console.log("Contract deployed to address:", cryptang.address);
 }
 
 main()
   .then(() => process.exit(0))
   .catch(error => {
     console.error(error);
     process.exit(1);
   });