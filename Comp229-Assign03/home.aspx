<%@ Page Title="" Language="C#" MasterPageFile="~/Global.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Comp229_Assign03.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #form1 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    
            <div>
                <asp:ImageButton ID="s" runat="server" ImageUrl="~/Assets/banner.jpg" Width="100%" />
           </div>
       
    <%-- %><asp:DataList ID="studentsList" runat="server" >
        <ItemTemplate>
        Student ID:<strong><%#Eval("StudentID") %></strong><br /><asp:Literal ID="extraDetailsLiteral" runat ="server" EnableViewState="false" />
         </ItemTemplate>
    </asp:DataList>
        --%>
        
        <label padding-top: 50px;">
            <br />
            <br />
            Student List</label>
        &nbsp;<asp:GridView ID="GridView1"  autogenerateselectbutton="True" selectedindex="1" onselectedindexchanged="GridView1_SelectedIndexChanged"  runat="server" AutoGenerateColumns="False"  Height="156px" HorizontalAlign="Center" Width="276px" >
            <Columns>
                <asp:BoundField DataField="StudentID" HeaderText="StudentID" InsertVisible="False" ReadOnly="True"  />
                <asp:BoundField DataField="LastName" HeaderText="LastName" />
                <asp:BoundField DataField="FirstMidName" HeaderText="FirstMidName" />

            </Columns>
        </asp:GridView>
        <br />
        <br />
        <button type="button" class="btn btn-default" onclick="window.location.href='AddStudent.aspx'">Add Student</button>

    </form>
</asp:Content>
