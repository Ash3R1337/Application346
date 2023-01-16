using System.Data;
using MySql.Data.MySqlClient;
using System.Data.Common;
using System.Windows.Controls;
using System.Windows;
using System;

namespace AHlibrary
{
    /// <summary>
    /// Класс DBconnect предоставляет функции для работы с базой данных,
    /// а именно для подключения, сохранения таблицы и других
    /// различных действий, необходимых для работы
    /// </summary>
    public class DBconnect
    {

        DbDataAdapter adapter;
        DataTable dt;
        MySqlConnection conn;

        /// <summary>
        /// Выполняет подключение к базе данных,
        /// после чего выгружает данные из
        /// определенной таблицы в DataGrid
        /// </summary>
        /// <param name="dbname">Название базы данных</param>
        /// <param name="table">Передает таблицу, которая должна
        /// быть выведена в DataGrid</param>
        /// <param name="dataGrid">Передает элемент dataGrid,
        /// в который будут переданы данные из
        /// выбранной таблицы</param>
        /// <param name="password">Пароль для
        /// подключения к БД</param>
        public void DB(string dbname, string table, DataGrid dataGrid, string password) //Подключение к БД
        {
            conn = new MySqlConnection("server=localhost;user=root;database="+dbname+";port=3306;password="+password+";");
            string sql = "SELECT * FROM " + table;
            adapter = new MySqlDataAdapter(sql, conn);
            conn.Open();
            MySqlCommandBuilder myCommandBuilder = new MySqlCommandBuilder(adapter as MySqlDataAdapter);
            adapter.InsertCommand = myCommandBuilder.GetInsertCommand();
            adapter.UpdateCommand = myCommandBuilder.GetUpdateCommand();
            adapter.DeleteCommand = myCommandBuilder.GetDeleteCommand();

            dt = new DataTable();
            adapter.Fill(dt); //загрузка данных
            dataGrid.ItemsSource = dt.DefaultView; //привязка к DataGrid
        }

        public void AddValues(string table, int id_client, int id_product, int total, int amount)
        {
            string sql = $"INSERT INTO {table} (id_client, id_product, total, amount) VALUES (@clien, @prod, @tot, @am)";
            MySqlCommand command = new MySqlCommand(sql, conn);
            command.Parameters.AddWithValue("@clien", id_client);
            command.Parameters.AddWithValue("@prod", id_product);
            command.Parameters.AddWithValue("@tot", total);
            command.Parameters.AddWithValue("@am", amount);
            command.ExecuteNonQuery();

        }

        /// <summary>
        /// Получение значения из таблицы
        /// </summary>
        /// <param name="table">Из какой таблицы получить элемент</param>
        /// <param name="inputItem">В каком столбце делать сравнение</param>
        /// <param name="value">Откуда получить значение</param>
        /// <param name="textBox">С помощью какой строки получить элемент</param>
        /// <returns></returns>
        public string GetValueByString(string table, string inputItem, string value, string textBox)
        {
            string sql = $"SELECT {value} FROM {table} WHERE {inputItem} = '{textBox}'";
            MySqlCommand command = new MySqlCommand(sql, conn);
            string result = Convert.ToString(command.ExecuteScalar());
            return result;
        }

        /// <summary>
        /// Поиск строки в таблице
        /// </summary>
        /// <param name="dataGrid"></param>
        /// <param name="table"></param>
        /// <param name="cond"></param>
        /// <param name="SearchName"></param>
        public void TableSearch(DataGrid dataGrid, string table, string cond, string SearchName)
        {
            string sql = "SELECT * FROM "+table+" WHERE "+cond+" LIKE '"+SearchName+"%'";
            adapter = new MySqlDataAdapter(sql, conn);
            MySqlCommandBuilder myCommandBuilder = new MySqlCommandBuilder(adapter as MySqlDataAdapter);
            adapter.InsertCommand = myCommandBuilder.GetInsertCommand();
            adapter.UpdateCommand = myCommandBuilder.GetUpdateCommand();
            adapter.DeleteCommand = myCommandBuilder.GetDeleteCommand();
            dt = new DataTable();
            adapter.Fill(dt);
            dataGrid.ItemsSource = dt.DefaultView;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="comboBox"></param>
        /// <param name="value"></param>
        /// <param name="table"></param>
        public void FillCombobox(ComboBox comboBox, string value, string table)
        {
            string sql = "SELECT " + value + " FROM " + table;
            adapter = new MySqlDataAdapter(sql, conn);
            dt = new DataTable();
            adapter.Fill(dt);
            comboBox.ItemsSource = dt.DefaultView;
            comboBox.DisplayMemberPath = value;
        }
        
        /// <summary>
        /// Сохраняет все измененные данные
        /// из DataGrid в базу данных   
        /// </summary>
        public void SaveTable() //Сохранение БД
        {
            adapter.Update(dt);
        }

        /// <summary>
        /// Проверка авторизации пользователя
        /// </summary>
        /// <param name="textBox"></param>
        /// <param name="passwordBox"></param>
        public void AuthCheck(TextBox textBox, PasswordBox passwordBox, string password)
        {
            MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=projectdb;port=3306;password=" + password + ";");
            string sql = "SELECT * FROM users WHERE Логин = @login and Пароль = @pass";
            conn.Open();

            DataTable table = new DataTable();
            MySqlDataAdapter adapter = new MySqlDataAdapter();

            MySqlCommand command = new MySqlCommand(sql, conn);
            command.Parameters.Add("@login", MySqlDbType.VarChar, 25);
            command.Parameters.Add("@pass", MySqlDbType.VarChar, 25);

            command.Parameters["@login"].Value = textBox.Text;
            command.Parameters["@pass"].Value = passwordBox.Password;

            adapter.SelectCommand = command;
            adapter.Fill(table);

            if (table.Rows.Count > 0)
            {
                MessageBox.Show("Успех");
                //    UserRole(); // метод, который будет открывать разные формы в зависимости от пользователя
            }
            else { MessageBox.Show("Неправильный логин или пароль."); }

            conn.Close();
        }

        //public void UserRole()
        //{
        //    string UserName = TextBox1.Text;

        //    string connStr = "server=localhost; port=3306; username=root; password= root; database=bd;";
        //    string sql = "SELECT User_Role FROM `user` WHERE `Name` = @un";

        //    MySqlConnection conn = new MySqlConnection(connStr);
        //    conn.Open();

        //    MySqlParameter nameParam = new MySqlParameter("@un", UserName);

        //    MySqlCommand command = new MySqlCommand(sql, conn);
        //    command.Parameters.Add(nameParam);

        //    string Form_Role = command.ExecuteScalar().ToString();

        //    Switch(Form_Role):
        //    {
        //        case "Администратор": Form.ActiveForm.Close(); Form1 f1 = new Form1(); f1.Show();
        //        break;
        //        default:  Form.ActiveForm.Close(); Form2 f2 = new Form2(); f2.Show();
        //    }
        //    conn.Close();
        //}
    }
}
