<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    
    if (request.getMethod().equalsIgnoreCase("POST") && "delete".equals(request.getParameter("action"))) {
        String id = request.getParameter("id");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            String url = "jdbc:mysql://localhost:3306/bookhub?useSSL=false";
            String user = "root";
            String password = "W7301@jqir#";

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            String sql = "DELETE FROM books WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.executeUpdate();

        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        }
        response.sendRedirect("Books.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookHub Library</title>
    <style>
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

     
        body {
            background: url('images/books.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #f5f5f5;
            text-align: center;
            padding: 20px;
        }

       
        .container {
            max-width: 900px;
            margin: auto;
            background: rgba(30, 30, 30, 0.9); 
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(255, 255, 255, 0.1);
        }

     
        h1 {
            font-size: 28px;
            color: #ffcc00;
            margin-bottom: 10px;
        }

        h2 {
            font-size: 22px;
            margin-bottom: 20px;
            color: #f5f5f5;
        }

       
        a.add-book {
            display: inline-block;
            text-decoration: none;
            color: #fff;
            background-color: #ff6600;
            padding: 10px 15px;
            border-radius: 5px;
            font-weight: bold;
            transition: background 0.3s;
        }

        a.add-book:hover {
            background-color: #e65c00;
        }

       
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: #252525;
            border-radius: 5px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #333;
            color: #ffcc00;
        }

        tr:nth-child(even) {
            background-color: #2a2a2a;
        }

        tr:nth-child(odd) {
            background-color: #1e1e1e;
        }

        .no-books {
            text-align: center;
            color: #aaa;
            font-style: italic;
        }

        
        .actions-form {
            display: flex;
            gap: 8px;
            justify-content: center;
        }

        .edit-btn, .delete-btn {
            display: inline-block;
            text-decoration: none;
            padding: 6px 12px;
            border-radius: 5px;
            font-size: 14px;
            font-weight: bold;
            transition: 0.3s;
        }

        .edit-btn {
            background-color: #4CAF50;
            color: white;
        }

        .edit-btn:hover {
            background-color: #45a049;
        }

        .delete-btn {
            background-color: #f44336;
            color: white;
            border: none;
            cursor: pointer;
        }

        .delete-btn:hover {
            background-color: #d32f2f;
        }

    </style>
</head>
<body>
    <div class="container">
        <h1> BookHub Library</h1>
        <h2>Available Books</h2>

        <a href="addbook.jsp" class="add-book"> Add a New Book</a>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Genre</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    String url = "jdbc:mysql://localhost:3306/bookhub?useSSL=false";
                    String user = "root";
                    String password = "W7301@jqir#";

                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, user, password);
                    stmt = conn.createStatement();

                    String sql = "SELECT * FROM books";
                    rs = stmt.executeQuery(sql);

                    boolean hasRecords = false;
                    while(rs.next()) {
                        hasRecords = true;
                %>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getString("title") %></td>
                            <td><%= rs.getString("author") %></td>
                            <td><%= rs.getString("genre") %></td>
                            <td><%= rs.getString("description") %></td>
                            <td>
                                <div class="actions-form">
                                    <a href="editbook.jsp?id=<%= rs.getInt("id") %>" class="edit-btn"> Edit</a>
                                    <form method="post" action="Books.jsp">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                                        <button type="submit" class="delete-btn" 
                                            onclick="return confirm('Are you sure you want to delete this book?')">
                                            Delete
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                <%
                    }
                    if(!hasRecords) {
                %>
                        <tr>
                            <td colspan="6" class="no-books">No books available</td>
                        </tr>
                <%
                    }
                } catch(Exception e) {
                    e.printStackTrace();
                } finally {
                    if(rs != null) rs.close();
                    if(stmt != null) stmt.close();
                    if(conn != null) conn.close();
                }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
