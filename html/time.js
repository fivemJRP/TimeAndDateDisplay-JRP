const TimeAndDate = document.getElementById('TimeAndDate')

function updateTime() {
    const now = new Date();  // Use client's local time
    // Apply timezone offset if configured (from config)
    const offset = 0;  // Placeholder, can be passed from Lua if needed
    now.setHours(now.getHours() + offset);

    // Minimize DOM manipulations by updating only changed elements
    // Add smooth animation for time changes
    const timeElement = document.getElementById('timeDisplay');
    timeElement.style.transform = 'scale(1.05)'; // Slight scale effect
    setTimeout(() => {
        timeElement.style.transform = 'scale(1)'; // Reset after animation
    }, 200);
    requestAnimationFrame(updateTime);  // Use requestAnimationFrame for smoother rendering
}

window.addEventListener('message', (event) => {
	let data = event.data
	if(data.action == 'setTimeAndDate') {
		TimeAndDate.innerText = data.time
	}
})

requestAnimationFrame(updateTime);