<%@ Page Title="" Language="C#" MasterPageFile="~/Global.Master" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="Comp229_Assign03.AddStudent" %>
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
  <label for="pwd">Enrollment date:</label>
               <asp:TextBox placeholder="yyyy/mm/dd"  class="form-control"  ID="textEnrolmentText" runat="server" />
</div>
            <asp:Button OnClick="AddButtonClicked" runat="server" Text="Add Student" />
    </form>

</asp:Content>
