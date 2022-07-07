// See https://aka.ms/new-console-template for more information
Console.WriteLine("Hello, World!");
/* 1.--------------------------------------------------------
 * What type would you choose for the following “numbers”?
 *A person’s telephone number -- string
 *A person’s height -- float
 *A person’s age -- int
 *A person’s gender (Male, Female, Prefer Not To Answer) --string
 *A person’s salary --double
 *A book’s ISBN -- string
 *A book’s price -- double
 *A book’s shipping weight --float
 *A country’s population -- int
 *The number of stars in the universe -- long
 *The number of employees in each of the small or medium businesses in the
 *United Kingdom --int
 */


/* 2.--------------------------------------------------------------
 A value type holds the data within its own memory location while a 
refernce type holds a pointer to another memory location that holds the real data.
Refernce Type variables are stored in the heap while value typs are stored in the stack

Boxing is when you convert a value type into an object type. While unboxing
is when an object type is changed into a value type.
 */

/*
 * 3.--------------------------------------------------------------
 * A managed resource is anything managed by and is in directly controlled by the CLR (common language runtime)
 * like all .NET framework classes. While unmanaged refers to things outside .NET like what you 
 * interract with through Win32 API functions.
 * 
 *
 */

/*
 * 4.------------------------------------------------------------------
 * The purpose of .NETS garbadge collector is to manage the allocation
 * and release of memory since every object created needs memory from the heap.
 */

//PRACTICE NUMBER SIZES AND RANGES

/*
 * 1.--------------------------------------------------------------------------
 */

Console.WriteLine("sbyte: 1 Byte -128 to 127");
Console.WriteLine("byte: 1 Byte 0 to 255");
Console.WriteLine("short: 2 Bytes -32,768 to 32,767");
Console.WriteLine("ushort: 2 Bytes 0 to 65,535");
Console.WriteLine("int: 4 Bytes -2,147,483,648 to 2, 147, 483, 647");
Console.WriteLine("uint: 4 Bytes 0 to 4,294,967,295");
Console.WriteLine("long: 8 Bytes -9,223,372,036,854,775,808 to 9, 223, 372, 036, 854, 775, 807");
Console.WriteLine("ulong: 8 Bytes 0 to 18,446,744,073,709,551,615");
Console.WriteLine("float: 4 Bytes -3.402823e38 to 3.402823e38");
Console.WriteLine("double: 8 Bytes -1.79769313486232e308 to 1.79769313486232e308");
Console.WriteLine("decimal: 16 Bytes -1.0 x 10e-28 to 7.9 x 10e28");

/*
 * 2.--------------------------------------------------------------------------
 */





int centuries()
{
    Console.WriteLine("*********");
    Console.WriteLine(" ");
    Console.WriteLine("Enter number of centuries:");
    int cent = Convert.ToInt32(Console.ReadLine());
    Console.WriteLine("");
    int year = cent * 100;
    int days = cent * 36524;
    int hours = cent * 876576;
    long minutes = cent * 52594560;
    long seconds = cent * 3155673600;
    double milliseconds = cent * 3155673600000000;
    double microseconds = cent * 3155673600000000000;
    Console.WriteLine("year: " + year + ", ");
    Console.WriteLine("days: " + days + ", ");
    Console.WriteLine("hours: " + hours + ", ");
    Console.WriteLine("minutes: " + minutes + ", ");
    Console.WriteLine("seconds: " + seconds + ", ");
    Console.WriteLine("milliseconds: " + milliseconds + ", ");
    Console.WriteLine("microseconds: " + microseconds + " ");
    Console.WriteLine();


    return 0;
}

int x = centuries();

//CONTROLLING FLOW AND CONVERTING TYPES
//-----------------------------------------------------------------
/*
 * 1.An error is generated when you devide and int variable by 0.
 * 2.An error is generated when you devide and double variable by 0.
 * 3.An erroe is generated when an int is overflowd
 * 4.x=y++ -- X is set to the value of Y and then Y is incrimented.
 *   x=++y -- Y is incrimented and then X is set to the value of Y
 * 5.break immediatly exits the loops. continue continues the loop
 *   return exits the loop and returns a value
 * 6.The start value, when to stop condition and how much it increments every loop.
 * 7.the = operator sets a variable equal to a value while the == the operator
 *   is used to compare.
 * 8.Yes
 * 9.An underscore represents a discard.
 * 10.An object must implament System.Collections.IEnumerable 
 */


//PRACTICE LOOPS AND OPERATORS
//---------------------------------------------------------------
/*
 * It is an infinate loop since i will never be less than max since i is 
 * of type byte.
 */

int max = 100;
for (int i = 1; i < max; i++)
{
    if ((i % 3 == 0) && (i % 5 == 0))
    {
        Console.Write("/fizzbuzz/ ");
    }
    else if (i % 3 == 0)
    {
        Console.Write("/fiz/ ");
    }
    else if (i % 5 == 0)
    {
        Console.Write("/buzz/ ");
    }
    else
    {
        Console.Write(i + " ");
    }
}
Console.WriteLine(" ");

int guessNumber()
{
    Console.WriteLine("Guess number between 1 and 3 ");
    int guess = Convert.ToInt32(Console.ReadLine());
    int rand = new Random().Next(3) + 1;
    if (guess < 1 || guess > 3)
    {
        Console.WriteLine("Your guess is out of range.");
        Console.WriteLine();
        return 0;
    }

    if(guess > rand)
    {
        Console.WriteLine("Your guess is too high.");
        Console.WriteLine();
        return 0;
    }
    if (guess < rand)
    {
        Console.WriteLine("Your guess is too low.");
        Console.WriteLine();
        return 0;
    }

    Console.WriteLine("Your guess is correct");
    Console.WriteLine();

    return 0;


}

int y = guessNumber();

int printPyramid()
{
    Console.WriteLine("Enter size of pyramid: ");
    int size = Convert.ToInt32(Console.ReadLine());
    for (int i = 1; i <= size; ++i)
    {
        int c = 0;
        for (int tab = 1; tab <= size - i; ++tab)
        {
            Console.Write(" ");
        }
        for (int v = c; v != (2*i - 1); v++)
        {
            Console.Write("*");
            ++c;
        }
        Console.WriteLine();

    }

    Console.WriteLine();
    Console.WriteLine();
    return 0;
    
}

int p = printPyramid();


int greetingTime(){
    var date = DateTime.Now;
    var time = date.TimeOfDay;


    if(date.Hour >= 5 && date.Hour < 12)
    {
        Console.WriteLine("Good Morning");
    }

    if (date.Hour >= 12 && date.Hour < 15)
    {
        Console.WriteLine("Good Afternoon");
    }

    if (date.Hour >= 15 && date.Hour < 18)
    {
        Console.WriteLine("Good Evening");
    }

    if (date.Hour >= 18 && date.Hour < 24)
    {
        Console.WriteLine("Good Evening");
    }

    return 0;

}

int g = greetingTime();

int counting()
{
    for (int i = 1; i <= 4; i++){
        for (int x = 0; x <= 24; x+=i)
        {
            Console.Write(x + " "); ;
        }
        Console.WriteLine();
    }

    Console.WriteLine();
    Console.WriteLine();

    return 0;
}

int c = counting();


//  ARRAYS AND STRINGS

/*
 * 1. You use stringBuilder in C# when you want to be able to modify a string 
 *      and regular strings for everything else.
 * 2. The base class for all arrays in C# is Collections
 * 3. The simplest way to sort an array in C# is to call the Sort() method.
 * 4. Use the .Length propery to get the length of an array.
 * 5. No multiple types can not be stored in the same array.
 * 6. The CopyYo() method copies the data of the original array into a different array
 *      that already exists. Clone() creates a brand new array with the data of the original array
 */

int arrayCopy()
{

    int[] original = new int[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
    int[] copy = new int[original.Length];

    for(int i = 0; i< 10; i++)
    {
        copy[i] = original[i];
    }

    for (int i = 0; i < 10; i++)
    {
        Console.Write(original[i] + " ");
    }

    Console.WriteLine();

    for (int i = 0; i < 10; i++)
    {
        Console.Write(copy[i] + " ");
    }

    Console.WriteLine();
    Console.WriteLine();

    return 0;
}

int a = arrayCopy();
