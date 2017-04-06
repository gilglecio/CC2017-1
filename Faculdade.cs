using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Faculdade
{
    class Program
    {
        static void Main(string[] args)
        {
            QuadradoPerfeito QuadradoPerfeito = new QuadradoPerfeito();
            Input Input = new Input();

            Console.Write("QUADRADO PERFEITO\n\n\nDigite um numero:\n\n");

            string check_message = QuadradoPerfeito.check(Input);

            Message Message = new Message(check_message);

            Output Out = new Output();

            Out.display(Message);

            Console.Read();
        }
    }

    public interface MessageInterface
    {
        string getMessage();
    }

    class Message : MessageInterface
    {
        private string _message;

        public Message(string message)
        {
            this._message = message;
        }

        public string getMessage()
        {
            return this._message;
        }
    }

    public interface OutputInterface
    {
        void display(MessageInterface message);
    }

    class Output : OutputInterface
    {
        public void display(MessageInterface message)
        {
            Console.WriteLine(message.getMessage());
        }
    }

    public interface InputInterface
    {
        string readyKeyboard();
    }

    class Input : InputInterface
    {
        public string readyKeyboard()
        {
            string read = Console.ReadLine();
            return read;
        }
    }

    class Calc
    {

    }

    class QuadradoPerfeito : Calc
    {
        public string check(Input input)
        {
            int number;
            string read = input.readyKeyboard();

            Int32.TryParse(read, out number);
            
            float raiz = (float) Math.Sqrt(number);
            
            return Math.Pow(raiz, 2) == number ? "É um quadrado perfeito, pois " + raiz + "X" + raiz + " = " + number + "." : "Não é um quadrado perfeito.";
        }
    }
}
