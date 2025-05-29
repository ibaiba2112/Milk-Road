// FOR DARK MODE ROUTES //
// Selecting body for dark mode and toggling the class
function darkMode(){
    let body = document.body; // Selects the body in the html document
    body.classList.toggle("dark-mode") // toggles the dark mode class in dark_mode.css
}
// Linking the icon in html to JS and then enable a toggle method for the icon (light/dark mode)
function toggleIcon() {
    const iconContainer = document.getElementById('toggle-icon');
    iconContainer.classList.toggle('toggle-on');
}



// FOR WALLET ROUTES //
// For Changing arrow direction for the currency exchange button
function exchangeToggle() {
    const exchangeIconContainer = document.getElementById('exchange-toggle-icon') // Finds the container in wallet.html with all the icons inside it
    exchangeIconContainer.classList.toggle('toggle') // runs the toggle method to change the arro direction
    console.log('exchange function toggled!') // DEBUG
}