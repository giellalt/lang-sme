////
///  This file is a file for Sámi, modified from the file
//   genfisuffix - a Finnish affix table generator for ispell
//   Copyright (C) 2000  Pauli Virtanen <pauli.virtanen@saunalahti.fi>
//
//   This program is free software; you can redistribute it and/or modify
//   it under the terms of the GNU General Public License as published by
//   the Free Software Foundation; either version 2 of the License, or
//   (at your option) any later version.
//
//   This program is distributed in the hope that it will be useful,
//   but WITHOUT ANY WARRANTY; without even the implied warranty of
//   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//   GNU General Public License for more details.  //
//   You should have received a copy of the GNU General Public License
//   along with this program; if not, write to the Free Software
//   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//
//   The program's output is also subject to this license, and considered
//   program source code.
//
//////////////////////////////////////////////////////////////////////////////
//
//
#include "genfisuffix.hh"
#include "sami_data.hh"

vector<string> possessive_suffixes = new_list(
        "n", "t", "s", "me", "de", "ska", "met", "det", "set", NULL);
vector<string> suffix_particles = new_list(
        "ge", "ges", "go", "gis", "han", "nai", "naigo", "goson", "hal",
        "ba", "be", "bat", NULL);
        
//But these case suffixes go to different stems
vector<string> case_suffixes_even_diph_str = new_list(
             "i",  "in",  "n",  "t",  "id",  "ide",   "iguin", NULL);
vector<string> case_suffixes_even_diph_we = new_list(
             "s",  "in",  "t",  "id",  "ide",   "iguin", NULL);
vector<string> case_suffixes_even_mono_str = new_list(
             "i",  "s",  "in",  "n",  "t",  "id",  "ide",   "iguin", NULL);
vector<string> case_suffixes_even_mono_we = new_list(
             "i",  "s",  "in",  "n",  "t",  "id",  "ide",   "iguin", NULL);

//These always attach to the same stem
vector<string> case_suffixes_odd = new_list(
        "a", "ii", "is", "iin", "in", "at", "iid", "iidda", "iiguin", NULL);

vector<string> esscase_suffixes_odd = new_list(
        "a", "ii", "is", "iin", "in", "at", "iid", "iidda", "iiguin", NULL);


//Px forms to nouns.cc
vector<string> case_possessivable_suffixes_even = new_list(
             "s",  "st",  "in",  "n", "id", "ide", NULL);
            
vector<string> case_possessivable_suffixes_odd = new_list(
        "a", "as",  "istt",  "iin",  "in", "iidd", "iidda", NULL);

//pl com different since suffix order is deviant        
vector<string> pl_com_possessive_suffixes_even = new_list(
        "idanguin", "idatguin", "idisguin", "ideameguin", "ideatteguin", 
        "ideaskkaguin", "ideametguin", "ideattetguin", "ideasetguin", NULL);

vector<string> pl_com_possessive_suffixes_odd = new_list(
        "iiddánguin", "iiddátguin", "iiddisguin", "iiddámeguin", "iiddádeguin", 
        "iiddiskaguin", "iiddámetguin", "iiddádetguin", "iiddisetguin", NULL);

// No, we need different case suffixes for different stem classes.
// This is where we differ from finnish, with same suffixes for different stem classes.
// Thus "ide" and "idda" in different sets.

// 

// These are the suffix particles commonly suffixed to verbs
vector<string> suffix_particles_verbs = new_list(
        "ge, "ges", "go", "gis", "han", "nai", "naigo", "goson", "hal",
        "ba", "be", "bat", NULL);

// These are the suffix particles attached to negative and imperative forms
// of verbs.
vector<string> negative_suffix_particles = new_list(
        "ge", NULL);
vector<string> imperative_suffix_particles = new_list(
        "ge", "ges", "go", "gis", "han", "nai", "naigo", "goson", "hal",
        "ba", "be", "bat", NULL);

// Today all verforms get all clitics. If this is too much, we should cut down
// their number both here and in the sme-lex.txt file.       

// These are the suffixes common to all passive forms.
vector<string> passive_suffixes = new_list(
        // First the passive suffixes, except the present form. (Which
        // is different in different verb types.)
        "juvvo", "taisiin", 
        
        /// Then the infinitives and participes
        "dettiin", "deddiin",       // 2nd passive infinitive

        // 1st passive participe
        "tava", "tavaa", "tavan", "tavassa", "tavasta", "tavaan",
        "tavalla", "tavalta", "tavalle", "tavana", "tavaksi",
        
        "tavat", "tavia", "tavien", "tavissa", "tavista", "taviin",
        "tavilla", "tavilta", "taville", "tavina", "taviksi",
        "tavin",
        
        NULL);
static vector<string> passive_negative_suffixes = new_list(
        "taisi", "tu", NULL);
static vector<string> passive_no_suffix_particles_suffixes = new_list(
        "taman",        // 3rd passive infinitive
        
        "takoon", "tako",       // passive imperative
        "taneen", "tane",       // passive potential
        
        "tavine", // passive 1st participe comitative
        NULL);

void init_sami_data()
{
        if (!options.use_suffix_particles)
        {
                suffix_particles.clear();
                suffix_particles_verbs.clear();
                negative_suffix_particles.clear();
                imperative_suffix_particles.clear();
        }
        if (!options.use_possessive_suffixes)
        {
                possessive_suffixes.clear();
        }
        
        // Passive
        add_to_vector(passive_suffixes,
                      suffix_strings(passive_suffixes,
                                     suffix_particles_verbs));
        add_to_vector(
                passive_negative_suffixes,
                suffix_strings(passive_negative_suffixes,
                               negative_suffix_particles));

        add_to_vector(passive_suffixes, passive_negative_suffixes);

        // These passive forms don't have suffix particles
        add_to_vector(passive_suffixes, passive_no_suffix_particles_suffixes);
}


/*
 * I put in a suffix grammar here.
 
 For Finnish, the challenge is to combine the suffixes
 For Sámi, the challenge is to find the right stems (and thereafter to add the clitics)

Nouns (what stems to direct to what suffix lexicon)
=====
even     a-st     á-st    i-st   e-st      u-st    o-st
DIPH-STR giella   goarbá  goahti njoađve   viessu  reŋko
DIPH-WEA giela    goarbbá goađi  njoađvve  viesu   reŋkko
MONO-STR gillii     -       -     -        vissui    -
MONO-WEA   -        -     gođii   -        visot     -

Listing the case-number-px suffixes for each stem:
Adding the clitics in a separate lexicon.
Each of these lists should get a flag and a definition, and be concatenated in the string:
properstem + relevant-case-number-px-set + clitics

Here we go:

giella
n
n
n
n
san
nan
t
sat
nat
s
sis
nis
me
me
me
seame
neame
de
seatte
neatte
ska
seaskka
neaskka
met
met
met
seamet
neamet
det
seattet
neattet
set
seaset
neaset


giela
s
in
t
id
id
ide
in
iguin
stan
inan
idan
idan
idan
idasan
inan
idanguin
t
t
stat
inat
idat
idat
idasat
inat
idatguin
s
s
stis
inis
idis
idis
idasas
inis
idisguin
steame
ineame
ideame
ideame
ideame
idasame
ineame
ideameguin
de
de
steatte
ineatte
ideatte
ideatte
idasade
ineatte
ideatteguin
ska
ska
steaskka
ineaskka
ideaskka
ideaskka
idasaska
ineaskka
ideaskkaguin
steamet
ineamet
ideamet
ideamet
ideamet
idasamet
ineamet
ideametguin
det
det
steattet
ineattet
ideattet
ideattet
idasadet
ineattet
ideattetguin
set
set
steaset
ineaset
ideaset
ideaset
idasaset
ineaset
ideasetguin

gillii
i

















odd
STEM-WEA (beana
STEM-STR (beatnag)

contract
STEM-DIPH-WEA (suolu)
STEM-MONO-STR (sullo)

case/number

casenum2 px cl



Adjectives
case/number
attribute -s
comparative

Verbs
=====
Active:
finite morphology: indicative/conditional/imperative/potential
infinite morphology

derivation: 
passive and stuff
stem + (j)uvvo + ordinary morphology

*/
