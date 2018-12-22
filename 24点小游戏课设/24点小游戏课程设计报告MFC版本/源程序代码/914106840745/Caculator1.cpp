// Caculator1.cpp: implementation of the CCaculator class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "914106840745.h"
#include "Caculator1.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif
int _count(int a, int sys, int b)
{
    if (sys == 0)
        return a + b;
    else if (sys == 1)
    {
        if (a > b)
        {
            return a - b;
        }
        else
            return b - a;
    }
    else if (sys == 2)
        return a * b;
    else
    {
        if ((a == 0) || (b == 0))
            return 0;
        else
        {
            if ((a%b != 0) && (b%a != 0))
                return 0;
            else
            {
                if (a > b)
                    return a / b;
                else
                    return b / a;
            }
        }
    }
}

void _order1(int n, int *a, int *b, int *c, int *d)
{
    int tem;
    if (n == 0)
    {
        if (*a < *b)
        {
            tem = *a;
            *a = *b;
            *b = tem;
        }
    }
    else if (n == 1)
    {
        if (*a > *c)
        {
            tem = *b;
            *b = *c;
            *c = tem;
        }
        else
        {
            tem = *a;
            *a = *c;
            *c = *b;
            *b = tem;
        }
    }
    else if (n == 2)
    {
        if (*a > *d)
        {
            tem = *b;
            *b = *d;
            *d = tem;
        }
        else
        {
            tem = *a;
            *a = *d;
            *d = *b;
            *b = tem;
        }
    }
    else if (n==3)
    {
        if (*b > *c)
        {
            tem = *a;
            *a = *b;
            *b = *c;
            *c = tem;
        }
        else
        {
            tem = *a;
            *a = *c;
            *c = tem;
        }
    }
    else if (n == 4)
    {
        if (*d > *b)
        {
            tem = *a;
            *a = *d;
            *d = tem;
        }
        else
        {
            tem = *a;
            *a = *b;
            *b = *d;
            *d = tem;
        }
    }
    else
    {
        if (*c > *d)
        {
            tem = *a;
            *a = *c;
            *c = *b;
            *b = *d;
            *d = tem;
        }
        else
        {
            tem = *a;
            *a = *d;
            *d = *b;
            *b = *c;
            *c = tem;
        }
    }
}
void _order2(int n, int *x, int *c, int *d)
{
    int tem;
    if (n == 0)
    {
        *x = *x;
        *c = *c;
        *d = *d;
    }
    else if(n == 1)
    {
        tem = *c;
        *c = *d;
        *d = tem;
    }
    else
    {
        if (*d > *c)
        {
            tem = *x;
            *x = *d;
            *d = tem;
        }
        else
        {
            tem = *x;
            *x = *c;
            *c = *d;
            *d = tem;
        }
    }
}






int _count4(int a, int sys1, int b, int sys2, int c, int sys3, int d)
{
    if (sys1 > 1)
    {
        if (sys2 < 1)
        {
            if (sys3 > 1)
            {
                int zzc1= _count(a, sys1, b);
                int zzc3= _count(c, sys3, d);
                return _count(zzc1, sys2,zzc3 );
            }
            else
            {
                int zzc11=_count(a, sys1, b);
                int zzc22=_count(zzc11, sys2, c);
                return _count(zzc22, sys3, d);
            }
        }
        else
        {
            int zzc111=_count(a, sys1, b);
            int zzc222=_count(zzc111, sys2, c);
            return _count(zzc222, sys3, d);
        }
    }
    else
    {
        if (sys2 < 1)
        {
            if (sys3 > 1)
            {
                int zzc1111=_count(a, sys1, b);
                int zzc3333=_count(c, sys3, d);
                return _count(zzc1111, sys2,zzc3333 );
            }
            else
            {
                int zzc11111=_count(a, sys1, b);
                int zzc22222=_count(zzc11111, sys2, c);
                return _count(zzc22222, sys3, d);
            }
        }
        else
        {
            if (sys3 < 1)
            {
                int zzc222222=_count(b, sys2, c);
                int zzc2222222=_count(a, sys1, zzc222222);
                return _count(zzc2222222, sys3, d);
            }
            else
            {
                int zzc44=_count(b, sys2, c);
                int zzc22222222222=_count(d, sys3,zzc44 );
                return _count(zzc22222222222, sys1, a);
            }
        }
    }
}

int _count3(int a, int sys1, int b, int sys2, int c)
{
    if (sys2 > 1)
    {
        if (sys1 > 1)
        {
            int zzc11111=_count(a, sys1, b);
            return _count(zzc11111, sys2, c);
        }
        else
        {
            int zzc22222222222=_count(b, sys2, c);
            return _count(a, sys1,zzc22222222222);
        }
    }
    else
        return _count(_count(a, sys1, b), sys2, c);
}

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CCaculator::CCaculator()
{

}

CCaculator::~CCaculator()
{

}


int CCaculator::_ComputerCaculator(int get1,int get2,int get3,int get4,struct ResultOfString* RS){
    int x, y, z;
    int a = get1;
    int b = get2;
    int c = get3;
    int d = get4;
    
    int o = 0;
    
    for (int n1 = 0; n1 < 6; n1++)
    {
        a = get1;
        b = get2;
        c = get3;
        d = get4;
        _order1(n1, &a, &b, &c, &d);
        
        for (int p = 0; p < 4; p++)
        {
            if (p < 3)
                x = _count(a, p, b);
            else
            {
                x = _count(a, 3, b);
                if (x == 0)
                    continue;
            }
            for (int n2 = 0; n2 < 3; n2++)
            {
                a = get1;
                b = get2;
                c = get3;
                d = get4;
                _order1(n1, &a, &b, &c, &d);
                _order2(n2, &x, &c, &d);
                if ((n1 > 2) && (n2 == 2))
                    continue;
                for (int q = 0; q < 4; q++)
                {
                    if (q < 3)
                        y = _count(x, q, c);
                    else
                    {
                        y = _count(x, 3, c);
                        if (y == 0)
                            continue;
                    }
                    for (int m = 0; m < 4; m++)
                    {
                        if (m < 3)
                            z = _count(y, m, d);
                        else
                        {
                            z = _count(y, 3, d);
                            if (z == 0)
                                continue;
                        }
                        if (z == 24)
                        {
                            int i = 0;
                            if (n2 == 2)
                            {
                                if (_count(a, p, b) > _count(x, q, c))
                                {
                                    
                                    (RS+o)->_return[i] = '(';
                                    i++;
                                    if (a > 9)
                                    {
                                        (RS+o)->_return[i] = 49;
                                        i++;
                                        (RS+o)->_return[i] = a - 10 + 48;
                                        i++;
                                    }
                                    else
                                    {
                                        (RS+o)->_return[i] = a + 48;
                                        i++;
                                    }
                                    switch (p){
                                        case 0:(RS+o)->_return[i] = '+';
                                            break;
                                        case 1:(RS+o)->_return[i] = '-';
                                            break;
                                        case 2:(RS+o)->_return[i] = '*';
                                            break;
                                        default:(RS+o)->_return[i] = '/';
                                    }
                                    i++;
                                    if (b > 9)
                                    {
                                        (RS+o)->_return[i] = 49;
                                        i++;
                                        (RS+o)->_return[i] = b - 10 + 48;
                                        i++;
                                    }
                                    else
                                    {
                                        (RS+o)->_return[i] = b + 48;
                                        i++;
                                    }
                                    (RS+o)->_return[i] = ')';
                                    i++;
                                    switch (m){
                                        case 0:(RS+o)->_return[i] = '+';
                                            break;
                                        case 1:(RS+o)->_return[i] = '-';
                                            break;
                                        case 2:(RS+o)->_return[i] = '*';
                                            break;
                                        default:(RS+o)->_return[i] = '/';
                                    }
                                    i++;
                                    (RS+o)->_return[i] = '(';
                                    i++;
                                    if (x > 9)
                                    {
                                        (RS+o)->_return[i] = 49;
                                        i++;
                                        (RS+o)->_return[i] = x - 10 + 48;
                                        i++;
                                    }
                                    else
                                    {
                                        (RS+o)->_return[i] = x + 48;
                                        i++;
                                    }
                                    switch (q){
                                        case 0:(RS+o)->_return[i] = '+';
                                            break;
                                        case 1:(RS+o)->_return[i] = '-';
                                            break;
                                        case 2:(RS+o)->_return[i] = '*';
                                            break;
                                        default:(RS+o)->_return[i] = '/';
                                    }
                                    i++;
                                    if (c > 9)
                                    {
                                        (RS+o)->_return[i] = 49;
                                        i++;
                                        (RS+o)->_return[i] = c - 10 + 48;
                                        i++;
                                    }
                                    else
                                    {
                                        (RS+o)->_return[i] = c + 48;
                                        i++;
                                    }
                                    (RS+o)->_return[i] = ')';
                                    i++;
                                    (RS+o)->_return[i] = '\0';
                                    
                                }
                                else
                                {
                                    (RS+o)->_return[i] = '(';
                                    i++;
                                    if (x > 9)
                                    {
                                        (RS+o)->_return[i] = 49;
                                        i++;
                                        (RS+o)->_return[i] = x - 10 + 48;
                                        i++;
                                    }
                                    else
                                    {
                                        (RS+o)->_return[i] = x + 48;
                                        i++;
                                    }
                                    switch (q){
                                        case 0:(RS+o)->_return[i] = '+';
                                            break;
                                        case 1:(RS+o)->_return[i] = '+';
                                            break;
                                        case 2:(RS+o)->_return[i] = '*';
                                            break;
                                        default:(RS+o)->_return[i] = '/';
                                    }
                                    i++;
                                    if (c > 9)
                                    {
                                        (RS+o)->_return[i] = 49;
                                        i++;
                                        (RS+o)->_return[i] = c - 10 + 48;
                                        i++;
                                    }
                                    else
                                    {
                                        (RS+o)->_return[i] = c + 48;
                                        i++;
                                    }
                                    (RS+o)->_return[i] = ')';
                                    i++;
                                    switch (m){
                                        case 0:(RS+o)->_return[i] = '+';
                                            break;
                                        case 1:(RS+o)->_return[i] = '-';
                                            break;
                                        case 2:(RS+o)->_return[i] = '*';
                                            break;
                                        default:(RS+o)->_return[i] = '/';
                                    }
                                    i++;
                                    (RS+o)->_return[i] = '(';
                                    i++;
                                    if (a > 9)
                                    {
                                        (RS+o)->_return[i] = 49;
                                        i++;
                                        (RS+o)->_return[i] = a - 10 + 48;
                                        i++;
                                    }
                                    else
                                    {
                                        (RS+o)->_return[i] = a + 48;
                                        i++;
                                    }
                                    switch (p){
                                            
                                        case 0:(RS+o)->_return[i] = '+';
                                            break;
                                        case 1:(RS+o)->_return[i] = '-';
                                            break;
                                        case 2:(RS+o)->_return[i] = '*';
                                            break;
                                        default:(RS+o)->_return[i] = '/';
                                    }
                                    i++;
                                    if (b > 9)
                                    {
                                        (RS+o)->_return[i] = 49;
                                        i++;
                                        (RS+o)->_return[i] = b - 10 + 48;
                                        i++;
                                    }
                                    else
                                    {
                                        (RS+o)->_return[i] = b + 48;
                                        i++;
                                    }
                                    (RS+o)->_return[i] = ')';
                                    i++;
                                }
                            }
                            else
                            {
                                if (y > d)
                                {
                                    if (_count(a, p, b) > c)
                                    {
                                        (RS+o)->_return[i] = '(';
                                        i++;
                                        (RS+o)->_return[i] = '(';
                                        i++;
                                        if (a > 9)
                                        {
                                            (RS+o)->_return[i] = 49;
                                            i++;
                                            (RS+o)->_return[i] = a - 10 + 48;
                                            i++;
                                        }
                                        else
                                        {
                                            (RS+o)->_return[i] = a + 48;
                                            i++;
                                        }
                                        switch (p){
                                            case 0:(RS+o)->_return[i] = '+';
                                                break;
                                            case 1:(RS+o)->_return[i] = '-';
                                                break;
                                            case 2:(RS+o)->_return[i] = '*';
                                                break;
                                            default:(RS+o)->_return[i] = '/';
                                        }
                                        i++;
                                        if (b > 9)
                                        {
                                            (RS+o)->_return[i] = 49;
                                            i++;
                                            (RS+o)->_return[i] = b - 10 + 48;
                                            i++;
                                        }
                                        else
                                        {
                                            (RS+o)->_return[i] = b + 48;
                                            i++;
                                        }
                                        (RS+o)->_return[i] = ')';
                                        i++;
                                        switch (q){
                                            case 0:(RS+o)->_return[i] = '+';
                                                break;
                                            case 1:(RS+o)->_return[i] = '-';
                                                break;
                                            case 2:(RS+o)->_return[i] = '*';
                                                break;
                                            default:(RS+o)->_return[i] = '/';
                                        }
                                        i++;
                                        if (c > 9)
                                        {
                                            (RS+o)->_return[i] = 49;
                                            i++;
                                            (RS+o)->_return[i] = c - 10 + 48;
                                            i++;
                                        }
                                        else
                                        {
                                            (RS+o)->_return[i] = c + 48;
                                            i++;
                                        }
                                        (RS+o)->_return[i] = ')';
                                        i++;
                                    }
                                    else////////////////////////////
                                    {
                                        (RS+o)->_return[i] = '(';
                                        i++;
                                        if (c > 9)
                                        {
                                            (RS+o)->_return[i] = 49;
                                            i++;
                                            (RS+o)->_return[i] = c - 10 + 48;
                                            i++;
                                        }
                                        else
                                        {
                                            (RS+o)->_return[i] = c + 48;
                                            i++;
                                        }
                                        switch (q){
                                            case 0:(RS+o)->_return[i] = '+';
                                                break;
                                            case 1:(RS+o)->_return[i] = '-';
                                                break;
                                            case 2:(RS+o)->_return[i] = '*';
                                                break;
                                            default:(RS+o)->_return[i] = '/';
                                        }
                                        i++;
                                        (RS+o)->_return[i] = '(';
                                        i++;
                                        if (a > 9)
                                        {
                                            (RS+o)->_return[i] = 49;
                                            i++;
                                            (RS+o)->_return[i] = a - 10 + 48;
                                            i++;
                                        }
                                        else
                                        {
                                            (RS+o)->_return[i] = a + 48;
                                            i++;
                                        }
                                        switch (p){
                                            case 0:(RS+o)->_return[i] = '+';
                                                break;
                                            case 1:(RS+o)->_return[i] = '-';
                                                break;
                                            case 2:(RS+o)->_return[i] = '*';
                                                break;
                                            default:(RS+o)->_return[i] = '/';
                                        }
                                        i++;
                                        if (b > 9)
                                        {
                                            (RS+o)->_return[i] = 49;
                                            i++;
                                            (RS+o)->_return[i] = b - 10 + 48;
                                            i++;
                                        }
                                        else
                                        {
                                            (RS+o)->_return[i] = b + 48;
                                            i++;
                                        }
                                        (RS+o)->_return[i] = ')';
                                        i++;
                                        (RS+o)->_return[i] = ')';
                                        i++;
                                    }
                                    switch (m){
                                        case 0:(RS+o)->_return[i] = '+';
                                            break;
                                        case 1:(RS+o)->_return[i] = '-';
                                            break;
                                        case 2:(RS+o)->_return[i] = '*';
                                            break;
                                        default:(RS+o)->_return[i] = '/';
                                    }
                                    i++;
                                    if (d > 9)
                                    {
                                        (RS+o)->_return[i] = 49;
                                        i++;
                                        (RS+o)->_return[i] = d - 10 + 48;
                                        i++;
                                    }
                                    else
                                    {
                                        (RS+o)->_return[i] = d + 48;
                                        i++;
                                    }
                                }
                                else/////////////////////////////////////////
                                {
                                    if (d > 9)
                                    {
                                        (RS+o)->_return[i] = 49;
                                        i++;
                                        (RS+o)->_return[i] = d - 10 + 48;
                                        i++;
                                    }
                                    else
                                    {
                                        (RS+o)->_return[i] = d + 48;
                                        i++;
                                    }
                                    switch (m){
                                        case 0:(RS+o)->_return[i] = '+';
                                            break;
                                        case 1:(RS+o)->_return[i] = '-';
                                            break;
                                        case 2:(RS+o)->_return[i] = '*';
                                            break;
                                        default:(RS+o)->_return[i] = '/';
                                    }
                                    i++;
                                    if (_count(a, p, b) > c)
                                    {
                                        (RS+o)->_return[i] = '(';
                                        i++;
                                        (RS+o)->_return[i] = '(';
                                        i++;
                                        if (a > 9)
                                        {
                                            (RS+o)->_return[i] = 49;
                                            i++;
                                            (RS+o)->_return[i] = a - 10 + 48;
                                            i++;
                                        }
                                        else
                                        {
                                            (RS+o)->_return[i] = a + 48;
                                            i++;
                                        }
                                        switch (p){
                                            case 0:(RS+o)->_return[i] = '+';
                                                break;
                                            case 1:(RS+o)->_return[i] = '-';
                                                break;
                                            case 2:(RS+o)->_return[i] = '*';
                                                break;
                                            default:(RS+o)->_return[i] = '/';
                                        }
                                        i++;
                                        if (b > 9)
                                        {
                                            (RS+o)->_return[i] = 49;
                                            i++;
                                            (RS+o)->_return[i] = b - 10 + 48;
                                            i++;
                                        }
                                        else
                                        {
                                            (RS+o)->_return[i] = b + 48;
                                            i++;
                                        }
                                        (RS+o)->_return[i] = ')';
                                        i++;
                                        switch (q){
                                            case 0:(RS+o)->_return[i] = '+';
                                                break;
                                            case 1:(RS+o)->_return[i] = '-';
                                                break;
                                            case 2:(RS+o)->_return[i] = '*';
                                                break;
                                            default:(RS+o)->_return[i] = '/';
                                        }
                                        i++;
                                        if (c > 9)
                                        {
                                            (RS+o)->_return[i] = 49;
                                            i++;
                                            (RS+o)->_return[i] = c - 10 + 48;
                                            i++;
                                        }
                                        else
                                        {
                                            (RS+o)->_return[i] = c + 48;
                                            i++;
                                        }
                                        (RS+o)->_return[i] = ')';
                                        i++;
                                    }
                                    else////////////////////////////
                                    {
                                        (RS+o)->_return[i] = '(';
                                        i++;
                                        if (c > 9)
                                        {
                                            (RS+o)->_return[i] = 49;
                                            i++;
                                            (RS+o)->_return[i] = c - 10 + 48;
                                            i++;
                                        }
                                        else
                                        {
                                            (RS+o)->_return[i] = c + 48;
                                            i++;
                                        }
                                        switch (q){
                                            case 0:(RS+o)->_return[i] = '+';
                                                break;
                                            case 1:(RS+o)->_return[i] = '-';
                                                break;
                                            case 2:(RS+o)->_return[i] = '*';
                                                break;
                                            default:(RS+o)->_return[i] = '/';
                                        }
                                        i++;
                                        (RS+o)->_return[i] = '(';
                                        i++;
                                        if (a > 9)
                                        {
                                            (RS+o)->_return[i] = 49;
                                            i++;
                                            (RS+o)->_return[i] = a - 10 + 48;
                                            i++;
                                        }
                                        else
                                        {
                                            (RS+o)->_return[i] = a + 48;
                                            i++;
                                        }
                                        switch (p){
                                            case 0:(RS+o)->_return[i] = '+';
                                                break;
                                            case 1:(RS+o)->_return[i] = '-';
                                                break;
                                            case 2:(RS+o)->_return[i] = '*';
                                                break;
                                            default:(RS+o)->_return[i] = '/';
                                        }
                                        i++;
                                        if (b > 9)
                                        {
                                            (RS+o)->_return[i] = 49;
                                            i++;
                                            (RS+o)->_return[i] = b - 10 + 48;
                                            i++;
                                        }
                                        else
                                        {
                                            (RS+o)->_return[i] = b + 48;
                                            i++;
                                        }
                                        (RS+o)->_return[i] = ')';
                                        i++;
                                        (RS+o)->_return[i] = ')';
                                        i++;
                                    }
                                }
                            }
                            (RS+o)->_return[i] = '=';
                            i++;
                            (RS+o)->_return[i] = '2';
                            i++;
                            (RS+o)->_return[i] = '4';
                            i++;
                            (RS+o)->_return[i] = '\0';
                            o++;
                        }
                    }
                }
            }
        }
    }
    return o;
}















//////////////////////////////////////////









int CCaculator::_ManualCaculator(const char* _cin)
{
    int pq = 0, p1 = 0, p2 = 0, q1 = 0, q2 = 0;
    int abcd[4];
    int sys[3];
    int numofsys = 0, numofabcd = 0;
    for (int n = 0; _cin[n] != '\0'; n++)
    {
        if (_cin[n] < 48)
        {
            if (_cin[n] == '(')
            {
                pq++;
                if (pq == 1)
                {
                    p1 = n;
                }
                else
                {
                    p2 = n;
                }
            }
            else if (_cin[n] == ')')
            {
                if (pq == 1)
                {
                    q1 = n;
                }
                else
                {
                    q2 = n;
                }
            }
            else
            {
                switch (_cin[n]){
                    case '+':sys[numofsys] = 0;
                        break;
                    case '-':sys[numofsys] = 1;
                        break;
                    case '*':sys[numofsys] = 2;
                        break;
                    default:sys[numofsys] = 3;
                }
                numofsys++;
            }
        }
        else
        {
            if (_cin[n + 1] > 47)
            {
                abcd[numofabcd] = 10 + _cin[n + 1] - 48;
                numofabcd++;
                n++;
            }
            else
            {
                abcd[numofabcd] = _cin[n] - 48;
                numofabcd++;
            }
        }
    }
    if (pq == 0)
    {
        if (_count4(abcd[0], sys[0], abcd[1], sys[1], abcd[2], sys[2], abcd[3]) == 24)
            return 1;
        else
            return 0;
    }
    else if (pq == 1)
    {
        int k = 0;
        int j = 0;
        for (int h = 0; _cin[h] != '('; h++)
        {
            if ((_cin[h] < 48) && (_cin[h]>41))
            {
                j++;
            }
        }
        for (int i = p1 + 1; i < q1; i++)
        {
            if (_cin[i] < 48)
            {
                k++;
            }
        }
        
        if (k == 1)
        {
            if (j == 0)
            {
                if (_count3(_count(abcd[0], sys[0], abcd[1]), sys[1], abcd[2], sys[2], abcd[3]) == 24)
                    return 1;
                else
                    return 0;
                
            }
            else if (j == 1)
            {
                if (_count3(abcd[0], sys[0], _count(abcd[1], sys[1], abcd[2]), sys[2], abcd[3]) == 24)
                    return 1;
                else
                    return 0;
                
            }
            else
            {
                if (_count3(abcd[0], sys[0], abcd[1], sys[1], _count(abcd[2], sys[2], abcd[3])) == 24)
                    return 1;
                else
                    return 0;
                
            }
        }
        else
        {
            if (_cin[0] == '(')
            {
                if (_count(_count3(abcd[0], sys[0], abcd[1], sys[1], abcd[2]), sys[2], abcd[3]) == 24)
                    return 1;
                else
                    return 0;
                
            }
            else
            {
                if (_count(abcd[0], sys[0], _count3(abcd[1], sys[1], abcd[2], sys[2], abcd[3])) == 24)
                    return 1;
                else
                    return 0;
                
            }
        }
    }
    
    else
    {
        if (p2 > q1)
        {
            int j = 0;
            for (int h = 0; h < q1; h++)
            {
                if ((_cin[h] < 48) && (_cin[h]>41))
                {
                    j++;
                }
            }
            if (_cin[0] == '(')
            {
                if (j == 1)
                {
                    if (_count(_count(_count(abcd[0], sys[0], abcd[1]), sys[1], abcd[2]), sys[2], abcd[3]) == 24)
                        return 1;
                    else
                        return 0;
                    
                }
                else
                {
                    if (_count(_count(abcd[0], sys[0], _count(abcd[1], sys[1], abcd[2])), sys[2], abcd[3]) == 24)
                        return 1;
                    else
                        return 0;
                    
                }
            }
            else
            {
                if (j == 2)
                {
                    if (_count(abcd[0], sys[0], _count(_count(abcd[1], sys[1], abcd[2]), sys[2], abcd[3])) == 24)
                        return 1;
                    else
                        return 0;
                    
                }
                else
                {
                    if (_count(abcd[0], sys[0], _count(abcd[1], sys[1], _count(abcd[2], sys[2], abcd[3]))) == 24)
                        return 1;
                    else
                        return 0;
                    
                }
            }
        }
        else
        {
            if (_count(_count(abcd[0], sys[0], abcd[1]), sys[1], _count(abcd[2], sys[2], abcd[3])) == 24)
                return 1;
            else
                return 0;
            
        }
    }
}




//////////////////////////////







//////////////////////////////
