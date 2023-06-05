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
using System.Reflection.Emit;

namespace _20190305051
{
    public partial class Rezervations : Form
    {
        public Rezervations()
        {
            InitializeComponent();
        }
        String ConnectionString = "Data Source=.;Initial Catalog=20190305051;Integrated Security=True";


        private void button1_Click(object sender, EventArgs e)
        {
            string departureAirport = comboBox1.SelectedItem.ToString();
            string arrivalAirport = comboBox2.SelectedItem.ToString();
            DateTime startDate = dateTimePicker1.Value.Date;


            ShowFlights(departureAirport, arrivalAirport, startDate);
        }
        private void ShowFlights(string departureAirport, string arrivalAirport, DateTime startDate)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();

                    string query = "SELECT F.FlightID, A1.AirportName AS DepartureAirport, A2.AirportName AS ArrivalAirport, " +
                        "AM.ModelName AS AircraftModel, F.DepartureDate, F.ArrivalDate, F.SeatCount " +
                        "FROM Flights F " +
                        "INNER JOIN Airports A1 ON F.DepartureAirportID = A1.AirportID " +
                        "INNER JOIN Airports A2 ON F.ArrivalAirportID = A2.AirportID " +
                        "INNER JOIN AircraftModels AM ON F.ModelID = AM.ModelID " +
                        "WHERE A1.AirportName = @DepartureAirport AND A2.AirportName = @ArrivalAirport " +
                        "AND F.DepartureDate = @StartDate";

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@DepartureAirport", departureAirport);
                    command.Parameters.AddWithValue("@ArrivalAirport", arrivalAirport);
                    command.Parameters.AddWithValue("@StartDate", startDate);


                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable flightTable = new DataTable();
                    adapter.Fill(flightTable);

                    dataGridView1.DataSource = flightTable;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR!: " + ex.Message);
            }
        }
        private void ShowReservationsByPassengerId(int passengerId)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();

                    string query = "SELECT R.ReservationID,P.PassengerID, P.FirstName +' '+P.LastName AS Name,P.Phone, F.FlightID, F.DepartureDate " +
                        "FROM Reservations R " +
                        "INNER JOIN Flights F ON R.FlightID = F.FlightID " +
                        "INNER JOIN Passengers P ON R.PassengerID = P.PassengerID " +
                        "WHERE P.PassengerID = @PassengerID";

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@PassengerID", passengerId);

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable reservationTable = new DataTable();
                    adapter.Fill(reservationTable);

                    dataGridView1.DataSource = reservationTable;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR!: " + ex.Message);
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
                MessageBox.Show("ERROR!: " + ex.Message);
            }
        }
        private void Rezervations_Load(object sender, EventArgs e)
        {
            LoadAirports();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            this.Hide();
            Menu menu = new Menu();
            menu.Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();

                    string query = "SELECT R.ReservationID,P.PassengerID, P.FirstName+' '+P.LastName AS Name,P.Phone, F.FlightID, F.DepartureDate " +
                        "FROM Reservations R " +
                        "INNER JOIN Flights F ON R.FlightID = F.FlightID " +
                        "INNER JOIN Passengers P ON R.PassengerID = P.PassengerID";

                    SqlCommand command = new SqlCommand(query, connection);

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable reservationTable = new DataTable();
                    adapter.Fill(reservationTable);

                    dataGridView1.DataSource = reservationTable;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR!: " + ex.Message);
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            if (int.TryParse(textBox2.Text, out int passengerId))
            {
                ShowReservationsByPassengerId(passengerId);
            }
            else
            {
                MessageBox.Show("Enter a valid passenger ID.", "ERROR! ");
            }
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {

                bool hasColumn = dataGridView1.Columns.Cast<DataGridViewColumn>().Any(c => c.HeaderText.Equals("PassengerID"));
                DataGridViewRow selectedRow = dataGridView1.SelectedRows[0];
                if (hasColumn)
                {
                    textBox1.Text = selectedRow.Cells["PassengerID"].Value.ToString();
                    textBox4.Text = selectedRow.Cells["ReservationID"].Value.ToString();
                    textBox3.Text = selectedRow.Cells["FlightID"].Value.ToString();
                    

                }
                else
                {
                    textBox3.Text = selectedRow.Cells["FlightID"].Value.ToString();
                    label4.Text = selectedRow.Cells["SeatCount"].Value.ToString();
                }








            }
        }

        private void button2_Click(object sender, EventArgs e)
        {

            int selectedFlightID = Convert.ToInt32(textBox1.Text);
            

            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();

                   
                    string capacityQuery = "SELECT  F.SeatCount, COUNT(R.ReservationID) AS ReservationCount FROM Flights F  LEFT JOIN Reservations R ON F.FlightID = R.FlightID WHERE F.FlightID = @FlightID GROUP BY  F.SeatCount";
                    SqlCommand capacityCommand = new SqlCommand(capacityQuery, connection);
                    capacityCommand.Parameters.AddWithValue("@FlightID", selectedFlightID);
                    SqlDataReader reader = capacityCommand.ExecuteReader();

                    if (reader.Read())
                    {
                        DateTime date = DateTime.Now;
                        int seatCount = Convert.ToInt32(reader["SeatCount"]);
                        int resarvationCount = Convert.ToInt32(reader["ReservationCount"]);

                        reader.Close();
                        

                        if (seatCount > resarvationCount)
                        {
                            
                            string reservationQuery = "INSERT INTO Reservations (ReservationID, PassengerID,FlightID,ReservationDate) VALUES (@ReservationID, @PassengerID,@FlightID,@ReservationDate)";
                            SqlCommand reservationCommand = new SqlCommand(reservationQuery, connection);
                            reservationCommand.Parameters.AddWithValue("@ReservationID", textBox4.Text);
                            reservationCommand.Parameters.AddWithValue("@PassengerID", textBox1.Text);
                            reservationCommand.Parameters.AddWithValue("@FlightID", textBox3.Text);
                            reservationCommand.Parameters.AddWithValue("@ReservationDate", date);
                            reservationCommand.ExecuteNonQuery();

                            MessageBox.Show("Reservation made successfully");
                        }
                        else
                        {
                            MessageBox.Show("The flight you have selected does not have enough empty seats");
                        }
                    }
                    else
                    {
                        MessageBox.Show("The selected flight was not found");
                    }

                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR!: " + ex.Message);
            }
        }
    

        private void button4_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();                  

                   
                    string deleteReservationQuery = "DELETE FROM Reservations WHERE ReservationID = @ReservationID";

                   
                    using (SqlCommand command = new SqlCommand(deleteReservationQuery, connection))
                    {
                        command.Parameters.AddWithValue("@ReservationID", textBox4.Text);

                        
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            MessageBox.Show("Reservation successfully deleted.");
                        }
                        else
                        {
                            MessageBox.Show("The specified reservation was not found.");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR!: " + ex.Message);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();                  

                    
                    string updateReservationQuery = "UPDATE Reservations SET FlightID = @FlightID WHERE ReservationID = @ReservationID";

                    
                    using (SqlCommand command = new SqlCommand(updateReservationQuery, connection))
                    {
                        
                        command.Parameters.AddWithValue("@FlightID", textBox3.Text);
                        command.Parameters.AddWithValue("@ReservationID", textBox4.Text);



                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            MessageBox.Show("The reservation was successfully updated.");
                        }
                        else
                        {
                            MessageBox.Show("The specified reservation was not found.");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR!: " + ex.Message);
            }
        }
    }
}
