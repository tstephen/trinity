#!/bin/bash

concepts=('catechumen' 'Donatism' 'dualistic' 'Manichaeism' 'Neoplatonism' 'Platonism' 'Zoroastrianism')
for i in "${concepts[@]}"
do
  echo "$i"
  sed -i "s/ $i\b/ link:\/pages\/glossary#_${i,,}[$i,role=concept]/g" $1
done

people=('Ambrose' 'Arius' 'Athanasius' 'Augustine' 'Cicero' 'Cyprian' 'Constantine' 
        'Demiurge'
        'Gregory of Nazianzus' 'Gregory of Nyssa' 'Justin Martyr' 'Mani' 'Nous'
        'Origen' 'Pelagius' 'Plotinus' 'Plato' 'Porphyry'
       	'Tertullian' 'Theodosius' 'Virgil')
for i in "${people[@]}"
do
  echo "$i"
  sed -i "s/ $i\b/ link:\/pages\/people#_${i,,}[$i,role=person]/g" $1
done

places=('Alexandria' 'Antioch' 'Carthage' 'Caesarea' 'Constantinople' 'Ephesus'
        'Milan' 'Nicaea' 'Rome' 'Serdica')
for i in "${places[@]}"
do
  echo "$i"
  sed -i "s/ $i\b/ link:\/pages\/places#_${i,,}[$i,role=place]/g" $1
done

