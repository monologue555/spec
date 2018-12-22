// 914106840745Dlg.cpp : implementation file
//

#include "stdafx.h"
#include "914106840745.h"
#include "914106840745Dlg.h"
#include "Caculator1.h"
#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();
	


// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


	void CMy914106840745Dlg::onbuttonstart() 
{
	// TODO: Add your control notification handler code here
	m_textoutput.SetWindowText(m_output);

	

	//洗牌算法
//	for(int i = 0; i < 52; i ++){  
//        int value = i + rand() % (52 - i);
//        int tcard = idb_bitmap[i];  
//        idb_bitmap[i] = idb_bitmap[value];  
//        idb_bitmap[value] = tcard;  
//    }  
//由于洗牌以获取每张牌的花色大小，所以放弃此算法
	srand((unsigned)time(NULL)); 
	int index0=rand()%52;
	int index1=rand()%52;
	int index2=rand()%52;
	int index3=rand()%52;
	
	
	m_card1.SetBitmap(LoadBitmap(AfxGetInstanceHandle(),MAKEINTRESOURCE(idb_bitmap[index0])));
	m_card2.SetBitmap(LoadBitmap(AfxGetInstanceHandle(),MAKEINTRESOURCE(idb_bitmap[index1])));
	m_card3.SetBitmap(LoadBitmap(AfxGetInstanceHandle(),MAKEINTRESOURCE(idb_bitmap[index2])));
	m_card4.SetBitmap(LoadBitmap(AfxGetInstanceHandle(),MAKEINTRESOURCE(idb_bitmap[index3])));
	numcard1=(index0+1)%13;
	numcard2=(index1+1)%13;
	numcard3=(index2+1)%13;
	numcard4=(index3+1)%13;
	if(numcard1==0)
	{
		numcard1+=13;
	}
	if(numcard2==0)
	{
		numcard2+=13;
	}

	if(numcard3==0)
	{
		numcard3+=13;
	}

	if(numcard4==0)
	{
		numcard4+=13;
	}
	
	CCaculator* caculator=new CCaculator; 
	ResultOfString RS[100];
	int IsCaculatorNum= caculator->_ComputerCaculator(numcard1,numcard2,numcard3,numcard4, &RS[0]);
	if(IsCaculatorNum==0)
	{
		if(MessageBox("这四张牌不能计算得到24点!\n\n       点击确认自动换牌")==IDOK)
		{
			this->onbuttonstart();
		}
	}else
	{
		a.Format("(%d,%d,%d,%d)共有%d种24点算法\n", numcard1,numcard2,numcard3,numcard4,IsCaculatorNum);
		m_RS=a;


		m_RS+=" (1) ";
		m_RS+=RS[0]._return;
		for(int i=1;i<IsCaculatorNum;i++)
		{
			CString tem=RS[i]._return;
			a.Format("%d", i+1);
			
			m_RS+=" (";
			m_RS+=a;
			m_RS+=") ";
			m_RS+=tem;
			
		}
	}
	

}

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMy914106840745Dlg dialog

CMy914106840745Dlg::CMy914106840745Dlg(CWnd* pParent /*=NULL*/)
	: CDialog(CMy914106840745Dlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CMy914106840745Dlg)
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
	
	m_output="";
	m_point=0;
	
	idb_bitmap[0]=IDB_BITMAP1;
	idb_bitmap[1]=IDB_BITMAP2;
	idb_bitmap[2]=IDB_BITMAP3;
	idb_bitmap[3]=IDB_BITMAP4;
	idb_bitmap[4]=IDB_BITMAP5;
	idb_bitmap[5]=IDB_BITMAP6;
	idb_bitmap[6]=IDB_BITMAP7;
	idb_bitmap[7]=IDB_BITMAP8;
	idb_bitmap[8]=IDB_BITMAP9;
	idb_bitmap[9]=IDB_BITMAP10;
	idb_bitmap[10]=IDB_BITMAP11;
	idb_bitmap[11]=IDB_BITMAP12;
	idb_bitmap[12]=IDB_BITMAP13;//梅花1~K
	idb_bitmap[13]=IDB_BITMAP14;
	idb_bitmap[14]=IDB_BITMAP15;
	idb_bitmap[15]=IDB_BITMAP16;
	idb_bitmap[16]=IDB_BITMAP17;
	idb_bitmap[17]=IDB_BITMAP18;
	idb_bitmap[18]=IDB_BITMAP19;
	idb_bitmap[19]=IDB_BITMAP20;
	idb_bitmap[20]=IDB_BITMAP21;
	idb_bitmap[21]=IDB_BITMAP22;
	idb_bitmap[22]=IDB_BITMAP23;
	idb_bitmap[23]=IDB_BITMAP24;
	idb_bitmap[24]=IDB_BITMAP25;
	idb_bitmap[25]=IDB_BITMAP26;//方块1~K
	idb_bitmap[26]=IDB_BITMAP27;
	idb_bitmap[27]=IDB_BITMAP28;
	idb_bitmap[28]=IDB_BITMAP29;
	idb_bitmap[29]=IDB_BITMAP30;
	idb_bitmap[30]=IDB_BITMAP31;
	idb_bitmap[31]=IDB_BITMAP32;
	idb_bitmap[32]=IDB_BITMAP33;
	idb_bitmap[33]=IDB_BITMAP34;
	idb_bitmap[34]=IDB_BITMAP35;	
	idb_bitmap[35]=IDB_BITMAP36;
	idb_bitmap[36]=IDB_BITMAP37;
	idb_bitmap[37]=IDB_BITMAP38;
	idb_bitmap[38]=IDB_BITMAP39;//红桃1~K
	idb_bitmap[39]=IDB_BITMAP40;
	idb_bitmap[40]=IDB_BITMAP41;
	idb_bitmap[41]=IDB_BITMAP42;
	idb_bitmap[42]=IDB_BITMAP43;
	idb_bitmap[43]=IDB_BITMAP44;
	idb_bitmap[44]=IDB_BITMAP45;
	idb_bitmap[45]=IDB_BITMAP46;
	idb_bitmap[46]=IDB_BITMAP47;
	idb_bitmap[47]=IDB_BITMAP48;
	idb_bitmap[48]=IDB_BITMAP49;
	idb_bitmap[49]=IDB_BITMAP50;
	idb_bitmap[50]=IDB_BITMAP51;
	idb_bitmap[51]=IDB_BITMAP52;//黑桃1~K
	idb_bitmap[52]=IDB_BITMAP53;//小王
	idb_bitmap[53]=IDB_BITMAP54;//大王
	idb_bitmap[54]=IDB_BITMAP55;
}

void CMy914106840745Dlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CMy914106840745Dlg)
	DDX_Control(pDX, IDC_TEXTPOINT, m_showpoint);
	DDX_Control(pDX, IDC_BUTTONCARD4, m_card4);
	DDX_Control(pDX, IDC_BUTTONCARD3, m_card3);
	DDX_Control(pDX, IDC_BUTTONCARD2, m_card2);
	DDX_Control(pDX, IDC_BUTTONCARD1, m_card1);
	DDX_Control(pDX, IDC_TEXTOUTPUT, m_textoutput);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CMy914106840745Dlg, CDialog)
	//{{AFX_MSG_MAP(CMy914106840745Dlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTONLEFT, OnButtonleft)
	ON_BN_CLICKED(IDC_BUTTONRIGHT, OnButtonright)
	ON_BN_CLICKED(IDC_BUTTONADD, OnButtonadd)
	ON_BN_CLICKED(IDC_BUTTONSUB, OnButtonsub)
	ON_BN_CLICKED(IDC_BUTTONMUL, OnButtonmul)
	ON_BN_CLICKED(IDC_BUTTONDIV, OnButtondiv)
	ON_BN_CLICKED(IDC_BUTTONDEL, OnButtondel)
	ON_BN_CLICKED(IDC_BUTTONOK, OnBUTTONok)
	ON_BN_CLICKED(IDC_BUTTONSTART, OnButtonstart)
	ON_BN_CLICKED(IDC_BUTTONCARD1, OnButtoncard1)
	ON_BN_CLICKED(IDC_BUTTONCARD2, OnButtoncard2)
	ON_BN_CLICKED(IDC_BUTTONCARD3, OnButtoncard3)
	ON_BN_CLICKED(IDC_BUTTONCARD4, OnButtoncard4)
	ON_BN_CLICKED(IDC_BUTTONRS, OnButtonrs)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMy914106840745Dlg message handlers

BOOL CMy914106840745Dlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CMy914106840745Dlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CMy914106840745Dlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CMy914106840745Dlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

//DEL void CMy914106840745Dlg::OnCard1() 
//DEL {
//DEL 	// TODO: Add your control notification handler code here
//DEL 	
//DEL }

//DEL void CMy914106840745Dlg::OnCard2() 
//DEL {
//DEL 	// TODO: Add your control notification handler code here
//DEL 
//DEL }

//DEL void CMy914106840745Dlg::OnCard3() 
//DEL {
//DEL 	// TODO: Add your control notification handler code here
//DEL 	
//DEL }

//DEL void CMy914106840745Dlg::OnCard4() 
//DEL {
//DEL 	// TODO: Add your control notification handler code here
//DEL 	
//DEL }

void CMy914106840745Dlg::OnButtonleft() 
{
	CString a="(";
	// TODO: Add your control notification handler code here
	m_output+=a;
	m_textoutput.SetWindowText(m_output);
}

void CMy914106840745Dlg::OnButtonright() 
{
	CString a=")";
	// TODO: Add your control notification handler code here
	m_output+=a;
	m_textoutput.SetWindowText(m_output);
}

void CMy914106840745Dlg::OnButtonadd() 
{
	CString a="+";
	// TODO: Add your control notification handler code here
	m_output+=a;
	m_textoutput.SetWindowText(m_output);
}

void CMy914106840745Dlg::OnButtonsub() 
{
	CString a="-";
	// TODO: Add your control notification handler code here
	m_output+=a;
	m_textoutput.SetWindowText(m_output);
}

void CMy914106840745Dlg::OnButtonmul() 
{
	CString a="*";
	// TODO: Add your control notification handler code here
	m_output+=a;
	m_textoutput.SetWindowText(m_output);
}

void CMy914106840745Dlg::OnButtondiv() 
{
	CString a="/";
	// TODO: Add your control notification handler code here
	m_output+=a;
	m_textoutput.SetWindowText(m_output);
}

void CMy914106840745Dlg::OnButtondel() 
{
	// TODO: Add your control notification handler code here
	m_output="";
	m_textoutput.SetWindowText(m_output);
}

void CMy914106840745Dlg::OnBUTTONok() 
{
	// TODO: Add your control notification handler code here
	char c[19];
	strcpy(c,m_output);
	m_output="";
	CCaculator* caculator=new CCaculator;
	int TorF = caculator->_ManualCaculator(c);
	if(TorF==1)
	{	
		m_point+=10;
		a.Format("%d", m_point);
		m_showpoint.SetWindowText(a);
		MessageBox("正确，获得10分!","得分");
		this->onbuttonstart();
	}else
	{
		m_point-=5;
		a.Format("%d", m_point);
		m_showpoint.SetWindowText(a);
		MessageBox("错误，扣除5分!","失分");
		this->onbuttonstart();
	}
}


void CMy914106840745Dlg::OnButtonstart() 
{
	// TODO: Add your control notification handler code here

	m_textoutput.SetWindowText(m_output);
	

	//洗牌算法
//	for(int i = 0; i < 52; i ++){  
//        int value = i + rand() % (52 - i);
//        int tcard = idb_bitmap[i];  
//        idb_bitmap[i] = idb_bitmap[value];  
//        idb_bitmap[value] = tcard;  
//    }  
//由于洗牌以获取每张牌的花色大小，所以放弃此算法
	srand((unsigned)time(NULL)); 
	int index0=rand()%52;
	int index1=rand()%52;
	int index2=rand()%52;
	int index3=rand()%52;
	
	
	m_card1.SetBitmap(LoadBitmap(AfxGetInstanceHandle(),MAKEINTRESOURCE(idb_bitmap[index0])));
	m_card2.SetBitmap(LoadBitmap(AfxGetInstanceHandle(),MAKEINTRESOURCE(idb_bitmap[index1])));
	m_card3.SetBitmap(LoadBitmap(AfxGetInstanceHandle(),MAKEINTRESOURCE(idb_bitmap[index2])));
	m_card4.SetBitmap(LoadBitmap(AfxGetInstanceHandle(),MAKEINTRESOURCE(idb_bitmap[index3])));
	numcard1=(index0+1)%13;
	numcard2=(index1+1)%13;
	numcard3=(index2+1)%13;
	numcard4=(index3+1)%13;
	if(numcard1==0)
	{
		numcard1+=13;
	}
	if(numcard2==0)
	{
		numcard2+=13;
	}

	if(numcard3==0)
	{
		numcard3+=13;
	}

	if(numcard4==0)
	{
		numcard4+=13;
	}
	
	CCaculator* caculator=new CCaculator; 
	ResultOfString RS[100];
	int IsCaculatorNum= caculator->_ComputerCaculator(numcard1,numcard2,numcard3,numcard4, &RS[0]);
	if(IsCaculatorNum==0)
	{
		if(MessageBox("这四张牌不能计算得到24点!\n\n       点击确认自动换牌")==IDOK)
		{
			this->onbuttonstart();
		}
	}else
	{
		a.Format("(%d,%d,%d,%d)共有%d种24点算法\n", numcard1,numcard2,numcard3,numcard4,IsCaculatorNum);
		m_RS=a;


		m_RS+=" (1) ";
		m_RS+=RS[0]._return;
		for(int i=1;i<IsCaculatorNum;i++)
		{
			CString tem=RS[i]._return;
			a.Format("%d", i+1);
			
			m_RS+=" (";
			m_RS+=a;
			m_RS+=") ";
			m_RS+=tem;
			
		}
	}
	

}

void CMy914106840745Dlg::OnButtoncard1() 
{
	
	a.Format("%d", numcard1);
	// TODO: Add your control notification handler code here
	m_output+=a;
	m_textoutput.SetWindowText(m_output);
}

void CMy914106840745Dlg::OnButtoncard2() 
{

	a.Format("%d", numcard2);
	// TODO: Add your control notification handler code here
	m_output+=a;
	m_textoutput.SetWindowText(m_output);
}

void CMy914106840745Dlg::OnButtoncard3() 
{

	a.Format("%d", numcard3);
	// TODO: Add your control notification handler code here
	m_output+=a;
	m_textoutput.SetWindowText(m_output);
}

void CMy914106840745Dlg::OnButtoncard4() 
{

	a.Format("%d", numcard4);
	// TODO: Add your control notification handler code here
	m_output+=a;
	m_textoutput.SetWindowText(m_output);
}

void CMy914106840745Dlg::OnButtonrs() 
{
	// TODO: Add your control notification handler code here
	if(m_RS.Compare("")!=0)
	{
		MessageBox(m_RS);
	}
}
