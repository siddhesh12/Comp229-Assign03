using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_Assign03
{
    public partial class Student : System.Web.UI.Page
    {
        protected Int32 courseID;
        protected int studentID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindList();
            }
        }

        protected void bindList()
        {
            studentID = Convert.ToInt32(Request.QueryString["Name"]);

            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Comp229Assign03ConnectionString"].ToString());
           SqlCommand comm = new SqlCommand("SELECT s.StudentID, s.LastName, s.FirstMidName, c.CourseID, c.Title, c.Credits FROM Students s JOIN Enrollments e on(s.StudentID = e.StudentID) JOIN Courses c ON(e.CourseID = c.CourseID)where s.StudentID = @StudentID", connection);
            comm.Parameters.Add("@StudentID", System.Data.SqlDbType.Int);
            comm.Parameters["@StudentID"].Value = studentID;
            try
            {
                connection.Open();
                SqlDataReader reader = comm.ExecuteReader();
                GridView1.DataSource = reader;
                GridView1.DataBind();
                reader.Close();
            }
            finally
            {
                connection.Close();
            }
        }

        
        protected void delete()
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Comp229Assign03ConnectionString"].ToString());
            SqlCommand commEnrollment = new SqlCommand("delete from Enrollments WHERE StudentID=@StudentID", connection);
            SqlCommand commStudent = new SqlCommand("delete from Students WHERE StudentID=@StudentID", connection);

            commEnrollment.Parameters.Add("@StudentID", System.Data.SqlDbType.Int);
            commEnrollment.Parameters["@StudentID"].Value = Convert.ToInt32(Request.QueryString["Name"]);

            commStudent.Parameters.Add("@StudentID", System.Data.SqlDbType.Int);
            commStudent.Parameters["@StudentID"].Value = Convert.ToInt32(Request.QueryString["Name"]);

            try
            {
                connection.Open();
                commEnrollment.ExecuteNonQuery();
                commStudent.ExecuteNonQuery();
                Response.Redirect("home.aspx");
            }   
            catch (Exception ex)
            {
                Response.Write("<script> alert('error: " + ex.Message + "'); </script>");
            }
            finally
            {
                connection.Close();
            }
        }
        protected void updateStudent(string lastName, string firstMidName)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Comp229Assign03ConnectionString"].ToString());
            SqlCommand comm = new SqlCommand("UPDATE Students SET FirstMidName=@FirstMidName, LastName=@LastName WHERE StudentID=@StudentID", connection);

            comm.Parameters.Add("@FirstMidName", System.Data.SqlDbType.VarChar);
            comm.Parameters["@FirstMidName"].Value = firstMidName;

            comm.Parameters.Add("@LastName", System.Data.SqlDbType.VarChar);
            comm.Parameters["@LastName"].Value = lastName;

            comm.Parameters.Add("@StudentID", System.Data.SqlDbType.Int);
            comm.Parameters["@StudentID"].Value = Convert.ToInt32(Request.QueryString["Name"]);
            

            try
            {
                connection.Open();
                comm.ExecuteNonQuery();
                Response.Redirect("home.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('error: " + ex.Message + "'); </script>");
            }
            finally
            {
                connection.Close();
            }
        }

        protected void TaskGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            //Bind data to the GridView control.
            bindList();
        }

        protected void StudentGridView_RowCancelingEdit(Object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            bindList();

        }
        protected void StudentGridView_RowEditing(Object sender, GridViewEditEventArgs e)
        {
            // The GridView control is entering edit mode. Clear the message label.
            GridView1.EditIndex = e.NewEditIndex;
            bindList();

        }
        protected void Student_GridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            
            string  lastName = ((TextBox)(row.Cells[2].Controls[0])).Text;
            string firstMidName = ((TextBox)(row.Cells[3].Controls[0])).Text;
            string courseTitle = row.Cells[5].Text;
            string courseCredits = row.Cells[6].Text;
            updateStudent(lastName, firstMidName);

            GridView1.EditIndex = -1;

        }
        protected void Student_GridView_RowUpdated(Object sender, GridViewUpdatedEventArgs e)
        {


            bindList();

            // Indicate whether the update operation succeeded.
            if (e.Exception == null)
            {
                Response.Write("<script>alert('Updated');</script>");
            }
            else
            {
                e.ExceptionHandled = true;
                Response.Write("<script>alert('failed');</script>");
            }

        }
        protected void student_GridView_RowDeleting (object sender, GridViewDeleteEventArgs e)
        {
            delete();
        }
    }
}