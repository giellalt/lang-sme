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
//      H do_adjectives
//      I do_adjectives
//      J do_adjectives
//      K do_adjectives
//
#include <vector>
#include <string>
#include <algorithm>

#include <ctype.h>
#include <locale.h>

#include "genfisuffix.hh"
#include "sami_data.hh"

void do_adjectives()
{
/// COMPARATIVE
        // Predefined suffixes

        // Singular illative is same as -Vn possessive suffixed
        // singular partitive. It is added separately, if
        // possessive suffixes aren't enabled.
        //
        // This applies also to superlative
        vector<string> adjective_comparative_suffixes
                = new_list("mpi", "mpaa", "mpaan", "mpana", "mmat",
                           "mpia", "mpien", "mpiin", "mpina", NULL);
        vector<string> adjective_comparative_possessivable_suffixes
                = new_list("mpa", "mpaa", "mpana", "mpia", "mpie", "mpii",
                           "mpina", "mpine", NULL);
        
// Add cases: singular and plural
        add_to_vector(adjective_comparative_suffixes,
                      prefix_strings(case_suffixes, "mma"));
        add_to_vector(adjective_comparative_possessivable_suffixes,
                      prefix_strings(case_possessivable_suffixes,
                                     "mma"));
        add_to_vector(adjective_comparative_suffixes,
                      prefix_strings(case_suffixes, "mmi"));
        add_to_vector(adjective_comparative_possessivable_suffixes,
                      prefix_strings(case_possessivable_suffixes,
                                     "mmi"));

// Generate possessive forms
        adjective_comparative_possessivable_suffixes = combine(
                suffix_strings(adjective_comparative_possessivable_suffixes,
                               possessive_suffixes),
                generate_n_possessive_suffix(
                        adjective_comparative_possessivable_suffixes));
        if (!options.use_possessive_suffixes)
                adjective_comparative_suffixes.push_back("mpaan");
        
/// SUPERLATIVE
        vector<string> adjective_superlative_suffixes
                = new_list("in", "inta", "impaa", "impana", "immat",
                           "impia", "impien", "impiin", "impina", NULL);
        vector<string> adjective_superlative_possessivable_suffixes
                = new_list("impa", "inta", "impaa", "impana", "impia",
                           "impie", "impii", "impina", NULL);

        // Add cases (also genitive): singular and plural
        add_to_vector(adjective_superlative_suffixes,
                      prefix_strings(case_suffixes, "imma"));
        add_to_vector(adjective_superlative_possessivable_suffixes,
                      prefix_strings(case_possessivable_suffixes,
                                     "imma"));
        add_to_vector(adjective_superlative_suffixes,
                      prefix_strings(case_suffixes, "immi"));
        add_to_vector(adjective_superlative_possessivable_suffixes,
                      prefix_strings(case_possessivable_suffixes,
                                     "immi"));

// Generate possessive forms
        adjective_superlative_possessivable_suffixes = combine(
                suffix_strings(adjective_superlative_possessivable_suffixes,
                               possessive_suffixes),
                generate_n_possessive_suffix(
                        adjective_superlative_possessivable_suffixes));

        if (!options.use_possessive_suffixes)
                adjective_superlative_suffixes.push_back("impaan");

// Add suffix particled forms
        add_to_vector(adjective_comparative_suffixes,
                      suffix_strings(adjective_comparative_suffixes,
                                     suffix_particles));
        add_to_vector(adjective_superlative_suffixes,
                      suffix_strings(adjective_superlative_suffixes,
                                     suffix_particles));

        if (options.use_all_suffix_particles)
        {
                add_to_vector(
                        adjective_comparative_suffixes,
                        suffix_strings(
                                adjective_comparative_possessivable_suffixes,
                                suffix_particles));
                add_to_vector(
                        adjective_superlative_suffixes,
                        suffix_strings(
                                adjective_superlative_possessivable_suffixes,
                                suffix_particles));
        }

// Add possessive suffixed forms to adjective_*_suffixes
        add_to_vector(adjective_comparative_suffixes,
                      adjective_comparative_possessivable_suffixes);
        add_to_vector(adjective_superlative_suffixes,
                      adjective_superlative_possessivable_suffixes);

// Output adjective suffix lists...
//        output_flag('H');
        output_suffix_group('H', "mpi", "mpi",
                            adjective_comparative_suffixes);
        
//        output_flag('I');
        output_suffix_group('I', "mpi", "mpi",
                            to_front_vowel(adjective_comparative_suffixes));

//        output_flag('J');
        output_suffix_group('J', "in", "in", adjective_superlative_suffixes);
        
//        output_flag('K');
        output_suffix_group('K', "in", "in",
                            to_front_vowel(adjective_superlative_suffixes));
}
