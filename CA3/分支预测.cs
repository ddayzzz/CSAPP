//author : http://blog.zhaojie.me/2009/03/codetimer.html
//BranchPredict : http://www.cnblogs.com/yangecnu/p/4196026.html
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;
using System.Diagnostics;
using System.Runtime.InteropServices;
namespace CodeTime
{
    public static class CodeTimer
    {
        public static void Initialize()
        {
            Process.GetCurrentProcess().PriorityClass = ProcessPriorityClass.High;
            Thread.CurrentThread.Priority = ThreadPriority.Highest;
            Time("", 1, () => { });
        }

        public static void Time(string name, int iteration, Action action)
        {
            if (String.IsNullOrEmpty(name)) return;

            // 1.
            ConsoleColor currentForeColor = Console.ForegroundColor;
            Console.ForegroundColor = ConsoleColor.Yellow;
            Console.WriteLine(name);

            // 2.
            GC.Collect(GC.MaxGeneration, GCCollectionMode.Forced);
            int[] gcCounts = new int[GC.MaxGeneration + 1];
            for (int i = 0; i <= GC.MaxGeneration; i++)
            {
                gcCounts[i] = GC.CollectionCount(i);
            }

            // 3.
            Stopwatch watch = new Stopwatch();
            watch.Start();
            ulong cycleCount = GetCycleCount();
            for (int i = 0; i < iteration; i++) action();
            ulong cpuCycles = GetCycleCount() - cycleCount;
            watch.Stop();

            // 4.
            Console.ForegroundColor = currentForeColor;
            Console.WriteLine("\tTime Elapsed:\t" + watch.ElapsedMilliseconds.ToString("N0") + "ms");
            Console.WriteLine("\tCPU Cycles:\t" + cpuCycles.ToString("N0"));

            // 5.
            for (int i = 0; i <= GC.MaxGeneration; i++)
            {
                int count = GC.CollectionCount(i) - gcCounts[i];
                Console.WriteLine("\tGen " + i + ": \t\t" + count);
            }

            Console.WriteLine();

        }
        private static ulong GetCycleCount()
        {
            ulong cycleCount = 0;
            QueryThreadCycleTime(GetCurrentThread(), ref cycleCount);
            return cycleCount;
        }

        [DllImport("kernel32.dll")]
        [return: MarshalAs(UnmanagedType.Bool)]
        static extern bool QueryThreadCycleTime(IntPtr threadHandle, ref ulong cycleTime);

        [DllImport("kernel32.dll")]
        static extern IntPtr GetCurrentThread();
    }
    class Program
    {
        static void Main(string[] args)
        {
            Random random = new Random();
            long result = 0;
            int sz = 32768;//��֤�������ظ�������[0,256]������
            int[] arrays = new int[sz];
            //��������һ������
            for (int i = 0; i < sz; ++i)
                arrays[i] = random.Next(0, 256);
            //û������������ʱ��
            CodeTimer.Time("Unsorted:", 10000, () =>
            {
                for (int i = 0; i < sz; ++i)
                {
                    if (arrays[i] >= 128)
                        result += arrays[i];
                }
            });
            //����û������ ����ʹ��if
            CodeTimer.Time("Unsorted without if:", 10000, () =>
            {
                for (int i = 0; i < sz; ++i)
                {
                    int t = (arrays[i] - 128) >> 31;//��������ֵС��128����-128�õ�������������ȫ����1
                    result += ~t & arrays[i];
                }
            });
            //����
            Array.Sort(arrays);
            //������õ�ʱ��
            CodeTimer.Time("Sorted:", 10000, () =>
            {
                for (int i = 0; i < sz; ++i)
                {
                    if (arrays[i] >= 128)
                        result += arrays[i];
                }
            });
            Console.ReadKey();
        }
    }
}
