﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Global.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Comp229_Assign03.Student" %>

<asp:Content ID="Content2" ContentPlaceHolderID="contentplaceholder1" runat="server">
    <form id="form1" runat="server">
        <asp:Label ID="studentTitle" runat="server" Text="Student: "></asp:Label>
        <asp:GridView ID="GridView1"  runat="server"  AutoGenerateDeleteButton="True" OnRowDeleting="student_GridView_RowDeleting"  Onrowupdating="Student_GridView_RowUpdating" onrowupdated="Student_GridView_RowUpdated" onrowcancelingedit="StudentGridView_RowCancelingEdit"  onrowediting="StudentGridView_RowEditing"  AutoGenerateColumns="False" autogenerateeditbutton="true"  Height="156px" HorizontalAlign="Center" Width="910px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" >
            <Columns>
        
                <asp:BoundField DataField="StudentID" HeaderText="StudentID" InsertVisible="False" ReadOnly="True"  />
                <asp:BoundField DataField="LastName" HeaderText="LastName" />
                <asp:BoundField DataField="FirstMidName" HeaderText="FirstMidName" />
                <asp:BoundField DataField="CourseID" HeaderText="CourseID" ReadOnly="True" />
                <asp:BoundField DataField="Title" HeaderText="Title" ReadOnly="True"/>
                <asp:BoundField DataField="Credits" HeaderText="Credits" ReadOnly="True"/>
                     
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
    </form>
</asp:Content>
