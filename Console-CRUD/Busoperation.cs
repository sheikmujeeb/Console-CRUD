using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using CRUDlibrary;
using Dapper;

namespace Console_CRUD
{
    class Busoperation
    {
        Busdetails obj = new Busdetails();
        BusReposs instance;
        public Busoperation()
        {
            instance = new BusReposs();

        }
        public void menudriven()
        {
            int option;

            do
            {
                Console.WriteLine("Choose anyone option:");
                Console.WriteLine("1.Signup");
                Console.WriteLine("2.SPselectall");
                Console.WriteLine("3.SPsearch");
                Console.WriteLine("4.SPupdate");
                Console.WriteLine("5.SPremove");
                Console.WriteLine("6.Exit");

                option = Convert.ToInt32(Console.ReadLine());


                switch (option)
                {
                    case 1:
                        Signup();
                        break;
                    case 2:
                        SPselectall();
                        break;
                    case 3:
                        SPsearch();
                        break;
                    case 4:
                        SPupdate();
                        break;
                    case 5:
                        SPremove();
                        break;

                }
            }
                while (option != 5) ;

            
        }
            
        public void Signup()
        {
            try
            {
                Console.WriteLine("Enter the Bus Name:");
                obj.BusName = Console.ReadLine();
                Console.WriteLine("Enter the Driver Mobilenumber:");
                obj.DriverMobilenumber = Convert.ToInt64(Console.ReadLine());
                Console.WriteLine("Enter the Start Point:");
                obj.StartPoint = Convert.ToString(Console.ReadLine());
                Console.WriteLine("Enter the Destination:");
                obj.Destination = Convert.ToString(Console.ReadLine());
                Console.WriteLine("Enter the Fair:");
                obj.Fair = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Enter the No.Of.Passenger:");
                obj.NoofPassenger = Convert.ToInt32(Console.ReadLine());

                instance.SPlogin(obj);
            }
            catch(SqlException)
            {
                throw;
            }
            catch(Exception)
            {
                throw;
            }


        }
        public void SPselectall()
        {
            try
            {
                var showall = instance.SPselectall();
                if(showall==null||showall.Count()==0)
                {
                    Console.WriteLine("No record found");
                    return;
                }
                Console.WriteLine($"      {"BusID"}    |     {"BusName"}     |      {"DriverMobilenumber"}      |      {"StartPoint"}      |      {"Destination"}        |     {"Fair"}      |        {"NoofPassenger"}|" +
                    $"");
                foreach (var record in showall)
                {
                    Console.WriteLine($"{record.BusID} |   {record.BusName}  |    {record.DriverMobilenumber}   |    {record.StartPoint}   |    {record.Destination}     |  {record.Fair}    |    {record.NoofPassenger}|");
                }
            }
            catch(SqlException)
            {
                throw;
            }
            catch(Exception)
            {
                throw;
            }
            

        }
        public void SPupdate()
        {
            try
            {
                Console.WriteLine("Enter the ID:");
                int a = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Enter the StartPoint:");
                string b = Console.ReadLine();
                Console.WriteLine("Enter the Destination:");
                string c = Console.ReadLine();
                Console.WriteLine("Enter the Fair:");
                int d = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Enter No.of.Passenger:");
                int e = Convert.ToInt32(Console.ReadLine());
                instance.SPupdate(a, b, c, d, e);
            }
            catch(SqlException )
            {
                throw;
            }
            catch(Exception)
            {
                throw;
            }
            
        }
        public void SPsearch()
        {
            Console.WriteLine("Enter the Bus Name:");
            var search = Console.ReadLine();
            var any=instance.SPsearch(search);
            if (search.Any())
            {
                
                Console.WriteLine($"      {"BusID"}    |     {"BusName"}     |      {"DriverMobilenumber"}      |      {"StartPoint"}      |      {"Destination"}        |     {"Fair"}      |        {"NoofPassenger"}|" );
                foreach (var record in any)
                { 
                    Console.WriteLine($"  {record.BusID} |    {record.BusName}  |  {record.DriverMobilenumber} |  {record.StartPoint} |  {record.Destination} |  {record.Fair} |  {record.NoofPassenger}");
                }
            }
            else
            {
                Console.WriteLine("No Details Found");
            }

        }
        public void SPremove()
        {
            Console.WriteLine("Enter the BusName:");
            string bus = Console.ReadLine();
            if(bus.Any())
            {
                instance.SPremove(bus);
                Console.WriteLine("Bus Details Removed");
            }
            else
            {
                Console.WriteLine("No Details found");
            }
        }



    }
}
