<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<style>
    .header-container {
        background: #2E3536;
        padding: 20px;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }

    .logo {
        font: 1.5em "Fira Sans", sans-serif;
        margin-right: auto; /* Pushes the logo to the left */
    }

    .link {
        text-decoration: none;
        color: white;
        margin-left: 20px; /* Add spacing between links */
    }

    .register {
        display: flex;
        gap: 20px; /* Adjust the space between login/signup links */
    }

    @media screen and (max-width: 600px) {
        /* Media query for responsiveness */
        .link {
            margin-left: 10px; /* Reduce spacing between links on smaller screens */
        }

        .register {
            flex-wrap: wrap;
            gap: 10px; /* Adjust the space between login/signup links for smaller screens */
        }
    }
</style>

<header>
    <div class="header-container">
        <a class="link logo" href="RegisterUser"> Todo App </a>
        <div class="register">
            <c:choose>
                <c:when test="${userName != null}">
                    <a class="link" href="LogoutServlet"> Logout </a>
                </c:when>
                <c:otherwise>
                    <a class="link" href="LoginUser"> Login </a>
                    <a class="link" href="RegisterUser"> Signup </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</header>
