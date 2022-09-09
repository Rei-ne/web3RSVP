// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Web3RSVP {
    struct CreateEvent {
        bytes32 eventId;
        string eventDataCID; //reference to IPFS hash that has the details of the event
        address eventOwner;
        uint256 eventTimestamp;
        uint256 deposit;
        uint256 maxCapacity;
        bool paidOut;
        address[] confirmedRSVPs;
        address[] claimedRSVPs;
    }

    mapping(bytes32 => CreateEvent) public idToEvent;

    funtion createNewEvent(
        uint256 eventTimestamp,
        uint256 deposit,
        uint256 maxCapacity,
        string calldata eventDataCID
        ) external {
// generate an eventID based on other things passed in to generate a hash
        bytes32 eventId = keccak256(
            abi.encodePacked(
                msg.sender,
                address(this),
                eventTimestamp,
                deposit,
                maxCapacity
            )
        );



        address[] memory confirmedRSVPs;
        address[] memory claimedRSVPs;

    // this creates a new CreateEvent struct and adds it to the idToEvent mapping

        idToEvent[eventId] = CreateEvent(
            eventId,
            eventDataCID,
            msg.sender,
            eventTimestamp,
            deposit,
            maxCapacity,
            confirmedRSVPs,
            claimedRSVPs,
            false

        );
    // make sure this id isn't already claimed
    require(idToEvent[eventId].eventTimestamp == 0, "ALREADY REGISTERED");


}




    }



