//
//  Graph.cpp
//  南理工校园导航
//
//  Created by 周子聪 on 16/4/18.
//  Copyright © 2016年 独白SKY. All rights reserved.
//
struct MGraph
{
    int arcs[30][30];
    int vexnum;
};


struct MGraph initByArrage(int a[][30]){
    struct MGraph mygraph;
    mygraph.vexnum=30;
    for (int i=0; i<30; i++) {
        for (int j=0; j<30; j++) {
            if (a[i][j]==0) {
                mygraph.arcs[i][j]=99999;
            }else
                mygraph.arcs[i][j]=a[i][j];
        }
    }
    return mygraph;
}

void ShortestPath_DIJ(int v0,int end, bool p[][30],int D[],struct MGraph mygraph)
{
    bool final[30];
    for (int v=0; v<mygraph.vexnum; v++) {
        final[v]=false;
        D[v]=mygraph.arcs[v0][v];
        for (int w=0; w<mygraph.vexnum; w++) {
            p[v][w]=false;
        }
        if (D[v]<99999) {
            p[v][v0]=p[v][v]=true;
        }
    }
    D[v0]=0;
    final[v0]=true;
    
    
    for (int i=1; i<mygraph.vexnum; i++) {
        int min=99999;
        int v=0;
        for (int w=0; w<mygraph.vexnum; w++) {
            if (!final[w]&&D[w]<min) {
                v=w;
                min=D[w];
            }
        }
        final[v]=true;
        for (int w=0; w<mygraph.vexnum; w++) {
            if (!final[w]&&min<99999&&mygraph.arcs[v][w]<99999&&(min+mygraph.arcs[v][w]<D[w])) {
                D[w]=min+mygraph.arcs[v][w];
                for (int j=0; j<mygraph.vexnum; j++) {
                    p[w][j]=p[v][j];
                }
                p[w][w]=true;
            }
        }
    }
}