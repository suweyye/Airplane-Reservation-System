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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace _20190305051
{
    public partial class Flights : Form
    {
        public Flights()
        {
            InitializeComponent();
        }

        String ConnectionString = "Data Source=.;Initial Catalog=20190305051;Integrated Security=True";

        private void LoadAircraftModels()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();
                    string query = "SELECT ModelName FROM AircraftModels";
                    SqlCommand command = new SqlCommand(query, connection);
                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        string modelName = reader["ModelName"].ToString();
                        comboBox3.Items.Add(modelName);
                    }

                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR!:  " + ex.Message);
            }
        }

        private void LoadFlightInformation()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();
                    string query = "SELECT F.FlightID,A1.AirportName AS DepartureAirport,A2.AirportName AS ArrivalAirport,AM.ModelName AS AircraftModel,F.DepartureDate,F.ArrivalDate,F.SeatCount, COUNT(R.ReservationID) AS ReservationCount FROM Flights F INNER JOIN Airports A1 ON F.DepartureAirportID = A1.AirportID INNER JOIN Airports A2 ON F.ArrivalAirportID = A2.AirportID INNER JOIN AircraftModels AM ON F.ModelID = AM.ModelID LEFT JOIN Reservations R ON F.FlightID = R.FlightID GROUP BY F.FlightID, A1.AirportName, A2.AirportName, AM.ModelName, F.DepartureDate, F.ArrivalDate, F.SeatCount;";

                    SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                    DataTable flightTable = new DataTable();
                    adapter.Fill(flightTable);

                    dataGridView1.DataSource = flightTable;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR!:  " + ex.Message);
            }
        }

        private void LoadAirports()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();
                    string query = "SELECT AirportName FROM Airports";
                    SqlCommand command = new SqlCommand(query, connection);
                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        string airportName = reader["AirportName"].ToString();
                        
                        comboBox1.Items.Add(airportName);

                      
                        comboBox2.Items.Add(airportName);
                    }

                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR!:  " + ex.Message);
            }
        }




        private void Flights_Load(object sender, EventArgs e)
        {
            LoadFlightInformation();
            LoadAircraftModels();
            LoadAirports();




        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dateTimePicker3_ValueChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {


            if (dataGridView1.SelectedRows.Count > 0)
            {
                DataGridViewRow selectedRow = dataGridView1.SelectedRows[0];

                textBox1.Text = selectedRow.Cells["FlightID"].Value.ToString();
                comboBox1.SelectedItem = selectedRow.Cells["DepartureAirport"].Value.ToString();
                comboBox2.SelectedItem = selectedRow.Cells["ArrivalAirport"].Value.ToString();
                comboBox3.SelectedItem = selectedRow.Cells["AircraftModel"].Value.ToString();
                dateTimePicker1.Value = Convert.ToDateTime(selectedRow.Cells["DepartureDate"].Value.ToString());
                dateTimePicker2.Value = Convert.ToDateTime(selectedRow.Cells["ArrivalDate"].Value.ToString());
                textBox3.Text = selectedRow.Cells["SeatCount"].Value.ToString();
                label10.Text = selectedRow.Cells["ReservationCount"].Value.ToString();



            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();

                    string query = "UPDATE Flights SET FlightID=@Flight, DepartureAirportID = @DepartureAirportID, ArrivalAirportID = @ArrivalAirportID, ModelID = @ModelID, " +
                                   "DepartureDate = @DepartureDate, ArrivalDate = @ArrivalDate, SeatCount = @SeatCount WHERE FlightID = @FlightID";
                    DataGridViewRow selectedRow = dataGridView1.SelectedRows[0];

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Flight", textBox1.Text); 
                    command.Parameters.AddWithValue("@DepartureAirportID", comboBox1.SelectedIndex+1); 
                    command.Parameters.AddWithValue("@ArrivalAirportID", comboBox2.SelectedIndex+1); 
                    command.Parameters.AddWithValue("@ModelID", comboBox3.SelectedIndex+1); 
                    command.Parameters.AddWithValue("@DepartureDate", dateTimePicker1.Value); 
                    command.Parameters.AddWithValue("@ArrivalDate", dateTimePicker2.Value); 
                    command.Parameters.AddWithValue("@SeatCount", textBox3.Text); 
                    command.Parameters.AddWithValue("@FlightID", selectedRow.Cells["FlightID"].Value);

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        MessageBox.Show("Flight information updated");
                    }
                    else
                    {
                        MessageBox.Show("No flight found.");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR!:  " + ex.Message);

            }
            LoadFlightInformation();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();

                    

                  
                    string deleteReservationsQuery = "DELETE FROM Reservations WHERE FlightID = @FlightID";

                   
                    string deleteFlightQuery = "DELETE FROM Flights WHERE FlightID = @FlightID";

                    SqlCommand deleteReservationsCommand = new SqlCommand(deleteReservationsQuery, connection);
                    deleteReservationsCommand.Parameters.AddWithValue("@FlightID", textBox1.Text);

                    SqlCommand deleteFlightCommand = new SqlCommand(deleteFlightQuery, connection);
                    deleteFlightCommand.Parameters.AddWithValue("@FlightID", textBox1.Text);

                    SqlTransaction transaction = connection.BeginTransaction();
                    deleteReservationsCommand.Transaction = transaction;
                    deleteFlightCommand.Transaction = transaction;

                    try
                    {
                        deleteReservationsCommand.ExecuteNonQuery();

                       
                        int rowsAffected = deleteFlightCommand.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            MessageBox.Show("Flight and associated reservations have been successfully deleted.");
                            transaction.Commit();
                        }
                        else
                        {
                            MessageBox.Show("No flight found.");
                            transaction.Rollback();
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("ERROR!: " + ex.Message);
                        transaction.Rollback();
                    }
                }
            
            LoadFlightInformation();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();

                    
                    


                    string query = "INSERT INTO Flights (FlightID,DepartureAirportID, ArrivalAirportID, ModelID, DepartureDate, ArrivalDate, SeatCount) VALUES (@FlightID,@DepartureAirportID, @ArrivalAirportID, @ModelID, @DepartureDate, @ArrivalDate, @SeatCount)";

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@FlightID", textBox1.Text);
                    command.Parameters.AddWithValue("@DepartureAirportID", comboBox1.SelectedIndex+1);                    
                    command.Parameters.AddWithValue("@ArrivalAirportID", comboBox2.SelectedIndex + 1);
                    command.Parameters.AddWithValue("@ModelID", comboBox2.SelectedIndex + 1);
                    command.Parameters.AddWithValue("@DepartureDate", dateTimePicker1.Value);
                    command.Parameters.AddWithValue("@ArrivalDate", dateTimePicker2.Value);

                    command.Parameters.AddWithValue("@SeatCount", textBox3.Text);

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        MessageBox.Show("New flight successfully added.");
                    }
                    else
                    {
                        MessageBox.Show("An error occurred while adding a flight.");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR! " + ex.Message);
            }
            LoadFlightInformation();
        }

        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Hide();
            Menu menu = new Menu();
            menu.Show();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();
                    string query = "SELECT P.PassengerID,P.FirstName, P.LastName, P.Phone,P.Email FROM Passengers P INNER JOIN Reservations R ON P.PassengerID = R.PassengerID WHERE R.FlightID = @FlightID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@FlightID", textBox2.Text);

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable passengersTable = new DataTable();
                    adapter.Fill(passengersTable);

                    dataGridView1.DataSource = passengersTable;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR! " + ex.Message);
            }
        }
    }
}

