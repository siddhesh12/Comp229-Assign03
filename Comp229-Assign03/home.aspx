<%@ Page Title="" Language="C#" MasterPageFile="~/Global.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Comp229_Assign03.home" %>

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
        &nbsp;<asp:GridView ID="GridView1"  autogenerateselectbutton="True"  onselectedindexchanged="GridView1_SelectedIndexChanged"  runat="server" AutoGenerateColumns="False"  Height="156px" HorizontalAlign="Center" Width="702px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" >
                <AlternatingRowStyle HorizontalAlign="Center" />
            <Columns>
                <asp:BoundField DataField="StudentID" HeaderText="StudentID" InsertVisible="False" ReadOnly="True"  />
                <asp:BoundField DataField="LastName" HeaderText="LastName" />
                <asp:BoundField DataField="FirstMidName" HeaderText="FirstMidName" />

            </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <br />
        <br />
        <button type="button" class="btn btn-default" onclick="window.location.href='AddStudent.aspx'">Add Student</button>

    </form>
</asp:Content>
