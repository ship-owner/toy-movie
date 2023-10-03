<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content />
        <meta name="author" content />
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/static/css/styles.css" type="text/css" rel="stylesheet" />
        <style>
            .login-container {
                background: #f6f5f7;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                font-family: 'Montserrat', sans-serif;
                height: 100%;
            }

            .login-container h1 {
                font-weight: bold;
                margin: 0;
            }

            .login-container h2 {
                text-align: center;
            }

            .login-container p {
                font-size: 14px;
                font-weight: 100;
                line-height: 20px;
                letter-spacing: 0.5px;
                margin: 20px 0 30px;
            }

            .login-container span {
                font-size: 12px;
            }

            .login-container a {
                color: #333;
                font-size: 14px;
                text-decoration: none;
                margin: 15px 0;
            }

            .login-container button {
                border-radius: 20px;
                border: 1px solid rgb(33, 37, 41);;
                background-color: rgb(33, 37, 41);;
                color: #FFFFFF;
                font-size: 12px;
                font-weight: bold;
                padding: 12px 45px;
                letter-spacing: 1px;
                text-transform: uppercase;
                transition: transform 80ms ease-in;
            }

            .login-container button:active {
                transform: scale(0.95);
            }

            .login-container button:focus {
                outline: none;
            }

            .login-container button.ghost {
                background-color: transparent;
                border-color: #FFFFFF;
            }

            .login-container form {
                background-color: #FFFFFF;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                padding: 0 50px;
                height: 100%;
                text-align: center;
            }

            .login-container input {
                background-color: #eee;
                border: none;
                padding: 12px 15px;
                margin: 8px 0;
                width: 100%;
            }

            .login-container .container {
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 14px 28px rgba(0,0,0,0.25),
                0 10px 10px rgba(0,0,0,0.22);
                position: relative;
                overflow: hidden;
                width: 768px;
                max-width: 100%;
                min-height: 550px;
                margin-top: 65px;
            }

            .login-container .form-container {
                position: absolute;
                top: 0;
                height: 100%;
                transition: all 0.6s ease-in-out;
            }

            .login-container .sign-in-container {
                left: 0;
                width: 50%;
                z-index: 2;
            }

            .login-container .container.right-panel-active .sign-in-container {
                transform: translateX(100%);
            }

            .login-container .sign-up-container {
                left: 0;
                width: 50%;
                opacity: 0;
                z-index: 1;
            }

            .login-container .container.right-panel-active .sign-up-container {
                transform: translateX(100%);
                opacity: 1;
                z-index: 5;
                animation: show 0.6s;
            }

            @keyframes show {
                0%, 49.99% {
                    opacity: 0;
                    z-index: 1;
                }

                50%, 100% {
                    opacity: 1;
                    z-index: 5;
                }
            }

            .login-container .overlay-container {
                position: absolute;
                top: 0;
                left: 50%;
                width: 50%;
                height: 100%;
                overflow: hidden;
                transition: transform 0.6s ease-in-out;
                z-index: 100;
            }

            .login-container .container.right-panel-active .overlay-container{
                transform: translateX(-100%);
            }

            .login-container .overlay {
                background: #FF416C;
                background: -webkit-linear-gradient(to right, rgb(33, 37, 41), rgb(33, 37, 41));
                background: linear-gradient(to right, rgb(33, 37, 41), rgb(33, 37, 41));
                background-repeat: no-repeat;
                background-size: cover;
                background-position: 0 0;
                color: #FFFFFF;
                position: relative;
                left: -100%;
                height: 100%;
                width: 200%;
                transform: translateX(0);
                transition: transform 0.6s ease-in-out;
            }

            .login-container .container.right-panel-active .overlay {
                transform: translateX(50%);
            }

            .login-container .overlay-panel {
                position: absolute;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                padding: 0 40px;
                text-align: center;
                top: 0;
                height: 100%;
                width: 50%;
                transform: translateX(0);
                transition: transform 0.6s ease-in-out;
                background-color: rgb(33, 37, 41);

            }

            .login-container .overlay-left {
                transform: translateX(-20%);
            }

            .login-container .container.right-panel-active .overlay-left {
                transform: translateX(0);
            }

            .login-container .overlay-right {
                right: 0;
                transform: translateX(0);
            }

            .login-container .container.right-panel-active .overlay-right {
                transform: translateX(20%);
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <div class="container" id="container">
                <div class="form-container sign-up-container">
                    <form id="signupForm">
                        <h1>Create Account</h1>
                        <span>or use your email for registration</span>
                        <input name="email" type="email" placeholder="Email" />
                        <input name="name" type="text" placeholder="Name" />
                        <input name="password" type="password" placeholder="Password" />
                        <button type="button" onclick="signUp();">Sign Up</button>
                    </form>
                </div>
                <div class="form-container sign-in-container">
                    <form id="loginForm">
                        <h1>Login</h1>
                        <span>or use your account</span>
                        <input name="email" type="email" placeholder="Email" />
                        <input name="password" type="password" placeholder="Password" />
                        <button type="button" onclick="login();">Login</button>
                    </form>
                </div>
                <div class="overlay-container">
                    <div class="overlay">
                        <div class="overlay-panel overlay-left">
                            <h1>Welcome Back!</h1>
                            <p>Already have an Account?</p>
                            <button class="ghost" id="signIn">Sign In</button>
                        </div>
                        <div class="overlay-panel overlay-right">
                            <h1>Hello, Friend!</h1>
                            <p>Don't have an account?</p>
                            <button class="ghost" id="signUp">Sign Up</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Core theme JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const signUpButton = document.getElementById('signUp');
        const signInButton = document.getElementById('signIn');
        const container = document.getElementById('container');

        signUpButton.addEventListener('click', () => {
            container.classList.add("right-panel-active");
        });

        signInButton.addEventListener('click', () => {
            container.classList.remove("right-panel-active");
        });

        function signUp(){
            $.ajax({
                type: "POST",
                url: "/user/signup",
                data: $("#signupForm").serialize(),
                success: function () {
                    container.classList.remove("right-panel-active");
                    alert("회원가입 완료")
                },
                error: function () {
                    alert("회원가입 실패")
                },
                complete : function()
                {
                    $("#signupForm")[0].reset();
                }
            });
        }

        function login(){
            $.ajax({
                type: "POST",
                url: "/user/login",
                data: $("#loginForm").serialize(),
                success: function () {
                    window.location.href = "/movie/index";
                },
                error: function () {
                    alert("로그인 실패");
                    $("#loginForm")[0].reset();
                },
            });
        }
    </script>
    </body>
</html>
