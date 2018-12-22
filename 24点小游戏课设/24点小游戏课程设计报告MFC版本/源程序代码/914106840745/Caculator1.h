// Caculator1.h: interface for the CCaculator class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_CACULATOR1_H__2E611CFC_0F84_498A_BF67_11C8704353C0__INCLUDED_)
#define AFX_CACULATOR1_H__2E611CFC_0F84_498A_BF67_11C8704353C0__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

struct ResultOfString{
		char _return[19];
	};
class CCaculator  
{
public:
	

	CCaculator();
	virtual ~CCaculator();
	int _ComputerCaculator(int get1,int get2,int get3,int get4,struct ResultOfString* RS);
	int _ManualCaculator(const char* _cin);
};

#endif // !defined(AFX_CACULATOR1_H__2E611CFC_0F84_498A_BF67_11C8704353C0__INCLUDED_)
