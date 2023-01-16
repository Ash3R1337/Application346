using System;
using System.Windows;
using AHlibrary;

namespace Application346
{
    /// <summary>
    /// Логика взаимодействия для Report.xaml
    /// </summary>
    public partial class Report : Window
    {
        public Report()
        {
            InitializeComponent();
            ReportLabel.Content = $"Отчет за {DateTime.Today.ToShortDateString()}";
            DBconnect dBconnect = new DBconnect();
            dBconnect.MakeReport(AmountLabel, PeapoleLabel, WomanLabel, MostModelLabel, MosBrandLabel, "root");
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mw = new MainWindow();
            mw.Show();
            this.Close();
        }
    }
}
