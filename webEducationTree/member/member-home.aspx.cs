﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using webEducationTree.utility;

namespace webEducationTree.member
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckCookies();
            if (!IsPostBack)
            {
                error.Visible = false;
                success.Visible = false;
            }
        }
        static String member_id = "";
        private void CheckCookies()
        {
            HttpCookie myCookie = Request.Cookies["MemberCookie"];
            if (myCookie == null)
            {
                Response.Redirect("../logout.aspx");
            }
            else
            {
                member_name.InnerHtml = myCookie["memberName"].ToString();
                member_id = myCookie["memberId"].ToString();
            }
        }
        protected void drdCollegeType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = DBConnection.GetDataTable("Select * from college where (college_type='" + drdCollegeType.SelectedItem.ToString() + "')");
                drdCollegeName.DataSource = dt;

                drdCollegeName.DataValueField = "college_id";
                drdCollegeName.DataTextField = "college_name";
                drdCollegeName.DataBind();
            }
            catch (Exception)
            {

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = DBConnection.GetDataTable("Select * from view_search_member where (college_id=" + drdCollegeName.SelectedValue + " and year_of_passing='"+txtYearPassing.Text+"') ");
                dataGeneral.DataSource = dt;
                dataGeneral.DataBind();

            }
            catch (Exception)
            {
            }
        }

        protected void dataGeneral_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName=="view")
            {
                Response.Redirect("search-result.aspx?mem_id="+e.CommandArgument.ToString());
            }
        }
    }
}