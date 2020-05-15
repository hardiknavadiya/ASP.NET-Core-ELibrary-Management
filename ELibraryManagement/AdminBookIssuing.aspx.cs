using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibraryManagement
{
    public partial class AdminBookIssuing : System.Web.UI.Page
    {
        private string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //go
            getNames();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {       
            //issue
            if (checkIfMemberExist() && checkIfbookExist())
            {
                if (checkIfEnryAlreadyExist())
                {
                    Response.Write("<script>alert('Book already issued to this Member');</script>");
                }
                else
                {
                    getNames();
                    bookissue();
                }
            }
            else
            {
                Response.Write("<script>alert('Wrong Book Id or Member Id');</script>");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //return
            if (checkIfMemberExist() && checkIfbookExist())
            {
                if (checkIfEnryAlreadyExist())
                {
                    getNames();
                    returnbook();
                }
                else
                {
                    Response.Write("<script>alert('Book entry is not exist');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Wrong Book Id or Member Id');</script>");
            }
        }

        void returnbook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE from book_issue_tbl WHERE member_id='" + TextBox1.Text.Trim() + "' AND book_id='" + TextBox2.Text.Trim() + "'", con);
                cmd.Parameters.AddWithValue("@author_id", TextBox2.Text.Trim());
                int result= cmd.ExecuteNonQuery();
                con.Close();
                if (result>0)
                {
                    con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    cmd = new SqlCommand("update  book_master_tbl set current_stock = current_stock+1 WHERE book_id='" + TextBox2.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Book Returned Successfully');</script>");
                    ClearText();
                    gridview.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Book is not issued');</script>");

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void bookissue()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO book_issue_tbl (member_id,member_name,book_id,book_name,issue_date,due_date) values(@a,@b,@c,@d,@e,@f)", con);
                cmd.Parameters.AddWithValue("@a", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@b", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@c", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@d", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@e", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@f", TextBox6.Text.Trim());
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("update  book_master_tbl set current_stock = current_stock-1 WHERE book_id='" + TextBox2.Text.Trim() + "'", con);
                cmd.ExecuteNonQuery();

                con.Close();
                Response.Write("<script>alert('Book issued Successfully');</script>");
                ClearText();
                gridview.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void ClearText()
        {
            TextBox2.Text = "";
            TextBox1.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
        }
        bool checkIfbookExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl where  book_id='" + TextBox2.Text.Trim() + "' AND current_stock >0", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        bool checkIfEnryAlreadyExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from book_issue_tbl where  member_id='" + TextBox1.Text.Trim() + "' AND book_id='" + TextBox2.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        bool checkIfMemberExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where  member_id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        void getNames()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT book_name from book_master_tbl where book_id='" + TextBox2.Text.Trim() + "';", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox4.Text = dr.GetValue(0).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid book id');</script>");
                }
                dr.Close();

                cmd = new SqlCommand("SELECT full_name from member_master_tbl where member_id='" + TextBox1.Text.Trim() + "';", con);
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox3.Text = dr.GetValue(0).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid member id');</script>");
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void gridview_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType==DataControlRowType.DataRow)
                {
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today=DateTime.Today;
                    ;
                    if (today> dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch (Exception exception)
            {
                Response.Write("<script> alert('"+exception.Message+"')</script>");
            }
        }
    }
}