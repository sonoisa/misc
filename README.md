# 雑多な主に自分用のコード

## 自然言語処理

どれもGoogle Colaboratoryで動かすことを前提としています。



- [SetFit_japanese.ipynb](https://colab.research.google.com/github/sonoisa/misc/blob/main/nlp/SetFit_japanese.ipynb): [SetFitアルゴリズム](https://arxiv.org/abs/2209.11055)を用いたセンチメント分析（2値分類タスク）

- [bert_japanese_classification_LP_FT.ipynb](https://colab.research.google.com/github/sonoisa/misc/blob/main/nlp/bert_japanese_classification_LP_FT.ipynb): [LP-FTアルゴリズム](https://arxiv.org/abs/2202.10054)を用いた文分類（9値分類、最終層のCLSを利用）
- [bert_japanese_classification_LP_FT_multiCLS.ipynb](https://colab.research.google.com/github/sonoisa/misc/blob/main/nlp/bert_japanese_classification_LP_FT_multiCLS.ipynb): [LP-FTアルゴリズム](https://arxiv.org/abs/2202.10054)を用いた文分類（9値分類、最終6層のCLSベクトルを利用）

- [elasticsearch_example.ipynb](https://colab.research.google.com/github/sonoisa/misc/blob/main/nlp/elasticsearch_example.ipynb): elasticsearchを用いた日本語文章検索
- [parse_wiki40b.ipynb](https://colab.research.google.com/github/sonoisa/misc/blob/main/nlp/parse_wiki40b.ipynb): Wiki-40Bのデータセットの構造化


## ハンズオン用のコード

非公開データセットを解凍するためのパスワードなしでは動きません。  
完成版を試せるデモアプリもあります。

- [irasuto_search_with_sentence_bert_handson.ipynb](https://colab.research.google.com/github/sonoisa/misc/blob/main/nlp/irasuto_search_with_sentence_bert_handson.ipynb): 日本語Sentence-BERTを用いた「いらすとや」画像検索
  - デモアプリ: https://huggingface.co/spaces/sonoisa/irasuto_search

- [CLIP_irasutoya_search_zero_shot_handson.ipynb](https://colab.research.google.com/github/sonoisa/misc/blob/main/nlp/CLIP_irasutoya_search_zero_shot_handson.ipynb): 日本語CLIPを用いたマルチモーダル「いらすとや」画像検索
  - デモアプリ: https://huggingface.co/spaces/sonoisa/Irasuto_search_CLIP_zero-shot
