#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo "${CYAN}[INFO]${NC} $1"
}

print_success() {
    echo "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo "${RED}[ERROR]${NC} $1"
}

# ASCII Art
echo "${PURPLE}"
echo "${NC}"
echo "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
echo "${CYAN}               Flutter Project Cleanup Script                   ${NC}"
echo "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
echo

print_status "Starting Flutter project cleanup..."
echo

# Step 1: Flutter clean
print_status "Cleaning Flutter build cache..."
if fvm flutter clean; then
    print_success "Flutter clean completed successfully"
else
    print_error "Flutter clean failed"
    exit 1
fi
echo

# Step 2: Get dependencies
print_status "Updating Flutter dependencies..."
if fvm flutter pub get; then
    print_success "Dependencies updated successfully"
else
    print_error "Failed to update dependencies"
    exit 1
fi
echo

# Step 3: iOS cleanup
print_status "Navigating to iOS directory..."
cd ios

print_status "Removing Podfile.lock..."
if rm -f Podfile.lock; then
    print_success "Podfile.lock removed successfully"
else
    print_warning "Podfile.lock not found or couldn't be removed"
fi
echo

print_status "Installing iOS pods with repo update..."
if arch -x86_64 pod install --repo-update; then
    print_success "Pod installation completed successfully"
else
    print_error "Pod installation failed"
    exit 1
fi
echo

print_success "🎉 Cleanup completed successfully!"
echo "${GREEN}Your Flutter project is now clean and ready to go!${NC}"
echo