using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_Assign03
{
    public partial class Course : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindList();
            }
        }

        protected void bindList()
        {

            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Comp229Assign03ConnectionString"].ToString());
            SqlCommand comm = new SqlCommand("select e.EnrollmentID, e.StudentID, e.CourseID, c.Title, e.Grade, s.FirstMidName from Enrollments e JOIN Students s on(e.StudentID = s.StudentID)  JOIN Courses c on(e.CourseID=c.CourseID) order by c.CourseID", connection);
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

        protected void course_GridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];

            string enrolmentid = row.Cells[1].Text;
            deleteEnrollment(enrolmentid);
        }

        protected void deleteEnrollment(string enrolmentID)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Comp229Assign03ConnectionString"].ToString());
            SqlCommand commEnrollment = new SqlCommand("delete from Enrollments WHERE EnrollmentID=@EnrollmentID", connection);

            commEnrollment.Parameters.Add("@EnrollmentID", System.Data.SqlDbType.Int);
            commEnrollment.Parameters["@EnrollmentID"].Value = Convert.ToInt32(enrolmentID);

            try
            {
                connection.Open();
                commEnrollment.ExecuteNonQuery();
                bindList();
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


    }
}