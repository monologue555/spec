// 914106840745Dlg.h : header file
//

#if !defined(AFX_914106840745DLG_H__93251881_85B5_4C51_8367_2426BD46A265__INCLUDED_)
#define AFX_914106840745DLG_H__93251881_85B5_4C51_8367_2426BD46A265__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CMy914106840745Dlg dialog

class CMy914106840745Dlg : public CDialog
{
// Construction
public:
	CMy914106840745Dlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CMy914106840745Dlg)
	enum { IDD = IDD_MY914106840745_DIALOG };
	CStatic	m_showpoint;
	int numcard4;
	CButton	m_card4;
	CButton	m_card3;
	CButton	m_card2;
	CButton	m_card1;
	CStatic	m_textoutput;
	//}}AFX_DATA
	int idb_bitmap[55];
	int numcard1;
	int numcard2;
	int numcard3;
	void onbuttonstart();
	CString m_output;
	CString a;
	
	CString m_RS;

	int m_point;
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMy914106840745Dlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CMy914106840745Dlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnButtonleft();
	afx_msg void OnButtonright();
	afx_msg void OnButtonadd();
	afx_msg void OnButtonsub();
	afx_msg void OnButtonmul();
	afx_msg void OnButtondiv();
	afx_msg void OnButtondel();
	afx_msg void OnBUTTONok();
	afx_msg void OnButtonstart();
	afx_msg void OnButtoncard1();
	afx_msg void OnButtoncard2();
	afx_msg void OnButtoncard3();
	afx_msg void OnButtoncard4();
	afx_msg void OnButtonrs();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_914106840745DLG_H__93251881_85B5_4C51_8367_2426BD46A265__INCLUDED_)
