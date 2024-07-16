# Baseline Configuration Setup

## Overview
This repository contains scripts and configuration profiles designed to establish a baseline configuration for macOS devices. The goal is to enhance the end-user experience by ensuring devices are properly configured, secure, and equipped with essential applications.

## Baseline Configuration Details

### Initial Setup
An `InitialScript` is run during the initial setup to disable software updates temporarily. This ensures that updates do not interfere with the subsequent configuration and application installation process.

### Post User Login
After the user logs in, the baseline configuration script and essential applications are installed. This includes re-enabling software updates, renaming the computer, and customizing the Dock with important applications.

### 1. Enabling Software Updates
Ensures that all macOS devices are configured to automatically check for and install software updates. This keeps the devices secure and up-to-date with the latest features and patches.

### 2. Renaming the Mac
Standardizes the naming convention of macOS devices within the organization. This involves setting the computer name, local hostname, and hostname to a specified format for consistent device identification on the network.

### 3. Dock Customization
Customizes the Dock to include essential applications for all users, enhancing accessibility and user experience. The baseline configuration includes:
- Adding `RingCentral`
- Adding `Google Chrome`
- Removing `Mail`

## Configuration Profile (.mobileconfig)

### Creating the Configuration Profile
The configuration profile (`.mobileconfig`) is created and edited using [iMazing Profile Editor](https://imazing.com/profile-editor). 
