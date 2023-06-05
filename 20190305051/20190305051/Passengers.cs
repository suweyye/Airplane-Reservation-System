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
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;
using System.Xml.Linq;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using System.Reflection.Emit;

namespace _20190305051
{
    public partial class Passengers : Form
    {
        public Passengers()
        {
            InitializeComponent();
        }

        String ConnectionString = "Data Source=.;Initial Catalog=20190305051;Integrated Security=True";

        private void LoadPassengers()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();

                    string query = "SELECT * FROM Passengers";

                    SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    dataGridView1.DataSource = dataTable;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR!:  " + ex.Message);
            }

        }
        private void Passengers_Load(object sender, EventArgs e)
        {
            LoadPassengers();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();
                    string query = "SELECT * FROM Passengers WHERE PassengerID = @PassengerID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@PassengerID", textBox6.Text);

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable passengerTable = new DataTable();
                    adapter.Fill(passengerTable);

                    dataGridView1.DataSource = passengerTable;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR!:  " + ex.Message);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO Passengers (PassengerID, FirstName, LastName, Email, Phone) VALUES (@PassengerID, @FirstName, @LastName, @Email, @Phone)";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@PassengerID", textBox1.Text);
                    command.Parameters.AddWithValue("@FirstName", textBox2.Text);
                    command.Parameters.AddWithValue("@LastName", textBox3.Text);
                    command.Parameters.AddWithValue("@Email", textBox4.Text);
                    command.Parameters.AddWithValue("@Phone", textBox5.Text);

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        MessageBox.Show("Passenger information added");
                    }
                    else
                    {
                        MessageBox.Show("Error adding passenger information");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR!:  " + ex.Message);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();
                    string query = "UPDATE Passengers SET FirstName = @FirstName, LastName = @LastName, Email = @Email, Phone=@Phone WHERE PassengerID = @PassengerID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@FirstName", textBox2.Text);
                    command.Parameters.AddWithValue("@LastName", textBox3.Text);                    
                    command.Parameters.AddWithValue("@Email", textBox4.Text);
                    command.Parameters.AddWithValue("@Phone", textBox5.Text);
                    command.Parameters.AddWithValue("@PassengerID", textBox1.Text);

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        MessageBox.Show("Passenger information has been successfully updated");
                    }
                    else
                    {
                        MessageBox.Show("An error occurred while updating passenger information");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR!:  " + ex.Message);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();
                    string query = "DELETE FROM Passengers WHERE PassengerID = @PassengerID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@PassengerID", textBox1.Text);

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        MessageBox.Show("Passenger information successfully deleted");
                    }
                    else
                    {
                        MessageBox.Show("An error occurred while deleting passenger information.");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR!:  " + ex.Message);
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Hide();
            Menu menu = new Menu();
            menu.Show();
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                DataGridViewRow selectedRow = dataGridView1.SelectedRows[0];

                textBox1.Text = selectedRow.Cells["PassengerID"].Value.ToString();
                textBox2.Text = selectedRow.Cells["FirstName"].Value.ToString();
                textBox3.Text = selectedRow.Cells["LastName"].Value.ToString();
                textBox4.Text = selectedRow.Cells["Email"].Value.ToString();
                textBox5.Text = selectedRow.Cells["Phone"].Value.ToString();




            }
        }
    }
}
