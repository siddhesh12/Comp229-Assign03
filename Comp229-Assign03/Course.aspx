﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Global.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="Comp229_Assign03.Course" %>

   

<asp:Content ID="Content2" ContentPlaceHolderID="contentplaceholder1" runat="server">
    <form id="form1" runat="server">
            <asp:Label ID="Label1" runat="server" Text="Courses"></asp:Label>
        <asp:GridView ID="GridView1"  runat="server"  AutoGenerateDeleteButton="True" OnRowDeleting="course_GridView_RowDeleting"   AutoGenerateColumns="False"  Height="259px" HorizontalAlign="Center" Width="910px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" ForeColor="Black" CellSpacing="2" >
            <Columns>
        
                <asp:BoundField DataField="EnrollmentID" HeaderText="EnrollmentID" InsertVisible="False" ReadOnly="True"  />
                <asp:BoundField DataField="StudentID" HeaderText="StudentID" />
                <asp:BoundField DataField="CourseID" HeaderText="CourseID" />
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:BoundField DataField="Grade" HeaderText="Grade"/>
                <asp:BoundField DataField="FirstMidName" HeaderText="FirstMidName" />
                     
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>

    </form>
</asp:Content>
