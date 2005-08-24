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
//   GNU General Public License for more details.
//
//   You should have received a copy of the GNU General Public License
//   along with this program; if not, write to the Free Software
//   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//
//   The program's output is also subject to this license, and considered
//   program source code.
//
//////////////////////////////////////////////////////////////////////////////
//
// Flags used:
//      L do_suffix_particles
//      M do_suffix_particles
//      N do_possessive_suffixes
//      O do_possessive_suffixes
//      S do_nouns
//      T do_nouns
//      P do_possessive_and_illative
//      Q do_possessive_and_illative
//
#include <vector>
#include <string>
#include <algorithm>

#include <ctype.h>
#include <locale.h>

#include "genfisuffix.hh"
#include "sami_data.hh"

void do_suffix_particles()
{
        Suffix suffixes("", "",
                        new_list("kin", "ko", "kaan", "han", "pa", "kinko",
                                 "pahan", "kohan", "kaanko", NULL));

//        output_flag('L');
        output_suffix_list(&suffixes, 1, 'L');

//        output_flag('M');
        output_suffix_list_to_front(&suffixes, 1, 'M');
}

/// These flags add possessive suffixes to
///   - partitives
///   - plural genitive
///   - illatives
void do_possessive_suffixes()
{
        vector<string> noun_possessive_suffixes = new_list(
                "ni", "si", "nsa", "mme", "nne", NULL);

        // Add suffix particles
        if (options.use_all_suffix_particles)
        {
                add_to_vector(noun_possessive_suffixes,
                              suffix_strings(noun_possessive_suffixes,
                                             suffix_particles));
        }

// flag *N, flag *O        
        Suffix suffixes[] =
        {
                // Note that:
                //      - partitite always ends in -a
                //      - genitive and illative always end in -n
                //
                // I don't define any extra suffixes here to avoid
                // "misuse" of these flags.
                
                // Add possessive suffixes
                Suffix("A", "",
                       noun_possessive_suffixes),
                Suffix("[AEIOU] N", "N",
                       noun_possessive_suffixes),

                // Add the Vn possessive suffix
                Suffix("[^A] A", "",
                       add_and_suffix(new_list("an", NULL),
                                      suffix_particles)),
        };
        int suffixes_n = sizeof(suffixes) / sizeof(Suffix);

//        output_flag('N');
        output_suffix_list(suffixes, suffixes_n, 'N');

//        output_flag('O');
        output_suffix_list_to_front(suffixes, suffixes_n, 'O');
}


// These flags form singular and plural
//      - inessive, elative, adessive, ablative, allative
//      - translative
// and
//      - plural basic form
//      - singular genitive
//      - plural instructive
// when applied to singular or plural inessive
void do_nouns()
{
        // Cases
        vector<string> noun_suffixes = case_suffixes;
        vector<string> noun_possessivable_suffixes =
                case_possessivable_suffixes;

// Generate possessive forms
        noun_possessivable_suffixes = combine(
                suffix_strings(noun_possessivable_suffixes,
                               possessive_suffixes),
                generate_n_possessive_suffix(noun_possessivable_suffixes));

// Add suffix particles
        add_to_vector(noun_suffixes,
                      suffix_strings(noun_suffixes,
                                     suffix_particles));
        if (options.use_all_suffix_particles)
        {
                add_to_vector(noun_suffixes,
                              suffix_strings(noun_possessivable_suffixes,
                                             suffix_particles));
        }

// Add possessive suffixed forms
        add_to_vector(noun_suffixes, noun_possessivable_suffixes);

// flag *S, flag *T

        // These are used for flags *S and *T
        Suffix suffixes[] =
        {
                // [^I] S S A > -SSA,T  # talossa -> talot
                Suffix("[^I] S S A", "SSA",
                       add_and_suffix(new_list("t", NULL),
                                      suffix_particles)),

                // S S A >  -SSA,STAAN  # talossa -> talostaan
                Suffix("S S A", "SSA",
                       noun_suffixes)
        };
        int suffixes_n = sizeof(suffixes) / sizeof(Suffix);
        
//        output_flag('S');
        output_suffix_list(suffixes, suffixes_n, 'S');

//        output_flag('T');
        output_suffix_list_to_front(suffixes, suffixes_n, 'T');
}

// These flags form 
//      - possessive suffixed basic forms
//      - essive
//      - some singular illatives
// when applied to singular possessive suffixed basic form.
void do_possessive_and_illative()
{
        vector<string> noun_possessive_suffixes = new_list(
                "ni", "si", "nsa", "nne", "mme", NULL);
        vector<string> noun_essive_suffixes = // -ni is used as base
                new_list("na", NULL);
        vector<string> noun_illative_suffixes = // a vowel will be prefixed to
                new_list("n", NULL);            // these

        vector<string> noun_illative_possessivable_suffixes;
        vector<string> noun_essive_possessivable_suffixes;

// Possessive suffixes to essive and to illative
        add_to_vector(noun_essive_possessivable_suffixes,
                      suffix_strings(noun_essive_suffixes,
                                     possessive_suffixes));
        add_to_vector(
                noun_essive_possessivable_suffixes,
                generate_n_possessive_suffix(new_list("na", NULL)));

        add_to_vector(noun_illative_possessivable_suffixes,
                      possessive_suffixes);

// Add suffix particled forms
        add_to_vector(noun_essive_suffixes,
                      suffix_strings(noun_essive_suffixes,
                                     suffix_particles));
        add_to_vector(noun_possessive_suffixes,
                      suffix_strings(noun_possessive_suffixes,
                                     suffix_particles));
        add_to_vector(noun_illative_suffixes,
                      suffix_strings(noun_illative_suffixes,
                                     suffix_particles));
        if (options.use_all_suffix_particles)
        {
                add_to_vector(noun_essive_suffixes,
                              suffix_strings(
                                      noun_essive_possessivable_suffixes,
                                      suffix_particles));
                add_to_vector(noun_illative_suffixes,
                              suffix_strings(
                                      noun_illative_possessivable_suffixes,
                                      suffix_particles));
        }

// Add possessive suffixed forms
        add_to_vector(noun_essive_suffixes,
                      noun_essive_possessivable_suffixes);
        add_to_vector(noun_illative_suffixes,
                      noun_illative_possessivable_suffixes);
        
// flag *P, flag *Q
        
        Suffix suffixes[] =
        {
                // N I > -NI,SI         # taloni -> talosi
                Suffix("N I", "NI",
                       noun_possessive_suffixes),

                // Essive
                // N I > -NI,NA         # taloni -> talona
                Suffix("N I", "NI",
                       noun_essive_suffixes),

                // Hard part: illative
                //
                // 1. Words not ending in double vowel or dipthong: -Vn DONE
                //
                // 2. Plural forms ending in two vowels: -hVn           TODO
                // 
                // 3. In one-syllable words ending in : -hVn            TODO
                // 4. and otherwise singular -seen and plural -siin     TODO
                
                // [^A] A N I > -NI,AN       # kermani -> kermaan
                Suffix("[^A] A N I", "NI",
                       prefix_strings(noun_illative_suffixes, "a")),
        
                // [^OU] O N I > -NI,ON      # peltoni -> peltoon
                Suffix("[^OU] O N I", "NI",
                       prefix_strings(noun_illative_suffixes, "o")),
        
                // [^AEIOU] U N I > -NI,UN   # laskuni -> laskuun
                Suffix("[^AEIOU] U N I", "NI",
                       prefix_strings(noun_illative_suffixes, "u")),
        
                // [^AEIOU] I N I > -NI,IN   # kahvini -> kahviin
                Suffix("[^AEIOU] I N I", "NI",
                       prefix_strings(noun_illative_suffixes, "i")),
        };
        int suffixes_n = sizeof(suffixes) / sizeof(Suffix);

//        output_flag('P');
        output_suffix_list(suffixes, suffixes_n, 'P');

//        output_flag('Q');
        output_suffix_list_to_front(suffixes, suffixes_n, 'Q');
}
