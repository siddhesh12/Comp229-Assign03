<%@ Page Title="" Language="C#" MasterPageFile="~/Global.Master" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="Comp229_Assign03.AddStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #form1 {
            width: 942px;
            text-align: center;
            height: 333px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentplaceholder1" runat="server">
        <form id="form1" runat="server">

       <div class="form-group">
  <label for="usr">Name:</label>
           <asp:TextBox class="form-control" ID="textName" runat="server"/>

       </div>
<div class="form-group">
  <label for="pwd">Last Name:</label>
               <asp:TextBox class="form-control" ID="textLastName" runat="server"/>
</div>
    <div class="form-group">
  <label for="pwd">Enrolment date:</label>
               <asp:TextBox class="form-control" ID="textEnrolmentText" runat="server"/>
</div>
            <asp:Button OnClick="AddButtonClicked" runat="server" Text="Add Student" />
    </form>

</asp:Content>
