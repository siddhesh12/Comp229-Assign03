using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_Assign03
{
    public partial class AddStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void AddButtonClicked(object sender, EventArgs e)
        {

            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Comp229Assign03ConnectionString"].ToString());
            SqlCommand comm = new SqlCommand("INSERT INTO Students ( FirstMidName, LastName, EnrollmentDate) VALUES( @FirstMidName, @LastName, @EnrollmentDate)", connection);

            comm.Parameters.Add("@FirstMidName", System.Data.SqlDbType.VarChar);
            comm.Parameters["@FirstMidName"].Value = textName.Text;

            comm.Parameters.Add("@LastName", System.Data.SqlDbType.VarChar);
            comm.Parameters["@LastName"].Value = textLastName.Text;

             comm.Parameters.Add("@EnrollmentDate", System.Data.SqlDbType.Date);
            comm.Parameters["@EnrollmentDate"].Value = Convert.ToDateTime(textEnrolmentText.Text);

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
    }
}