using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibraryManagement
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Class1 cx = new Class1();
                if (cx.mymethod().Equals(""))
                {
                    Linkbutton6.Visible = true;
                    Linkbutton7.Visible = true;

                    Linkbutton8.Visible = false;
                    Linkbutton9.Visible = false;

                    LinkButton1.Visible = true;
                    LinkButton10.Visible = false;
                    LinkButton11.Visible = false;
                    LinkButton12.Visible = false;
                    LinkButton2.Visible = false;
                    LinkButton3.Visible = false;
                }
                else if (Session["role"].Equals("user"))
                {
                    Linkbutton6.Visible = false;
                    Linkbutton7.Visible = false;

                    Linkbutton8.Visible = true;
                    Linkbutton9.Visible = true;
                    Linkbutton9.Text = "Hello " + Session["username"].ToString();

                    LinkButton1.Visible = true;
                    LinkButton10.Visible = false;
                    LinkButton11.Visible = false;
                    LinkButton12.Visible = false;
                    LinkButton2.Visible = false;
                    LinkButton3.Visible = false;
                }
                else if (Session["role"].Equals("admin"))
                {
                    Linkbutton6.Visible = false;
                    Linkbutton7.Visible = false;

                    Linkbutton8.Visible = true;
                    Linkbutton9.Visible = true;
                    Linkbutton9.Text = "Hello Admin";

                    LinkButton1.Visible = false; 
                    LinkButton10.Visible = true;
                    LinkButton11.Visible = true;
                    LinkButton12.Visible = true;
                    LinkButton2.Visible = true;
                    LinkButton3.Visible = true;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminAuthorManagemnet.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPublisherManagemnet.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminBookInventory.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminBookIssuing.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminMemberManagement.aspx");
        }

        protected void Linkbutton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserSignUp.aspx");
        }

        protected void Linkbutton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }

        protected void Linkbutton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewBooks.aspx");
        }

        protected void Linkbutton8_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            Linkbutton6.Visible = true;
            Linkbutton7.Visible = true;

            Linkbutton8.Visible = false;
            Linkbutton9.Visible = false;

            LinkButton1.Visible = true;
            LinkButton10.Visible = false;
            LinkButton11.Visible = false;
            LinkButton12.Visible = false;
            LinkButton2.Visible = false;
            LinkButton3.Visible = false;
            Response.Redirect("HomePage.aspx");
        }
        public class Class1
        {
            public string mymethod()
            {
                    if (HttpContext.Current.Session["role"] == null)
                        return string.Empty;
                    else
                        return (string)HttpContext.Current.Session["role"];
            }
        }
    }
}