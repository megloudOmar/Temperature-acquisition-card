using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO.Ports;

namespace temp_acqu_gui
{
    public partial class Form1 : Form
    {
        string threshold;
        string result;
        float result2;
        float threshold2;

        public Form1()
        {
            InitializeComponent();
        }

        private void btnMeasure_Click(object sender, EventArgs e)
        {
            serialPort1.Open();
            btnStop.Enabled = true;
            btnMeasure.Enabled = false;
            label5.Visible = true;
            display.Visible = true;

        }

        private void serialPort1_DataReceived(object sender, SerialDataReceivedEventArgs e)
        {
            System.Threading.Thread.Sleep(100);         // Temporisation
            result = serialPort1.ReadExisting();         // Récupérer les données reçus
            this.Invoke(new EventHandler(WriteData));   // Appler la fonction qui va afficher la température
        }
        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            threshold = textBox1.Text;
        }

        private void WriteData(object sender, EventArgs e)
        {
            display.Text = (result + "°C");             // Afficher la température reçue
            float.TryParse(result, out result2);
            float.TryParse(threshold, out threshold2);
            if (threshold2 < result2 && threshold2 != 0)
            {
                serialPort1.Write("a");
                label6.Visible = true;
            }
            else
            {
                label6.Visible = false;
            }
                
        }
        
        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void btnStop_Click(object sender, EventArgs e)
        {
            if (serialPort1.IsOpen)
            {
                serialPort1.Close();
                btnStop.Enabled = false;
                btnMeasure.Enabled = true;
                label5.Visible = false;
                display.Visible = false;

            }
        }

        // Fonction qui gère l'évènement de la fermeture de l'interface
        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            if (serialPort1.IsOpen)    // Vérifier si le port est ouvert
                serialPort1.Close();   // Fermer le port
        }


    }
}
