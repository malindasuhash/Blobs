using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReadingBlobs
{
    class Program
    {
        private static List<byte> b = new List<byte>();
        private static int times = 1;

        static void Main(string[] args)
        {
            var blobReader = new BlobReader();

            blobReader.OpenForReading();

            blobReader.ReadNextChunk((bytes) => 
            {
                b.AddRange(bytes);
                Console.WriteLine("Times: {0}, Bytes in Buffer: {1}", times, bytes.Length);
                times++;
            });

            // Just write it some where
            File.WriteAllBytes("C:\\temp.pdf", b.ToArray());

            Console.WriteLine("File written to disk.  <ENTER> to close.");
            Console.ReadLine();
        }
    }
}
