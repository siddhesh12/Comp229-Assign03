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
        &nbsp;<asp:GridView ID="GridView1"  autogenerateselectbutton="True"  onselectedindexchanged="GridView1_SelectedIndexChanged"  runat="server" AutoGenerateColumns="False"  Height="156px" HorizontalAlign="Center" Width="702px" CellPadding="4" ForeColor="#333333" GridLines="None" >
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="StudentID" HeaderText="StudentID" InsertVisible="False" ReadOnly="True"  />
                <asp:BoundField DataField="LastName" HeaderText="LastName" />
                <asp:BoundField DataField="FirstMidName" HeaderText="FirstMidName" />

            </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <br />
        <br />
        <button type="button" class="btn btn-default" onclick="window.location.href='AddStudent.aspx'">Add Student</button>

    </form>
</asp:Content>
