contract MyContract {
    uint public myVar;

    event MyVarChanged(uint oldValue, uint newValue);

    constructor(uint _myVar) {
        myVar = _myVar;
    }

    function setMyVar(uint _myVar) public {
        emit MyVarChanged(myVar, _myVar);
        myVar = _myVar;
    }

    function getMyVar() public view returns (uint) {
        return myVar;
    }
}
