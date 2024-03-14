<%@ page import="views.TaskList" %>
<%@ page import="models.Task" %>
<%@ page import="java.util.List" %>
<html>
<head lang="en-IN">

    <title>View Completed Tasks!</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<h3>List of Completed Tasks</h3>
<table>
    <tr>
        <th>Task</th>
        <th>Description</th>
        <th>Priority</th>
        <th>Due Date</th>
        <th>Completed Date</th>
    </tr>
    <%
        List<Task> tasks
                = TaskList.getCompletedTasks();
        for (models.Task task : tasks) {
    %>
    <tr>
        <td><%= task.getName() %></td>
        <td><%= task.getDescription() %></td>
        <td><%= task.getPriority() %></td>
        <td><%= task.getDueDate() %></td>
        <td><%= task.getCompletedDate() %></td>
    </tr>
    <%
        }
    %>
</table>
<center><a style="margin-top: 10%;" href="index.jsp">Pending Tasks</a></center>
</body>
</html>