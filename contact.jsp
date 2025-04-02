<%@ page import="java.util.Objects" %>
<% 
    String status = (String) session.getAttribute("status");
    String message = (String) session.getAttribute("message");
    if (status != null && message != null) {
%>
    <div class="alert <%= status %>">
        <%= message %>
    </div>
<%
        session.removeAttribute("status");
        session.removeAttribute("message");
    }
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <style>
        body {
            font-family: 'Times New Roman', sans-serif;
            background: url('images/contactt.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #333;
        }

        .alert {
            padding: 12px 20px;
            margin: 0 auto 20px;
            border: 1px solid transparent;
            border-radius: 4px;
            width: 80%;
            max-width: 500px;
            font-size: 0.95em;
        }

        .alert.success {
            color: #3c763d;
            background-color: #dff0d8;
            border-color: #d6e9c6;
        }

        .alert.error {
            color: #a94442;
            background-color: #f2dede;
            border-color: #ebccd1;
        }

        .container {
            width: 80%;
            max-width: 600px;
            background-color: rgba(255, 255, 255, 0.95);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 25px;
            border-radius: 10px;
            text-align: center;
            margin: 20px;
        }

        h1 {
            color: #6A1B9A;
            font-size: 2.2em;
            margin-bottom: 15px;
        }

        h2 {
            color: #444;
            margin-bottom: 25px;
            font-size: 1.5em;
            font-weight: 400;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
        }

        label {
            font-size: 1em;
            margin-bottom: 8px;
            text-align: left;
            width: 90%;
            max-width: 500px;
            padding-left: 5px;
        }

        input[type="text"],
        input[type="email"],
        textarea {
            width: 90%;
            max-width: 500px;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 0.95em;
            outline: none;
            transition: border 0.3s;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        textarea:focus {
            border: 2px solid #6A1B9A;
        }

        textarea {
            resize: vertical;
            min-height: 120px;
            font-family: inherit;
        }

        input[type="submit"] {
            padding: 12px 30px;
            background-color: #6A1B9A;
            color: white;
            font-size: 1em;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
            width: 90%;
            max-width: 500px;
        }

        input[type="submit"]:hover {
            background-color: #9C27B0;
            transform: translateY(-2px);
        }

        .footer {
            margin-top: 25px;
            font-size: 0.85em;
            color: #666;
        }

        .footer a {
            color: #6A1B9A;
            text-decoration: none;
            font-weight: 500;
        }

        .footer a:hover {
            color: #9C27B0;
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            .container {
                width: 95%;
                padding: 20px;
            }
            
            h1 {
                font-size: 2em;
            }
            
            h2 {
                font-size: 1.3em;
            }
            
            input[type="submit"] {
                width: 95%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Contact Us</h1>
        <h2>We'd love to hear from you!</h2>

        <form action="ContactUsServlet" method="POST">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" required placeholder="Enter your name">

            <label for="email">Email</label>
            <input type="email" id="email" name="email" required placeholder="Enter your email">

            <label for="subject">Subject</label>
            <input type="text" id="subject" name="subject" required placeholder="Enter the subject">

            <label for="message">Message</label>
            <textarea id="message" name="message" required placeholder="Enter your message"></textarea>

            <input type="submit" value="Send Message">
        </form>

        <div class="footer">
            <p>For any queries, feel free to <a href="mailto:mitalideshmukh23@gmail.com">email us</a>.</p>
        </div>
    </div>
</body>
</html>