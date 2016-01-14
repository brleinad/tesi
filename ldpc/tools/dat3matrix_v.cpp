#include <iostream>
#include <vector>

using namespace std;

int main()
{
        //typedef vector<vector<int> > matrix; 
        vecto<int> co, oma;
        //int co [15][4];
        //int oma [15][15];
         
        int num, rows, cols;
        //read input matrix
        
        //read coordinates
        cin >> num;
        co.push_back(num);

        //generate output matrix
        for (int i = 0; i != 15; ++i)
        {
                int k = 0;
                for (int j = 0; j != 15; ++j)
                {
                        if (j == co[i][k] - 1)
                        {
                                oma[i][j] = 1;
                                ++k;
                        }
                        else
                                oma[i][j] = 0;
                        

                        //output matrix
                        cout << oma[i][j];
                }
                cout << endl;
        }
                cout << endl;

        /*
        for (int i = 0 ; i!= 15; ++i )
        {
                for (int j = 0; j != 15; ++j)
                {
                        cout << oma[i][j] ;
                }
                cout << endl;
        }
        cout << endl;
        */

        return 0;
}
