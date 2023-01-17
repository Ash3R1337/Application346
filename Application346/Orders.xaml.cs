using System;
using System.Data;
using System.Text.RegularExpressions;
using System.Windows;
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

        int id_client;
        int id_product;
        int total;
        int amount;

        //Найти клиента в таблице
        private void ClientFoundBtn_Click(object sender, RoutedEventArgs e)
        {
            dBconnect.TableSearch(ClientsDataGrid, "клиенты", "surname", ClientFoundTextBox.Text);
            if (ClientsDataGrid.Items.Count < 2)
                MessageBox.Show("Клиент не найден! Добавьте нового клиента.");
        }

        //Сохранение таблицы с клиентами
        private void ClientSavedBtn_Click(object sender, RoutedEventArgs e)
        {
            dBconnect.SaveTable();
            MessageBox.Show("Изменения успешно внесены");
        }

        //Оформление заявки
        private void ConfirmBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (SurnameTextBox.Text.Length > 1)
                {
                    amount = Convert.ToInt32(AmountTextBox.Text);
                    total = Convert.ToInt32(WatchesSumTextBox.Text);
                    id_product = Convert.ToInt32(dBconnect.GetValueByString("часы", "name", "id_product", WatchesNameComboBox.Text));
                    id_client = Convert.ToInt32(dBconnect.GetValueByString("клиенты", "surname", "id_client", SurnameTextBox.Text));
                    //MessageBox.Show($"{amount} {total} {id_product} {id_client}");
                    dBconnect.AddValues("заявка", id_client, id_product, total, amount);
                    MessageBox.Show("Заявка успешно оформлена");
                }
                else
                {
                    MessageBox.Show("Клиент не выбран");
                }
            }
            catch (System.FormatException) { MessageBox.Show("Часы не выбраны"); }
            }

        //Добавление данных из выделенной строки в TextBox'ы
        private void ClientsDataGrid_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            try
            {
                DataRowView row = (DataRowView)ClientsDataGrid.SelectedItems[0];
                SurnameTextBox.Text = row["surname"].ToString();
                FirstNameTextBox.Text = row["first_name"].ToString();
                PatronymicTextBox.Text = row["patronymic"].ToString();
            }
            catch (System.ArgumentOutOfRangeException)
            {

            }
            catch (System.InvalidCastException)
            {

            }
        }

        //Заполнение полей Количество и Сумма при выборе модели часов
        string DefaultSum;
        private void WatchesNameComboBox_DropDownClosed(object sender, System.EventArgs e)
        {
            AmountTextBox.Text = "1";
            DefaultSum = dBconnect.GetValueByString("часы", "name", "price", WatchesNameComboBox.Text);
            WatchesSumTextBox.Text = DefaultSum;
        }

        private string SymCheck(string CheckStr)
        {
            Regex regex = new Regex(@"[^0-9]");
            MatchCollection matches = regex.Matches(CheckStr);
            if (matches.Count > 0)
            {
                System.Windows.MessageBox.Show("Недопустимый ввод символов");
                return CheckStr.Replace(matches[0].ToString(), ""); ;
            }
            else return CheckStr;
        }

        //Обновление суммы при изменении количества
        private void AmountTextBox_TextChanged(object sender, System.Windows.Controls.TextChangedEventArgs e)
        {
            try
            {
                if (AmountTextBox.Text == "1") WatchesSumTextBox.Text = DefaultSum;
                AmountTextBox.Text = SymCheck(AmountTextBox.Text);
                WatchesSumTextBox.Text = (Convert.ToInt32(AmountTextBox.Text) * Convert.ToInt32(DefaultSum)).ToString();
            }
            catch (System.FormatException)
            {
                AmountTextBox.Text = SymCheck(AmountTextBox.Text);
            }
        }
    }
}
