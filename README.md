# UberDrive Decentralized - Hardhat Project with Next.js

Welcome to the UberDrive Decentralized project! This repository contains the source code for a decentralized ride-sharing application built with Hardhat and Next.js. The primary focus is on the backend functionalities, including handling API calls, calculating ride prices, and implementing an escrow smart contract.

## Table of Contents

1. [Project Overview](#project-overview)
2. [Technologies Used](#technologies-used)
3. [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
4. [Project Structure](#project-structure)
5. [Usage](#usage)
6. [Smart Contracts](#smart-contracts)
    - [Escrow Contract](#escrow-contract)
7. [API Integration](#api-integration)
8. [Contributing](#contributing)
9. [License](#license)

## Project Overview

UberDrive Decentralized aims to create a blockchain-based ride-sharing application where users can book rides, and payments are handled securely through smart contracts. The application calculates ride prices based on distance and directions provided by Google Maps API.

## Technologies Used

- **Next.js**: A React framework for building server-side rendered and static web applications.
- **Hardhat**: A development environment for Ethereum smart contract development.
- **Solidity**: A programming language for writing smart contracts on the Ethereum blockchain.
- **Google Maps API**: For fetching directions and calculating distances between locations.
- **Web3.js**: A JavaScript library for interacting with Ethereum.

## Getting Started

### Prerequisites

- Node.js (v14 or higher)
- npm or yarn
- Hardhat CLI
- A Google Maps API key
- A MetaMask wallet or any Ethereum wallet

### Installation

1. **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/uber_drive.git
    cd uber_drive
    ```

2. **Install dependencies:**
    ```bash
    npm install
    ```

3. **Set up environment variables:**
    Create a `.env.local` file in the root directory and add your Google Maps API key:
    ```env
    NEXT_PUBLIC_GOOGLE_MAPS_API_KEY=your_google_maps_api_key
    ```

4. **Compile the smart contracts:**
    ```bash
    npx hardhat compile
    ```

## Project Structure

- `pages/`: Contains the Next.js pages for the application.
- `components/`: React components used throughout the application.
- `contracts/`: Solidity smart contracts.
- `scripts/`: Scripts for deploying and interacting with smart contracts.
- `utils/`: Utility functions including API handlers.
- `hardhat.config.js`: Hardhat configuration file.

## Usage

1. **Start the Next.js development server:**
    ```bash
    npm run dev
    ```

2. **Deploy the smart contracts:**
    ```bash
    npx hardhat run scripts/deploy.js --network your_network
    ```

3. **Interact with the application:**
    Open your browser and navigate to `http://localhost:3000`.

## Smart Contracts

### Escrow Contract

The escrow smart contract ensures secure payment handling between passengers and drivers. Funds are held in escrow until the ride is completed, at which point they are released to the driver.

**Key Functions:**
- `createEscrow(address passenger, address driver, uint amount)`: Initializes a new escrow.
- `completeRide(uint escrowId)`: Marks the ride as completed and releases funds.
- `cancelRide(uint escrowId)`: Cancels the ride and refunds the passenger.

## API Integration

The application integrates with the Google Maps API to fetch directions and calculate distances. The backend logic handles these API calls and computes the ride price based on the obtained data.

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Open a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
