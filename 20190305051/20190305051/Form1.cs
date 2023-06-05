using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace _20190305051
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=20190305051;Integrated Security=True");
        
        private void Form1_Load(object sender, EventArgs e)
        {


        }

        private void BtnLogin_Click(object sender, EventArgs e)
        {
            string ID = txtID.Text;
            string password = txtPassword.Text;

            string query = "SELECT COUNT(*) FROM Admin WHERE ID = @ID AND Password = @password";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@ID", ID);
            command.Parameters.AddWithValue("@password", password);

            try
            {
                con.Open();
                int kullaniciSayisi = (int)command.ExecuteScalar();

                if (kullaniciSayisi > 0)
                {
                    this.Hide();
                    Menu menu = new Menu();
                    menu.Show();
                    
                }
                else
                {
                    MessageBox.Show("Invalid username or password!");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR !:  " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
    }
}
