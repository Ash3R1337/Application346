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
    /// Логика взаимодействия для Tables.xaml
    /// </summary>
    public partial class Tables : Window
    {
        DBconnect dBconnect = new DBconnect();
        public Tables()
        {
            InitializeComponent();
            SelectTablesComboBox.Items.Add("Бренд");
            SelectTablesComboBox.Items.Add("Заявка");
            SelectTablesComboBox.Items.Add("Клиенты");
            SelectTablesComboBox.Items.Add("Корпус");
            SelectTablesComboBox.Items.Add("Пол");
            SelectTablesComboBox.Items.Add("Стиль");
            SelectTablesComboBox.Items.Add("Страна");
            SelectTablesComboBox.Items.Add("Часы");
            SelectTablesComboBox.Items.Add("users");
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mw = new MainWindow();
            mw.Show();
            this.Close();
        }

        private void TablesOpenBtn_Click(object sender, RoutedEventArgs e)
        {
            dBconnect.DB("watches", SelectTablesComboBox.Text.ToLower(), ClientsDataGrid, "root");
        }

        private void TablesSaveBtn_Click(object sender, RoutedEventArgs e)
        {
            dBconnect.SaveTable();
            MessageBox.Show("Таблица была успешно сохранена");
        }
    }
}
