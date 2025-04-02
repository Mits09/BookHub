<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%

if (request.getMethod().equalsIgnoreCase("POST")) {
    String id = request.getParameter("id");
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String genre = request.getParameter("genre");
    String description = request.getParameter("description");
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    try {
        String url = "jdbc:mysql://localhost:3306/bookhub?useSSL=false";
        String user = "root";
        String password = "W7301@jqir#";
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        
        String sql = "UPDATE books SET title=?, author=?, genre=?, description=? WHERE id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, author);
        pstmt.setString(3, genre);
        pstmt.setString(4, description);
        pstmt.setString(5, id);
        pstmt.executeUpdate();
        
        response.sendRedirect("Books.jsp");
        return;
        
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }
}


String id = request.getParameter("id");
String title = "";
String author = "";
String genre = "";
String description = "";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    String url = "jdbc:mysql://localhost:3306/bookhub?useSSL=false";
    String user = "root";
    String password = "W7301@jqir#";
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, password);
    
    String sql = "SELECT * FROM books WHERE id = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    rs = pstmt.executeQuery();
    
    if(rs.next()) {
        title = rs.getString("title");
        author = rs.getString("author");
        genre = rs.getString("genre");
        description = rs.getString("description");
    }
    
} catch(Exception e) {
    e.printStackTrace();
} finally {
    if(rs != null) rs.close();
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Book</title>
    <style>
        
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fb;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            width: 90%;
            max-width: 600px;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        label {
            display: block;
            margin-bottom: 5px;
            color: #6A1B9A;
        }
        
        input[type="text"], 
        textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        .submit-btn {
            background-color: #6A1B9A;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Book</h2>
        <form method="post">
            <input type="hidden" name="id" value="<%= id %>">
            
            <div class="form-group">
                <label>Title:</label>
                <input type="text" name="title" value="<%= title %>" required>
            </div>
            
            <div class="form-group">
                <label>Author:</label>
                <input type="text" name="author" value="<%= author %>" required>
            </div>
            
            <div class="form-group">
                <label>Genre:</label>
                <input type="text" name="genre" value="<%= genre %>">
            </div>
            
            <div class="form-group">
                <label>Description:</label>
                <textarea name="description" rows="4"><%= description %></textarea>
            </div>
            
            <button type="submit" class="submit-btn">Update Book</button>
            <a href="Books.jsp" style="margin-left: 10px;">Cancel</a>
        </form>
    </div>
</body>
</html>