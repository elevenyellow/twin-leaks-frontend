String getProtocolUrl({required contractAddress, required chain}) {
  String _url = "https://etherscan.io/address/" + contractAddress;

  print(contractAddress);

  if (chain == "BSC") {
    _url = "https://bscscan.com/address/" + contractAddress;
  } else if (chain == "Polygon") {
    _url = "https://polygonscan.com/address/" + contractAddress;
  }

  return _url;
}
