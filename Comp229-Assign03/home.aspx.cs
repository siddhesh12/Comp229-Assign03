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
    public partial class home : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                bindList();
            }
        }

        protected void addButtonClicked(object sender, EventArgs e)
        {

        }
        protected void bindList()
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Comp229Assign03ConnectionString"].ToString());
            
           // SqlConnection connection = new SqlConnection("Server=localhost\\SqlExpress;Database=Comp229Assign03ConnectionString;Integrated Security=True");
            SqlCommand comm = new SqlCommand("SELECT * FROM Students", connection);
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
    }
}