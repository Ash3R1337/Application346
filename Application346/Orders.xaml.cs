using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using AHlibrary;

namespace Application346
{
    /// <summary>
    /// Логика взаимодействия для Orders.xaml
    /// </summary>
    public partial class Orders : Window
    {
        DBconnect dBconnect = new DBconnect();
        public Orders()
        {
            InitializeComponent();
            dBconnect.DB("watches", "клиенты", ClientsDataGrid, "root");
            dBconnect.FillCombobox(WatchesNameComboBox, "name", "часы");
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mw = new MainWindow();
            mw.Show();
            this.Close();
        }

        private void ClientFoundBtn_Click(object sender, RoutedEventArgs e)
        {
            dBconnect.TableSearch(ClientsDataGrid, ClientFoundTextBox.Text);
            if (ClientsDataGrid.Items.Count < 2)
                MessageBox.Show("Клиент не найден! Добавьте нового клиента.");
        }

        private void ClientSavedBtn_Click(object sender, RoutedEventArgs e)
        {
            dBconnect.SaveTable();
            MessageBox.Show("Новый клиент успешно добавлен");
        }
    }
}
