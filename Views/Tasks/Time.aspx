﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<OpenLawOffice.WebClient.ViewModels.Timing.TimeViewModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Time Entries for Task
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Time Entries for Task<a id="pageInfo" class="btn-question" style="padding-left: 15px;">Help</a></h2>
    <% double totalMinutes = 0; %>
    <table class="listing_table">
        <tr>
            <th style="text-align: center;">
                Start
            </th>
            <th style="text-align: center;">
                Stop
            </th>
            <th style="text-align: center;">
                Duration
            </th>
            <th style="text-align: center;">
                Worker
            </th>
            <th style="width: 40px;">
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <% totalMinutes += item.Duration.TotalMinutes; %>
        <tr>
            <td>
                <%: item.Start %>
            </td>
            <td>
                <%: item.Stop %>
            </td>
            <td>
                <%: Math.Round(item.Duration.TotalMinutes, 0) %>
                min.
            </td>
            <td>
                <%: item.Worker.DisplayName %>
            </td>
            <td>
                <%: Html.ActionLink("Edit", "Edit", "Timing", new { id = item.Id.Value }, new { @class = "btn-edit", title = "Edit" })%>
                <%: Html.ActionLink("Details", "Details", "Timing", new { id = item.Id.Value }, new { @class = "btn-timeentry", title = "Time Entry" })%>
            </td>
        </tr>
        <% } %>
        <tr>
            <td colspan="2" style="text-align: right; font-weight: bold;">
                Total Time:
            </td>
            <td style="text-align: center; font-weight: bold;">
                <%: Math.Round(totalMinutes, 0) %>
                min.
            </td>
            <td colspan="2">
            </td>
        </tr>
    </table>

    <div id="pageInfoDialog" title="Help">
        <p>
        <span style="font-weight: bold; text-decoration: underline;">Info:</span>
        Time entries express durations of time spent on a particular task.  This page shows all the
        time entries for the tasks.<br /><br />
        <span style="font-weight: bold; text-decoration: underline;">Usage:</span> 
        Clicking the <img src="../../Content/fugue-icons-3.5.6/icons-shadowless/alarm-clock-select.png" /> (time entry icon) 
        will show the details of the time entry.  Click the 
        <img src="../../Content/fugue-icons-3.5.6/icons-shadowless/pencil.png" /> (edit icon) to make changes to the time entry.
        </p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MenuContent" runat="server">
    <li>Navigation</li>
    <ul style="list-style: none outside none; padding-left: 1em;">
        <li>
            <%: Html.ActionLink("New Entry", "SelectContactToAssign", "TaskTime", new { TaskId = RouteData.Values["Id"].ToString() }, null)%></li>
        <li>
            <%: Html.ActionLink("Task", "Details", "Tasks", new { Id = RouteData.Values["Id"].ToString() }, null)%></li>
    </ul>
</asp:Content>