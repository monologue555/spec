//
//  TheGameViewController.m
//  24点
//
//  Created by 周子聪 on 15/9/15.
//  Copyright (c) 2015年 独白SKY. All rights reserved.
//

#import "TheGameViewController.h"
#import "Deck.h"
#import "AppDelegate.h"
@interface TheGameViewController ()

@end

@implementation TheGameViewController
@synthesize Goal;
@synthesize Equal24;
@synthesize myTimer;
@synthesize Timer;
@synthesize progressView;
@synthesize VMwareImage;
@synthesize Begain;
@synthesize Point;
@synthesize resultString;
@synthesize CloseButton;
@synthesize Add;
@synthesize Sub;
@synthesize Mul;
@synthesize Div;
@synthesize LeftBracket;
@synthesize RightBracket;
@synthesize Card1;
@synthesize Card2;
@synthesize Card3;
@synthesize Card4;
@synthesize Back;
@synthesize stringOfCalculate;
@synthesize Equal;





int _ComputerCaculator(int get1,int get2,int get3,int get4,struct ResultOfString* RS){
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









int _ManualCaculator(const char* _cin)
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



//////////////////////////////


- (void)setChooseCardTag:(int)Tag ByIndex:(int)i{
    ChooseCardTag[i]=Tag;
}
- (int) getChooseCardTagByIdex:(int)i{
    return ChooseCardTag[i];
}


//倒计时进度条缩短
- (void)decrease{
    progressView.progress-=0.002;
    Timer.text=[NSString stringWithFormat:@"剩余时间:%i秒",(int)(progressView.progress*500)];
    if (progressView.progress==0) {
        [myTimer invalidate];
        NSString* PointString=[NSString stringWithFormat:@"最后得分为%i",Point];
        UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"游戏时间到!" message:PointString delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        alert.tag=3;
        [alert show];
    }
}

- (IBAction)ClickGetFourPoker:(id)sender{
    
    
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    [Card1 setImage:myDelegate.backgroundOfPoker forState:UIControlStateNormal];
    [Card2 setImage:myDelegate.backgroundOfPoker forState:UIControlStateNormal];
    [Card3 setImage:myDelegate.backgroundOfPoker forState:UIControlStateNormal];
    [Card4 setImage:myDelegate.backgroundOfPoker forState:UIControlStateNormal];
    [VMwareImage setImage:myDelegate.backgroundOfPoker];
    
    
    //秒计时开始
    myTimer=[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(decrease) userInfo:nil repeats:YES];
    
    
    [Begain setEnabled:0];
    
    [UIView animateWithDuration:2
                     animations:^{
                         self.Begain.alpha=0;
                     }
                     completion:nil];
    
    
    CGAffineTransform  transform;
    transform = CGAffineTransformScale(Card1.transform,0.75,0.75);
    [UIView beginAnimations:@"scale" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    [Card1 setTransform:transform];
    [UIView commitAnimations];
    
    [UIView animateWithDuration:1
                     animations:^{
                         Card1.transform = CGAffineTransformTranslate(Card1.transform,-123,-153);
                     }
                     completion:nil];
    
    
    [UIView beginAnimations:@"scale" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:1];
    [UIView setAnimationDelegate:self];
    [Card2 setTransform:transform];
    [UIView commitAnimations];
    
    [UIView animateWithDuration:1 delay:1 options:0
                     animations:^{
                         Card2.transform = CGAffineTransformTranslate(Card1.transform,82,0);
                     }
                     completion:nil];
    
    
    [UIView beginAnimations:@"scale" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:2];
    [UIView setAnimationDelegate:self];
    [Card3 setTransform:transform];
    [UIView commitAnimations];
    
    [UIView animateWithDuration:1 delay:2 options:0
                     animations:^{
                         Card3.transform = CGAffineTransformTranslate(Card1.transform,164,0);
                     }
                     completion:nil];
    
    
    [UIView beginAnimations:@"scale" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:3];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(StopAnimation)];
    [Card4 setTransform:transform];
    [UIView commitAnimations];
    
    [UIView animateWithDuration:1
                          delay:3
                        options:0
                     animations:^{
                         Card4.transform = CGAffineTransformTranslate(Card1.transform,246,0);
                     }
                     completion:nil];

   
    
    
    
    
}
- (void)StopAnimation{
    [self doflip];
    [UIView animateWithDuration:4
                     animations:^{
                         VMwareImage.alpha=0;
                     }
                     completion:nil];
    
    [UIView animateWithDuration:4
                     animations:^{
                         Add.alpha=1;
                     }
                     completion:nil];

    [UIView animateWithDuration:4
                     animations:^{
                         Sub.alpha=1;
                     }
                     completion:nil];
    [UIView animateWithDuration:4
                     animations:^{
                         Mul.alpha=1;
                     }
                     completion:nil];
    [UIView animateWithDuration:4
                     animations:^{
                         Div.alpha=1;
                     }
                     completion:nil];
    [UIView animateWithDuration:4
                     animations:^{
                         LeftBracket.alpha=1;
                     }
                     completion:nil];
    [UIView animateWithDuration:4
                     animations:^{
                         RightBracket.alpha=1;
                     }
                     completion:nil];
    [UIView animateWithDuration:4
                     animations:^{
                         Back.alpha=1;
                     }
                     completion:nil];
    [UIView animateWithDuration:4
                     animations:^{
                         Equal.alpha=1;
                     }
                     completion:nil];
    [UIView animateWithDuration:4
                     animations:^{
                         stringOfCalculate.alpha=1;
                     }
                     completion:nil];
    [UIView animateWithDuration:4
                     animations:^{
                         Timer.alpha=1;
                     }
                     completion:nil];
    [UIView animateWithDuration:4
                     animations:^{
                         progressView.alpha=1;
                     }
                     completion:nil];
    [UIView animateWithDuration:4
                     animations:^{
                         Equal24.alpha=1;
                     }
                     completion:nil];
    Goal.text=@"0";
}


//- (IBAction)ClickAdd:(id)sender{
//
//}
//- (IBAction)ClickSub:(id)sender{
//    ;
//}
//- (IBAction)ClickMul:(id)sender{
//    ;
//}
//- (IBAction)ClickDiv:(id)sender{
//    ;
//}
//- (IBAction)ClickLeftBracket:(id)sender{
//}
//- (IBAction)ClickRightBracket:(id)sender{
//}

- (IBAction)ClickCard:(id)sender{
    switch ([sender tag]) {
        case 1:
        case 2:
        case 3:
        case 4:
            [Add setEnabled:0];
            [Sub setEnabled:0];
            [Mul setEnabled:0];
            [Div setEnabled:0];
            [LeftBracket setEnabled:1];
            [RightBracket setEnabled:1];
            [Card1 setEnabled:1];
            [Card2 setEnabled:1];
            [Card3 setEnabled:1];
            [Card4 setEnabled:1];
            break;
        case 5:
            [Add setEnabled:0];
            [Sub setEnabled:0];
            [Mul setEnabled:0];
            [Div setEnabled:0];
            [LeftBracket setEnabled:1];
            [RightBracket setEnabled:0];
            [Card1 setEnabled:1];
            [Card2 setEnabled:1];
            [Card3 setEnabled:1];
            [Card4 setEnabled:1];
            break;
        case 6:
            [Add setEnabled:1];
            [Sub setEnabled:1];
            [Mul setEnabled:1];
            [Div setEnabled:1];
            [LeftBracket setEnabled:0];
            [RightBracket setEnabled:1];
            [Card1 setEnabled:0];
            [Card2 setEnabled:0];
            [Card3 setEnabled:0];
            [Card4 setEnabled:0];
            if (ChooseTimeOfCard==4) {
                [Add setEnabled:0];
                [Sub setEnabled:0];
                [Mul setEnabled:0];
                [Div setEnabled:0];
                [LeftBracket setEnabled:0];
                [RightBracket setEnabled:1];
                [Card1 setEnabled:0];
                [Card2 setEnabled:0];
                [Card3 setEnabled:0];
                [Card4 setEnabled:0];
            }
            break;
        case 7:
        case 8:
        case 9:
        case 10:
            [Add setEnabled:1];
            [Sub setEnabled:1];
            [Mul setEnabled:1];
            [Div setEnabled:1];
            [LeftBracket setEnabled:0];
            [RightBracket setEnabled:1];
            [Card1 setEnabled:0];
            [Card2 setEnabled:0];
            [Card3 setEnabled:0];
            [Card4 setEnabled:0];
            ChooseCardTag[ChooseTimeOfCard]=(int)[sender tag];
            ChooseTimeOfCard++;
            if (ChooseTimeOfCard==4) {
                [Add setEnabled:0];
                [Sub setEnabled:0];
                [Mul setEnabled:0];
                [Div setEnabled:0];
                [LeftBracket setEnabled:0];
            }
            break;
        default:
            break;
    }
    //让选过的牌不可用
    for (int i=0; i<ChooseTimeOfCard; i++) {
        [(UIButton *)[self.view viewWithTag:ChooseCardTag[i]] setEnabled:0] ;
    }
    //
    [caculatorString addObject:[sender titleForState:UIControlStateNormal]];
    [str appendString:[caculatorString objectAtIndex:index]];
    stringOfCalculate.text = (NSString*)str;
    index++;
}

- (IBAction)ClickBack:(id)sender{
        if (index!=0) {
            NSString* str0=[caculatorString objectAtIndex:index-1];
            if ([str0 isEqualToString:@"+"]||[str0 isEqualToString:@"-"]||[str0 isEqualToString:@"*"]||
                [str0 isEqualToString:@"/"]){
                if ([[caculatorString objectAtIndex:index-2] isEqualToString:@")"]) {
                    [Add setEnabled:1];
                    [Sub setEnabled:1];
                    [Mul setEnabled:1];
                    [Div setEnabled:1];
                    [LeftBracket setEnabled:0];
                    [RightBracket setEnabled:1];
                    [Card1 setEnabled:1];
                    [Card2 setEnabled:1];
                    [Card3 setEnabled:1];
                    [Card4 setEnabled:1];
                }else
                    [Add setEnabled:1];
                    [Sub setEnabled:1];
                    [Mul setEnabled:1];
                    [Div setEnabled:1];
                    [LeftBracket setEnabled:1];
                    [RightBracket setEnabled:1];
                    [Card1 setEnabled:0];
                    [Card2 setEnabled:0];
                    [Card3 setEnabled:0];
                    [Card4 setEnabled:0];
            }
            else if ([str0 isEqualToString:@"("]){
                if (index>1&&(![[caculatorString objectAtIndex:index-2] isEqualToString:@"("])) {
                    [Add setEnabled:0];
                    [Sub setEnabled:0];
                    [Mul setEnabled:0];
                    [Div setEnabled:0];
                    [LeftBracket setEnabled:1];
                    [RightBracket setEnabled:1];
                    [Card1 setEnabled:1];
                    [Card2 setEnabled:1];
                    [Card3 setEnabled:1];
                    [Card4 setEnabled:1];
                }
            }
            else if ([str0 isEqualToString:@")"]){
                if (![[caculatorString objectAtIndex:index-2] isEqualToString:@")"]) {
                    [Add setEnabled:1];
                    [Sub setEnabled:1];
                    [Mul setEnabled:1];
                    [Div setEnabled:1];
                    [LeftBracket setEnabled:0];
                    [RightBracket setEnabled:1];
                    [Card1 setEnabled:0];
                    [Card2 setEnabled:0];
                    [Card3 setEnabled:0];
                    [Card4 setEnabled:0];
                    if (ChooseTimeOfCard==4) {
                        [Add setEnabled:0];
                        [Sub setEnabled:0];
                        [Mul setEnabled:0];
                        [Div setEnabled:0];
                        [LeftBracket setEnabled:0];
                    }
                }
            }
            else if (index==1||[[caculatorString objectAtIndex:index-2]isEqualToString:@"("]) {
                    [Add setEnabled:0];
                    [Sub setEnabled:0];
                    [Mul setEnabled:0];
                    [Div setEnabled:0];
                    [LeftBracket setEnabled:1];
                    [RightBracket setEnabled:0];
                    [Card1 setEnabled:1];
                    [Card2 setEnabled:1];
                    [Card3 setEnabled:1];
                    [Card4 setEnabled:1];
                    ChooseTimeOfCard--;
            }
            else
            {
                [Add setEnabled:0];
                [Sub setEnabled:0];
                [Mul setEnabled:0];
                [Div setEnabled:0];
                [LeftBracket setEnabled:1];
                [RightBracket setEnabled:1];
                [Card1 setEnabled:1];
                [Card2 setEnabled:1];
                [Card3 setEnabled:1];
                [Card4 setEnabled:1];
                ChooseTimeOfCard--;
            }
        }
    if (index!=0) {
        index--;
        [caculatorString removeObjectAtIndex:index];
    }
    
    str=[[NSMutableString alloc] initWithCapacity:40];
    for (int i=0; i<index; i++){
        [str appendString:[caculatorString objectAtIndex:i]];
    }
    stringOfCalculate.text = (NSString*)str;
}

- (IBAction)ClickEqual:(id)sender{
    
    
    [UIView beginAnimations:@"doflip" context:nil];
    //设置时常
    [UIView setAnimationDuration:1];
    //设置动画淡入淡出
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //设置代理
    [UIView setAnimationDelegate:self];
    //设置翻转方向
    [UIView setAnimationTransition:
     UIViewAnimationTransitionFlipFromLeft  forView:Card1 cache:YES];
    //动画结束
    [UIView commitAnimations];
    
    [UIView beginAnimations:@"doflip" context:nil];
    //设置时常
    [UIView setAnimationDuration:1];
    //设置动画淡入淡出
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //设置代理
    [UIView setAnimationDelegate:self];
    //设置翻转方向
    [UIView setAnimationTransition:
     UIViewAnimationTransitionFlipFromLeft  forView:Card2 cache:YES];
    
    
    //动画结束
    [UIView commitAnimations];
    
    [UIView beginAnimations:@"doflip" context:nil];
    //设置时常
    [UIView setAnimationDuration:1];
    //设置动画淡入淡出
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //设置代理
    [UIView setAnimationDelegate:self];
    //设置翻转方向
    [UIView setAnimationTransition:
     UIViewAnimationTransitionFlipFromLeft  forView:Card3 cache:YES];
    
    
    //动画结束
    [UIView commitAnimations];
    
    [UIView beginAnimations:@"doflip" context:nil];
    //设置时常
    [UIView setAnimationDuration:1];
    //设置动画淡入淡出
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //设置代理
    [UIView setAnimationDelegate:self];
    //设置翻转方向
    [UIView setAnimationTransition:
     UIViewAnimationTransitionFlipFromLeft  forView:Card4 cache:YES];
    //动画结束
    [UIView commitAnimations];
    
    
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    
    [Card1 setImage:myDelegate.backgroundOfPoker forState:UIControlStateNormal];
    [Card2 setImage:myDelegate.backgroundOfPoker forState:UIControlStateNormal];
    [Card3 setImage:myDelegate.backgroundOfPoker forState:UIControlStateNormal];
    [Card4 setImage:myDelegate.backgroundOfPoker forState:UIControlStateNormal];

    
    
    const char* Cin =[stringOfCalculate.text UTF8String];
    BOOL IsCorrect=_ManualCaculator(Cin);
    if (IsCorrect) {
        UIAlertView* GetPointAlertView = [[UIAlertView alloc] initWithTitle:@"算式成立" message:@"加20分\n加30秒" delegate:self cancelButtonTitle:@"继续" otherButtonTitles:@"查看所有算法", nil];
        GetPointAlertView.tag=1;
        [GetPointAlertView show];
        
        self.Point+=20;
        Goal.text
        =[NSString stringWithFormat:@"%i",Point];
        progressView.progress+=0.06;
        
    }
    else{
        UIAlertView* DecPointAlertView = [[UIAlertView alloc] initWithTitle:@"算式不成立" message:@"减5分\n减5秒" delegate:self cancelButtonTitle:@"换牌继续" otherButtonTitles:@"查看所有算法", nil];
        DecPointAlertView.tag=2;
        [DecPointAlertView show];
        
        self.Point-=5;
        Goal.text
        =[NSString stringWithFormat:@"%i",Point];
        progressView.progress-=0.01;
    }
}




-(void)doflip{
    
    
    //设置翻转方向
    [UIView beginAnimations:@"doflip" context:nil];
    //设置时常
    [UIView setAnimationDuration:2];
    //设置动画淡入淡出
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //设置代理
    [UIView setAnimationDelegate:self];
    //设置翻转方向
    [UIView setAnimationTransition:
     UIViewAnimationTransitionFlipFromLeft  forView:Card1 cache:YES];
    
    
    //动画结束
    [UIView commitAnimations];
    
    
    [UIView beginAnimations:@"doflip" context:nil];
    //设置时常
    [UIView setAnimationDuration:2];
    //设置动画淡入淡出
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //设置代理
    [UIView setAnimationDelegate:self];
    //设置翻转方向
    [UIView setAnimationTransition:
     UIViewAnimationTransitionFlipFromRight  forView:Card2 cache:YES];
    
    
    //动画结束
    [UIView commitAnimations];
    
    [UIView beginAnimations:@"doflip" context:nil];
    //设置时常
    [UIView setAnimationDuration:2];
    //设置动画淡入淡出
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //设置代理
    [UIView setAnimationDelegate:self];
    //设置翻转方向
    [UIView setAnimationTransition:
     UIViewAnimationTransitionFlipFromLeft  forView:Card3 cache:YES];
    
    
    //动画结束
    [UIView commitAnimations];
    
    [UIView beginAnimations:@"doflip" context:nil];
    //设置时常
    [UIView setAnimationDuration:2];
    //设置动画淡入淡出
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //设置代理
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(DidDoFlip)];
    //设置翻转方向
    [UIView setAnimationTransition:
     UIViewAnimationTransitionFlipFromRight  forView:Card4 cache:YES];
    
    //动画结束
    [UIView commitAnimations];
    
    
    
    
    
    
    Deck *deck=[[Deck alloc] init];
    [deck shuffle];
    NSString* pokerImageName[53];
    int i;
    for (i=1; i<53; i++) {
        pokerImageName[i] = [[NSString alloc] initWithFormat:@"%i_%i.jpg",[deck getCard:i].eSuit,[deck getCard:i].Point];
    }
    [self.Card1 setImage:[UIImage imageNamed:pokerImageName[1]] forState:UIControlStateNormal];
    [self.Card1 setTitle:[[NSString alloc] initWithFormat:@"%i",[deck getCard:1].Point] forState:UIControlStateNormal];
    [self.Card2 setImage:[UIImage imageNamed:pokerImageName[2]] forState:UIControlStateNormal];
    [self.Card2 setTitle:[[NSString alloc] initWithFormat:@"%i",[deck getCard:2].Point] forState:UIControlStateNormal];
    [self.Card3 setImage:[UIImage imageNamed:pokerImageName[3]] forState:UIControlStateNormal];
    [self.Card3 setTitle:[[NSString alloc] initWithFormat:@"%i",[deck getCard:3].Point] forState:UIControlStateNormal];
    [self.Card4 setImage:[UIImage imageNamed:pokerImageName[4]] forState:UIControlStateNormal];
    [self.Card4 setTitle:[[NSString alloc] initWithFormat:@"%i",[deck getCard:4].Point] forState:UIControlStateNormal];
    
    

    
    
    caculatorString = [[NSMutableArray alloc] initWithCapacity:20];
    str = [[NSMutableString alloc] initWithCapacity:40];
    [Add setEnabled:0];
    [Sub setEnabled:0];
    [Mul setEnabled:0];
    [Div setEnabled:0];
    int a,b,c,d;
    a=[deck getCard:1].Point;
    b=[deck getCard:2].Point;
    c=[deck getCard:3].Point;
    d=[deck getCard:4].Point;

    NumOfResut =_ComputerCaculator(a,b,c,d,ResultString);
    if (NumOfResut==0) {
        UIAlertView* can_tCaculatorAlert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"无法得到24点" delegate:self cancelButtonTitle:nil otherButtonTitles:@"换四张牌", nil];
        can_tCaculatorAlert.tag=0;
        [can_tCaculatorAlert show];
    }

}

- (void)DidDoFlip{
    
    index=0;
    ChooseTimeOfCard=0;
    
    [Add setEnabled:0];
    [Sub setEnabled:0];
    [Mul setEnabled:0];
    [Div setEnabled:0];
    [LeftBracket setEnabled:1];
    [RightBracket setEnabled:0];
    [Card1 setEnabled:1];
    [Card2 setEnabled:1];
    [Card3 setEnabled:1];
    [Card4 setEnabled:1];
}


//- (void)timeCount{//倒计时函数
//    timer_show = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 85, 30)];//UILabel设置成和UIButton一样的尺寸和位置
//    MZTimerLabel *timer_cutDown = [[MZTimerLabel alloc] initWithLabel:timer_show andTimerType:MZTimerLabelTypeTimer];//创建MZTimerLabel类的对象timer_cutDown
//    [timer_cutDown setCountDownTime:60];//倒计时时间60s
//    timer_cutDown.timeFormat = @"倒计时 ss";//倒计时格式,也可以是@"HH:mm:ss SS"，时，分，秒，毫秒；想用哪个就写哪个
//    timer_cutDown.timeLabel.textColor = [UIColor whiteColor];//倒计时字体颜色
//    timer_cutDown.timeLabel.font = [UIFont systemFontOfSize:13.0];//倒计时字体大小
//    timer_cutDown.timeLabel.textAlignment = NSTextAlignmentCenter;//剧中
//    timer_cutDown.delegate = self;//设置代理，以便后面倒计时结束时调用代理
//    _dynamicCode_btn.userInteractionEnabled = NO;//按钮禁止点击
//    [timer_cutDown start];//开始计时
//}

/////////////////////
//报警提示控件委托方法//
/////////////////////
- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //没有算法AlertView
    switch (alertView.tag) {
        case 0:
            if (buttonIndex==0) {
                [self doflip];
            }
            break;
        case 1:
            if (buttonIndex==0) {
                
                [self doflip];
            }
            else{
                
                NSMutableString* string=[[NSMutableString alloc] initWithCapacity:2000];
                for (int i=0; i<NumOfResut; i++) {
                    [string appendFormat:@"\n%s",ResultString[i]._return];
                }
                resultString.text=string;
                
                resultString.transform = CGAffineTransformTranslate(resultString.transform,280,0);
//                CGRect frame=resultString.frame;
//                frame.origin.x+=400;
//                resultString.frame=frame;
                CloseButton.transform = CGAffineTransformTranslate(CloseButton.transform,280,0);
            }
            break;
        case 2:
            if (buttonIndex==0) {
                [self doflip];
            }
            else{
                
                NSMutableString* string=[[NSMutableString alloc] initWithCapacity:2000];
                for (int i=0; i<NumOfResut; i++) {
                    [string appendFormat:@"%s\n",ResultString[i]._return];
                }
                resultString.text=string;
                
                resultString.transform = CGAffineTransformTranslate(resultString.transform,280,0);
//                CGRect frame=resultString.frame;
//                frame.origin.x+=280;
//                resultString.frame=frame;
                CloseButton.transform = CGAffineTransformTranslate(CloseButton.transform,280,0);
            }
            break;

        case 3:
            if (buttonIndex==0) {
                [self CloseView:nil];
            }
            break;
        default:
            break;
    }
}

























- (IBAction)closetextview:(id)sender {
//    CGRect frame=resultString.frame;
//    frame.origin.x-=280;
//    resultString.frame=frame;
    
    //上面是失败的方法，控件移动后只会短暂停留然后回归原位
    
    resultString.transform = CGAffineTransformTranslate(resultString.transform,-280,0);
    //                CGRect frame=resultString.frame;
    //                frame.origin.x+=280;
    //                resultString.frame=frame;
    CloseButton.transform = CGAffineTransformTranslate(CloseButton.transform,-280,0);
    
//关闭查看所有算法后自动换牌
    [self doflip];
    
}

- (IBAction)CloseView:(id)sender {
    [self.view removeFromSuperview];
    Add.alpha=0;
    Sub.alpha=0;
    Mul.alpha=0;
    Div.alpha=0;
    LeftBracket.alpha=0;
    RightBracket.alpha=0;
    stringOfCalculate.alpha=0;
    stringOfCalculate.text=@"0";
    Timer.alpha=0;
    Timer.text=@"";
    Equal.alpha=0;
    VMwareImage.alpha=1;
    progressView.progress=0.61;
    progressView.alpha=0;
    Begain.alpha=1;
    [Begain setEnabled:1];
    Equal24.alpha=0;
    Goal.text=@"";
    Goal.alpha=0;
    Back.alpha=0;
    

}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
