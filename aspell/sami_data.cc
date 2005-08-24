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
        "ge, "ges", "go", "gis", "han", "nai", "naigo", "goson", "hal",
        "ba", "be", "bat", NULL);
vector<string> case_suffixes = new_list(
        "s", "i", "in", "n", "t", "id", "ide", "iguin", NULL);
vector<string> case_possessivable_suffixes = new_list(
        "s", "st", "in", "n", "id", "ide", "iguin", NULL);

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
        "kin", "han", "pa", NULL);


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

Nouns
=====
STEM-DIPH-STR (goahti)
STEM-MONO-STR  n/a
STEM-DIPH-WEA (goađi)
STEM-MONO-WEA (gođii)


case/number

px

Adjectives
case/number
attribute -s
comparative

Verbs
finite morphology: indicative/conditional/imperative/potential
infinite morphology
derivation: passive and stuff


*/
