// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract UberDrive {
    mapping(address => mapping(address => Drive)) public drives;
    mapping(address => mapping(address => uint256)) public deposits;
    address public agent;

    event DriveBooked(address indexed driver, address indexed rider, uint price, bool isCompleted);
    event DriveCompleted(address indexed driver, address indexed rider, uint price, bool isCompleted);

    struct Drive {
        address driver;
        address rider;
        uint price;
        bool isCompleted;
    }

    modifier onlyAgent() {
        require(msg.sender == agent, "Not authorized");
        _;
    }

    constructor(address _rider, address _driver) payable {
        agent = msg.sender; // Set the agent to the contract deployer initially
        drives[_rider][_driver].rider = _rider;
        drives[_rider][_driver].driver = _driver;
    }

    function bookDrive(address _driver) public onlyAgent payable {
        require(_driver != msg.sender, "Driver and rider cannot be the same person");
        require(_driver != address(0), "No driver assigned to the ride");
        require(msg.sender != address(0), "No rider assigned to the ride");

        uint amount = msg.value;
        deposits[_driver][msg.sender] += amount;

        drives[msg.sender][_driver] = Drive({
            driver: _driver,
            rider: msg.sender,
            price: msg.value,
            isCompleted: false
        });

        emit DriveBooked(_driver, msg.sender, msg.value, false);
    }

    function completeDrive(address payable _driver) public onlyAgent {
        Drive storage drive = drives[msg.sender][_driver];
        uint256 payment = deposits[_driver][msg.sender];
        deposits[_driver][msg.sender] = 0;

        require(!drive.isCompleted, "Ride is already completed");
        require(msg.sender == drive.rider, "Only the rider can complete the drive");

        _driver.transfer(payment);
        drive.isCompleted = true;

        emit DriveCompleted(drive.driver, msg.sender, drive.price, true);
    }
}
