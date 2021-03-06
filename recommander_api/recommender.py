# -*- coding: utf-8 -*-
"""Recommender.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1InMBh3SxR1gPW1cJ7OnwPrBKikB9sXEQ
"""
import numpy as np
user_weighted_startup_rating=np.zeros((45,47))
from scipy.stats.stats import pearsonr  
from gensim.test.utils import common_texts
from gensim.models.doc2vec import Doc2Vec, TaggedDocument
documents = [TaggedDocument(doc, [i]) for i, doc in enumerate(common_texts)]
model = Doc2Vec(documents, vector_size=5, window=2, min_count=1, workers=4)
import re
def dot(A,B): 
    return (sum(int(a)*int(b) for a,b in zip(A,B)))

def cosine_similarity(a,b):
    if(dot(a,a)==0):
        return 0
    
    if(dot(b,b)==0):
        return 0
    
    return dot(a,b) / ( (dot(a,a) **.5) * (dot(b,b) ** .5) )

def custom_mean(arr):
    ret_list=[]
    for i in arr.shape[1]:
        c=0
        total=0
        for j in arr.shape[0]:
            if(arr[j][i]!=-1):
                total=total+arr[j][i]
                c=c+1
        total=total/c
        ret_list.append(total)
    return np.array(ret_list)

def cust_pearsonr(arr1,arr2):
    list1=[]
    list2=[]
    for i,item in enumerate(arr1):
        if arr1[i]!=-1 and arr2[i]!=-1:
            list1.append(arr1[i])
            list2.append(arr2[i])
        
    if len(list1)==0:
        return -1;
    pearson=pearsonr(list1,list2)[0]
    return pearson
    
#Most popular
def get_most_pop(startup_list):
    most_popular=custom_mean(user_weighted_startup_rating,axis=0)
    ind=np.argsort(-most_popular)
    c=0
    starutp_list=[]
    for i in ind and c<10:
        print(startup_list[i])
        c+=1
        
def get_most_pop_tagged(tag,startup_list):
    startup_dict={}
    for i,startup in enumerate(startup_list):
        if tag in startup['tags']:
            startup_dict[i]=user_weighted_startup_rating[i]
            break
            
    sorted_dict = sorted(startup_dict.items(), key=operator.itemgetter(1), reverse=True) #reverse
    ret_list=[]
    for i in sorted_dict.keys():
        ret_list.append(startup_list[i])
        
    return ret_list

def compute_rating(feed_data,startup_data):
    for i,row in enumerate(feed_data):
        rating=0
        c=0
        for col in row.keys(): 
            #if row[col]!=NULL:
            if col !='Corp_id' and col!='Startup_id': 
                rating=rating+row[col] #w[col]
                c+=1
        rating=rating/c
        if(rating==0):
            rating=-1
        user_weighted_startup_rating[row['Corp_id']-1][row['Startup_id']-1]=rating
    
    '''
    for i,user in enumerate(users):
        for k,startup in enumerate(startup_data):
            st=0
            for j,col in enumerate(startup.keys()):
                st=st+(1/4)*startup[col]
            
            user_weighted_startup_rating[i][k]+=st/w[j]
    '''
            
(users,startups)=user_weighted_startup_rating.shape
useruserrat=np.zeros((user_weighted_startup_rating.shape[0],user_weighted_startup_rating.shape[1]))



def cold_start(user_id,startup_list):
    startups_sorted=np.argsort(user_weighted_startup_rating[user_id]) #user_id-1
    id=np.argsort(-startups_sorted)[0:2] #reverse
    tag_list=[]
    for i in id:
        tag_list.append(startup_list[i]['Vertical'])
    tag_list.append(corporate_list['Objectives'])
    
    '''
    w2v=0
    for tag in tag_list:
        w2v=w2v+word2vec[tag]
    w2v=w2v/len(tag_list)
    '''
    
    d2v=model.infer_vector(tag_list)
    rec=[]
    for startup in startup_list:
        startup_tag_list=startup['tags']
        startup_tag_list.append(startup['Objectives'])
        rec_val=model.numpy.linalg.norm(infer_vector(startup_tag_list)-d2v)
        rec.append(rec_val)
    
    ind=np.argsort(-rec)[0:5]
    ret_list=[]
    for i in ind:
        ret_list.append(startup_list[i])
    
    return ret_list


def cold_start2(user_id,startup_list,corp_list):
    #startups_sorted=np.argsort(user_weighted_startup_rating[user_id]) #user_id-1
    like_value=[]
    like_value2=[]
    user_tag=None
    
    for i,corp in corp_list.iterrows():
        print(corp['corp1234'])
        user_vertical=None
        if corp['corp1234']==user_id:
            user_tag=""
            user_tag=str(corp['vertical'].lower())
            user_vertical=corp['vertical']
            user_tag=user_tag+" "+corp['Objectives'].lower()
            print(user_tag)
            break
        
    vector = model.infer_vector(user_tag)
    
    for i,startup in startup_list.iterrows():
        #if startup['Vertical']==user_tag:
        val=0
        val=val+(1/4)*int(startup_list.loc[i,'ReliabilityIndex'])
        val=val+(1/4)*int(startup_list.loc[i,'ImpactFactor'])
        val=val+(1/4)*int(startup_list.loc[i,'PerformanceIndex'])
        val=val+(1/4)*int(startup_list.loc[i,'MonetaryIndex'])
        
        doc=startup['tags'].lower()
        doc=doc+startup['vertical'].lower()
        doc_vec=model.infer_vector(doc)
        val=val+cosine_similarity(vector, doc_vec)
        print(cosine_similarity(vector, doc_vec))
        d=startup
        d['Value']=val
        if startup['vertical']==user_vertical:
            like_value.append(d)
        else:
            like_value2.append(d)
        '''    
        else:
            val=0
            for col in startup.keys():
                if col!='Startup_id' and col!='Vertical' and col!='Name':
                    print(col)
                    val=val+(1/4)*int(startup[col])
            doc=startup['tags']
            val=val+cosine_similarity(vector, doc)
            d=startup
            d['Value']=val
            like_value2.append(d)
        '''
    ret_list=sorted(like_value, key = lambda i: i['Value'],reverse=True)
    print(ret_list)
    ret_list2=sorted(like_value2, key = lambda i: i['Value'], reverse=True) 
    ret_list1=[]
    c=0
    for i in ret_list:
        if c<5:
            ret_list1.append(i['startup_id'])
            c+=1
    
    for i in ret_list2:
        if c<10:
            ret_list1.append(i['startup_id'])
            c+=1
    '''
    w2v=0
    for tag in tag_list:
        w2v=w2v+word2vec[tag]
    w2v=w2v/len(tag_list)
    '''
    return ret_list1

        
def get_ratings():
    coru=np.zeros((users,users))
    for i in range(0,users-1):
        for j in range(0,users-1):
            arr1=user_weighted_startup_rating[i,:]
            arr2=user_weighted_startup_rating[j,:]
            print(arr1)
            coru[i][j]=cust_pearsonr(arr1,arr2)
            if np.isnan(coru[i][j]):
                coru[i][j]=0

    for i in range(0,users-1):
        for b in range(0,startups-1):
            sim=0
            norm=0
            for r in range(0,users-1):
                if coru[i][r]>=0:
                    sim=sim+(coru[i][r]*user_weighted_startup_rating[r,b])
                    norm=norm+coru[i][r]
                
            useruserrat[i][b]=(sim/norm)

def get_recommended(user_id,startup_list):
    ind=np.argsort(useruserrat[int(user_id)])
    print(ind)
    c=0
    ret_list=[]
    for i in ind:
        if c<2:
            ret_list.append(startup_list[i])
        c+=1
    return ret_list

#Item Item collaborative
'''
cor=np.zeros((startups,startup))
for i in range(0,startup-1) :
    for j in range(0,startup-1) :
        if not i == j :
            arr1=user_weighted_startup_rating[i,:]
            arr2=user_weighted_startup_rating[j,:]
            cor[i][j]=pearsonr(arr1,arr2)[0];
            if np.isnan(cor[i][j]) :
                cor[i][j]=0

itemitemrat=np.zeros((startup,users))

for i in range(0,startup-1):
    for b in range(0,users-1):
        sim=0
        norm=0
        for r in range(0,startup-1):
            sim=sim+(cor[i][r]*user_weighted_startup_rating[b,r])
            norm=norm+cor[i][r]
        itemitemrat[i][b]=(sim/norm)
'''
'''
def add_new_user(user_ratings):
  weighted_rating=compute_rating(user_ratings)
  user_weighted_startup_rating=np.vstack((weighted_rating,user_weighted_startup_rating))
  coru=np.hstack((coru,np.zeros((coru.shape[0],1))),dtype=coru.dtype)
  for i in user_weighted_startup_rating:
    coru[n][i]=pearsonr(user_weighted_startup_ranking[n:],user_weighted_startup_ranking[j:])[0]
    coru[i][n]=coru[n][i]
'''