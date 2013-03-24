using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReadingBlobs
{
    /// <summary>
    /// This class reads blob data in chuncks.
    /// </summary>
    internal class BlobReader
    {
        private const int LengthOfData = 2;
        private const int PayloadColumn = 3;

        private readonly string ConnectionString = @"Database=BlobReader;Server=.\SQLEXPRESS;Trusted_Connection=Yes";
        private readonly string CommandString = "SELECT Id, Description, DATALENGTH(Payload) AS LengthOfData, Payload FROM DBO.Blob";
        private readonly int ChunkSizeBytes = 1 * 1024 * 1024; // 1MB

        private readonly SqlConnection _connection;
        private SqlDataReader _reader;

        public BlobReader()
        {
            _connection = new SqlConnection(ConnectionString);
        }

        public void OpenForReading()
        {
            var command = new SqlCommand(CommandString, _connection);
            _connection.Open();

            _reader = command.ExecuteReader(System.Data.CommandBehavior.SequentialAccess | System.Data.CommandBehavior.CloseConnection);
        }

        public void ReadNextChunk(Action<byte[]> callback)
        {
            long payloadLength = 0;
            int length = 0;
            long bytesRead = 0;
            int nextPosition = 0;
            byte[] bytes;

            while (_reader.Read())
            {
                payloadLength = _reader.GetInt64(LengthOfData);

                while (bytesRead < payloadLength)
                {
                    if (nextPosition + ChunkSizeBytes > payloadLength)
                    {
                        length = (int)(payloadLength - nextPosition);
                    }
                    else
                    {
                        length = (int)ChunkSizeBytes - 1;
                    }

                    bytes = new byte[length];

                    bytesRead += length;

                    _reader.GetBytes(PayloadColumn, nextPosition, bytes, 0, length);
                    nextPosition += length;

                    callback(bytes);
                }
            }

            _reader.Close();
            _connection.Close();
        }
    }
}
