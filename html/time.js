// TimeAndDateDisplay-JRP JavaScript for NUI
// Handles dynamic time updates and animations in the client UI.
// Optimized with requestAnimationFrame for smooth performance.
// Powered by JGN Network - Mastering FiveM scripting!
// Join JRP Server for exciting roleplay. Visit JusticeRP.xyz.

// Reference to the display element.
const TimeAndDate = document.getElementById('TimeAndDate');

// Function to update the time display.
// Minimizes DOM manipulations for performance.
function updateTime() {
    // Get current date and time (though time is set via Lua, this could be used for local adjustments).
    const now = new Date();
    
    // Add a subtle scale animation on updates for visual appeal.
    if (TimeAndDate && TimeAndDate.innerText) {
        TimeAndDate.style.transform = 'scale(1.05)'; // Slight zoom effect.
        setTimeout(() => {
            TimeAndDate.style.transform = 'scale(1)'; // Reset after animation.
        }, 200);
    }
    
    // Use requestAnimationFrame for efficient, smooth updates.
    requestAnimationFrame(updateTime);
}

// Event listener for messages from the Lua client script.
// Updates the display when new time data is received.
window.addEventListener('message', (event) => {
    let data = event.data;
    // Check for the setTimeAndDate action.
    if (data.action == 'setTimeAndDate') {
        // Update the inner text with the formatted time string.
        TimeAndDate.innerText = data.time;
        if (data.debug) {
            console.log('Time updated:', data.time); // Debug log for troubleshooting.
        }
    }
});

// Start the update loop.
requestAnimationFrame(updateTime);

// Shameless Plug: Discover JGN Network for premium FiveM solutions and join JRP for thrilling adventures!