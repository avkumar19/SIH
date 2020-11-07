#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Feb 24 18:23:00 2019

@author: avinash
"""
def finder(query):
    import pandas as pd
    from nltk.corpus import stopwords
    from nltk.tokenize import word_tokenize
    stop_words = ["i", "me", "my", "myself", "we", "our", "ours", "ourselves", "you", "your", "yours", "yourself", "yourselves", "he", "him", "his", "himself", "she", "her", "hers", "herself", "it", "its", "itself", "they", "them", "their", "theirs", "themselves", "what", "which", "who", "whom", "this", "that", "these", "those", "am", "is", "are", "was", "were", "be", "been", "being", "have", "has", "had", "having", "do", "does", "did", "doing", "a", "an", "the", "and", "but", "if", "or", "because", "as", "until", "while", "of", "at", "by", "for", "with", "about", "against", "between", "into", "through", "during", "before", "after", "above", "below", "to", "from", "up", "down", "in", "out", "on", "off", "over", "under", "again", "further", "then", "once", "here", "there", "when", "where", "why", "how", "all", "any", "both", "each", "few", "more", "most", "other", "some", "such", "no", "nor", "not", "only", "own", "same", "so", "than", "too", "very", "s", "t", "can", "will", "just", "don", "should", "now"]
    dataset = pd.read_csv("Dataset_new.csv")
    data = dataset[['startup_id', 'description', 'tags']]
    from nltk import WordPunctTokenizer
    tokenizer = WordPunctTokenizer()
    descriptions = [tokenizer.tokenize(description.lower()) for description in data["tags"] if not description in stop_words]
    
    
    from gensim import corpora
    corpora_dict = corpora.Dictionary(descriptions)
    
    #print(corpora_dict.token2id)
    
    #Basic model which needs improvment
    corpus = [corpora_dict.doc2bow(text) for text in descriptions]
    from gensim import similarities
    index_bow = similarities.SparseMatrixSimilarity(corpus, num_features=len(corpora_dict))
    from gensim.models import TfidfModel
    model_tfidf = TfidfModel(corpus)
    vector = model_tfidf[corpus[0]]
    corpus_tfidf = model_tfidf[corpus]
    index_tfidf = similarities.SparseMatrixSimilarity(corpus_tfidf, num_features=len(corpora_dict))
    def search(index, query, top_n=8, prints=False):
        """
        This function searches the most similar texts to the query.
            :param index: gensim.similarities object
            :param query: a string
            :param top_n: how many variants it returns
            :param prints: if True returns the results, otherwise prints the results
            :returns: a list of tuples (matched_document_index, similarity_value)
        """
        # getting a BoW vector
        bow_vec = corpora_dict.doc2bow(query.lower().split())
        similarities = index[bow_vec]  # get similarities between the query and all index documents
        similarities = [(x, i) for i, x in enumerate(similarities)]
        similarities.sort(key=lambda elem: -elem[0])  # sorting by similarity_value in decreasing order
        res = []
        if prints:
            print(f"{query}\n")
        for result in similarities[:top_n]:
            if prints:
                #print(f"{data['main_speaker'][result[1]]} \n{data['description'][result[1]]} \t {result[0]} \t \n")
                if result[0]>0:
                    dic = {'startup_id':data['startup_id'][result[1]],'description':data['description'][result[1]]}
                    myresult.append(dic)
            else:
                res.append((result[1], result[0]))
        if not prints:
            return res
    myresult = []
    search(index_tfidf,query, prints=True)
    return myresult
