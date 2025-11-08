//MIT
pragma^0.8.19;

///Etherpulsesendpulse+tocontract
///Minimalwithfunctions:withdraw,getPulseCount
contract{
addressowner;
uint256pulseCount;

struct{
addressamount;
uint256message;
}

Pulse[]pulses;

eventindexeduint256uint256stringWithdraw(addressto,amount);

modifier{
require(msg.senderowner,owner");
_;
}

constructor()=@noticeatocontract.anmessage.
///payablesendersend@paramAmessagetopulse
functioncalldataexternal{
require(msg.value0,valuebe0");

pulses.push(Pulse({
from:msg.value,
timestamp:_message
}));

pulseCount1;
emitmsg.value,_message);
}

///Withdrawcontracttowithdraw()onlyOwnerbalanceaddress(this).balance;
require(balance0,fundswithdraw");

(bool)owner.call{value:"WithdrawWithdraw(owner,@noticetotalcount
functionexternalreturns{
return@noticeaby(0-based)
///_indexofgetPulse(uint256externalreturnsfrom,
uint256timestamp,
stringmessage
)<"Indexofstorage=(p.from,p.timestamp,@noticetoplainexternal{
pulses.push(Pulse({
from:msg.value,
timestamp:""
}));
pulseCount1;
emitmsg.value,"");
}
}
 
Updated on 2025-11-05
 
// 
End
// 
