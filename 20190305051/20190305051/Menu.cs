using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _20190305051
{
    public partial class Menu : Form
    {
        public Menu()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Flights flights = new Flights();
            flights.Show();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Rezervations rezervations = new Rezervations();
            rezervations.Show();

        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Hide();
            Passengers passengers = new Passengers();
            passengers.Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
