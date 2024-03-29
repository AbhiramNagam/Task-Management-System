<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="views.TaskList" %>
<%@ page import="models.Task" %>
<html>
<head>
  <link rel="stylesheet" href="style.css">
<%--  <style>--%>
<%--    h1, h2, h3, p {--%>
<%--      text-align: center;--%>
<%--      color: white;--%>
<%--    }--%>

<%--    body {--%>
<%--      background-color: #323030;--%>
<%--    }--%>

<%--    table {--%>
<%--      color: white;--%>
<%--      border-radius: 10px;--%>
<%--      border: none;--%>
<%--      border-spacing: 0;--%>
<%--      /*border: 1px solid #ddd; !* Added border style *!*/--%>
<%--      margin-left: auto;--%>
<%--      margin-right: auto;--%>
<%--      border-collapse: separate;--%>
<%--      width: 80%;--%>
<%--      margin-bottom: 20px;--%>
<%--      background-color: dimgray;--%>
<%--    }--%>

<%--    th, td {--%>
<%--      border: none;--%>
<%--      border-collapse: separate;--%>
<%--      /*border-radius: 10px;*/--%>
<%--      box-shadow: 3px 13px 5px 0 rgba(0, 0, 0, 0.2);--%>
<%--      padding: 8px;--%>
<%--      text-align: left;--%>
<%--    }--%>
<%--    th {--%>
<%--      -moz-border-radius-topleft:10px;--%>
<%--      -moz-border-radius-topright:10px ;--%>
<%--      background-color: #009dff;--%>
<%--      color: #fff;--%>
<%--    }--%>

<%--    .task-form {--%>
<%--      display: none;--%>
<%--      width: 80%;--%>
<%--      margin: 10px auto 10px;--%>

<%--      padding: 20px;--%>
<%--      border-radius: 10px;--%>
<%--      background-color: #616161;--%>
<%--    }--%>

<%--    .form-row {--%>
<%--      display: flex;--%>
<%--      justify-content: space-between;--%>
<%--      align-items: center;--%>
<%--      margin-bottom: 15px;--%>
<%--    }--%>

<%--    label {--%>
<%--      flex: 1;--%>
<%--      margin-left: 10px;--%>
<%--      margin-right: 10px;--%>
<%--    }--%>

<%--    input[type="text"],--%>
<%--    textarea,--%>
<%--    select,--%>
<%--    select[type='option'],--%>
<%--    input[type="datetime-local"],--%>
<%--    button {--%>
<%--      color: black;--%>
<%--      flex: 2;--%>
<%--      padding: 8px;--%>
<%--      border-radius: 5px;--%>
<%--      border: 1px solid #ccc;--%>
<%--      margin: 0 10px;--%>
<%--      width: 10%;--%>
<%--      box-sizing: border-box;--%>
<%--    }--%>

<%--    button {--%>
<%--      background-color: #007bff;--%>
<%--      color: #fff;--%>
<%--      width: 10%;--%>
<%--        margin: auto;--%>
<%--      text-align: center;--%>
<%--      display: flex;--%>
<%--      justify-content: center;--%>
<%--      border: none;--%>
<%--      cursor: pointer;--%>
<%--      font-size: 14px;--%>
<%--      padding: 5px 10px;--%>
<%--    }--%>

<%--    button:hover {--%>
<%--      background-color: #0056b3;--%>
<%--    }--%>
<%--  </style>--%>
  <title>Task Management System</title>
</head>
<body>
<h1>Task Management System</h1>

<div>
  <h2>List of Pending Tasks</h2>
  <table>
    <tr>
      <th>Task</th>
      <th>Description</th>
      <th>Priority</th>
      <th>Due Date</th>
      <th>Status</th>
      <th>Delete</th>
    </tr>
    <%
      List<Task> tasks = TaskList.getPendingTasks();
      for (models.Task task : tasks) {
    %>
    <tr>
      <td><%= task.getName() %></td>
      <td><%= task.getDescription() %></td>
      <td><%= task.getPriority() %></td>
      <td><%= task.getDueDate() %></td>
      <td><a href="completeTask?taskId=<%= task.getId() %>">Mark as Completed</a></td>
      <td><a href="deleteTask?taskId=<%= task.getId() %>">Delete</a></td>
    </tr>
    <%
      }
    %>
  </table>
</div>

<div>
  <button onclick="showForm()" class="addTaskButton" id="addButton">Add Task</button>
  <div id="createForm" class="task-form">
    <form action="addTask" method="post">
<%--      <div class="form-row">--%>
        <label for="task-name">Task Name:</label>
        <input type="text" id="task-name" name="taskName" required>
        <br>
        <br>
        <label for="task-description">Task Description:</label>
        <textarea type="text" id="task-description" name="taskDescription"></textarea>

        <label for="task-priority">Task Priority:</label>
        <select id="task-priority" name="taskPriority">
          <option value="low">Low</option>
          <option value="medium">Medium</option>
          <option value="high">High</option>
        </select>
<%--      </div>--%>

<%--      <div class="form-row">--%>
        <label for="task-status">Task Status:</label>
        <select id="task-status" name="taskStatus">
          <option value="todo">To Do</option>
          <option value="in-progress">In Progress</option>
          <option value="completed">Completed</option>
        </select>

        <label for="task-due-date">Task Due Date:</label>
        <input type="datetime-local" id="task-due-date" name="taskDueDate" required>
<%--      </div>--%>

      <div class="form-row">
        <button type="submit" style="width: 10%" class="submit-btn">Submit</button>
      </div>
    </form>
  </div>
</div>



<script>
  function showForm() {
    const form = document.getElementById("createForm");
    if (form.style.display === "block") {
      form.style.display = "none";
      document.getElementById("addButton").innerHTML = "Add Task";
    } else {
      form.style.display = "block";
      document.getElementById("addButton").innerHTML = "Hide Form";
    }
  }
</script>
<%--Add link for viewTasks.jsp--%>
<center><a style="margin-top: 10%;" href="viewTasks.jsp">Completed Tasks</a></center>
<br>
<br>
</body>
</html>
