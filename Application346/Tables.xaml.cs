using System.Windows;
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
