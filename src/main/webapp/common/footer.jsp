<style>
    /* Styling for the footer */
    .footer-container {
        background: #2E3536; /* Background color for the footer */
        display: flex; /* Use flexbox layout */
        justify-content: center; /* Center content horizontally */
        align-items: center; /* Center content vertically */
        padding: 5px; /* Padding around the footer content */
        margin-top: 20px; /* Top margin */
        flex-direction: column; /* Align items in a column */
        width: 100%; /* Full width */
        position: fixed; /* Fixed positioning */
        bottom: 0; /* Positioned at the bottom */
        left: 0; /* Positioned at the left */
    }

    .email {
        margin-top: 10px; /* Adjust top margin for the email link */
        text-decoration: none; /* Remove underline from the link */
        color: #fff; /* Text color for the link */
        font-weight: bold; /* Bold font weight */
        padding: 8px 16px; /* Padding around the link */
        border-radius: 5px; /* Rounded border corners */
        border: 2px solid #fff; /* Border style */
        font-size: 75%; /* Font size */
        transition: background-color 0.3s ease; /* Transition effect for background */
    }

    .email:hover {
        background-color: #fff; /* Background color on hover */
        color: #2E3536; /* Text color on hover */
    }
</style>

<footer>
    <!-- Footer section -->
    <div class="footer-container">
        <!-- Email contact link -->
        <a class="email" href="mailto: adrianismu263@gmail.com">Contact Me</a>
    </div>
</footer>
