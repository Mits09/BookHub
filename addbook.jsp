<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add a Book</title>
    <style>
        body {
            font-family: 'Segoe UI', Times New Roman, sans-serif;
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), 
                        url('images/dark.png') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #444;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.97);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            padding: 2.5rem;
            border-radius: 12px;
            width: 90%;
            max-width: 450px;
            margin: 20px;
            transform: translateY(-20px);
            animation: slideUp 0.4s ease forwards;
        }

        @keyframes slideUp {
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        h1 {
            text-align: center;
            color: #6A1B9A;
            font-size: 2.2rem;
            margin-bottom: 2rem;
            letter-spacing: -0.5px;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            font-weight: 600;
            margin-bottom: 0.6rem;
            display: block;
            color: #555;
            font-size: 0.95rem;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 0.9rem;
            margin: 0.3rem 0 0.8rem 0;
            border: 2px solid #e0e0e0;
            border-radius: 6px;
            font-size: 0.95rem;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        input[type="text"]:focus,
        textarea:focus {
            outline: none;
            border-color: #9C27B0;
            box-shadow: 0 2px 8px rgba(156, 39, 176, 0.1);
        }

        textarea {
            resize: vertical;
            min-height: 120px;
            line-height: 1.5;
        }

        input[type="submit"] {
            width: 100%;
            padding: 1rem;
            background-color: #6A1B9A;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 0.5rem;
            letter-spacing: 0.5px;
        }

        input[type="submit"]:hover {
            background-color: #9C27B0;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(106, 27, 154, 0.3);
        }

        @media (max-width: 480px) {
            .container {
                padding: 1.8rem;
                max-width: 90%;
            }

            h1 {
                font-size: 2rem;
            }

            input[type="submit"] {
                padding: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add a New Book</h1>
        <form action="AddBookServlet" method="POST">
            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" required placeholder="Enter book title">
            </div>

            <div class="form-group">
                <label for="author">Author:</label>
                <input type="text" id="author" name="author" required placeholder="Enter author name">
            </div>

            <div class="form-group">
                <label for="genre">Genre:</label>
                <input type="text" id="genre" name="genre" required placeholder="Enter book genre">
            </div>

            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" required placeholder="Enter book description"></textarea>
            </div>

            <input type="submit" value="Add Book">
        </form>
    </div>
</body>
</html>