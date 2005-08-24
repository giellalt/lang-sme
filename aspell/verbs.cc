////
///  genfisuffix - a Finnish affix table generator for ispell
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
//      U do_verbs_infinitive_stem
//      V do_verbs_infinitive_stem
//
//      W do_verbs_declination_stem 
//      X do_verbs_declination_stem
//
//      Y do_verbs_consonant_gradated_declination_stem
//      Z do_verbs_consonant_gradated_declination_stem
//
// Forms of Finnish verbs are numerous. Luckily most of the forms ispell is
// able to produce from three (often different) verb stems:
//      - infinitive stem
//      - declination stem
//      - consonant gradated declination stem (because ispell can't do 
//                                             consonant gradation)
//
// All verb forms can be deduced from the infinitive stem, but the relation
// between the declination stem and the infinitive stem is sometimes too 
// complex to resolve by ispell's means.
//
// Note also that vowel harmony is mostly symmetric: front vowel versions
// of rules can be created easily from back vowel versions.
//
// In verbs there are some exceptions from this symmetricity.
// (The exceptions are due to the vowel change in past form.)
// (Conditional vowel change is back-front vowel symmetric.)
//
// STATUS: Produces all verb forms of all verbs, but not the past forms
//         of all verbs, whose stems end in '-a' or '-ä'.
//
//         There are two problems: anta/a verbs sometimes change -ta or -tä
//         to -s in their past form. I don't know how it can be determined.
//
//         Other problem is the fact, that words, whose declination stem
//         ends in a single -a, which may change to -o or disappear in two-
//         syllable words depending on the first vowel of the word.
//
//         I see no way to overcome the latter problem in ispell.
//

#include <vector>
#include <string>
#include <algorithm>

#include <ctype.h>
#include <locale.h>

#include "genfisuffix.hh"
#include "sami_data.hh"


// Following forms form from infinitive stem:
//      - 1st and 2nd infinitives      (nähdä, nähdä/kseni; nähde/ssä, nähd/en)
//      - all passive forms, except for the type_1 or anta/a verbs
//      - imperative (except the singular 3rd form)    (näh/köön, näh/kää)
//      - potential                                    (näh/nen, näh/nee)
//      - perfect participe                            (näh/nyt, näh/neet)
//
// 1st infinitive form is used as the base of flags herein.
// It is also the passive present negative form.
//
void do_verbs_infinitive_stem()
{
        vector<string> infinitive_1st_suffixes = new_list(
                // 1st infinitive translative
                "kseni", "ksesi", "ksensa", "kseni", "ksemme", "ksenne",
                "kseen",
                NULL);
                
        vector<string> infinitive_2nd_suffixes = new_list(
                // 2st infinitive inessive
                "essa",

                // 2st infinitive instructive
                "en",
                
                NULL);

        vector<string> infinitive_2nd_possessivable_suffixes;

        // Note the omitted leading 'n' of these suffixes
        vector<string> participe_and_potential_suffixes = new_list(
                "ut", "eet",
                "et", "ee",

                // "en", This is alike 2st infinitive instructive in
                //       type5 verbs, so I specify this separately to avoid
                //       duplicate rules.
                
                "emme", "ette", "evat", NULL);
        vector<string> potential_singular_1st_suffix = new_list(
                "en", NULL);
        vector<string> potential_no_suffix_particles_suffixes = new_list(
                "e", NULL);

        vector<string> imperative_suffixes = new_list(
                "kaa", NULL);
        vector<string> imperative_no_suffix_particles_suffixes = new_list(
                "koon", "koot", "kaamme", "ko", NULL);

// Generate possessive forms of infinitive_2nd_suffixes
        infinitive_2nd_possessivable_suffixes = combine(
                suffix_strings(new_list("essa", NULL),
                               possessive_suffixes),
                generate_n_possessive_suffix(new_list("essa", NULL)));
        
// Suffix particles
        // Infinitives
        add_to_vector(infinitive_1st_suffixes,
                      suffix_strings(infinitive_1st_suffixes,
                                     suffix_particles));
        add_to_vector(infinitive_2nd_suffixes,
                      suffix_strings(infinitive_2nd_suffixes,
                                     suffix_particles));

        // Potential and participes
        add_to_vector(participe_and_potential_suffixes,
                      suffix_strings(participe_and_potential_suffixes,
                                     suffix_particles_verbs));
        add_to_vector(potential_singular_1st_suffix,
                      suffix_strings(potential_singular_1st_suffix,
                                     suffix_particles_verbs));
        add_to_vector(participe_and_potential_suffixes,
                      potential_no_suffix_particles_suffixes);

        // Add other suffix particles
        if (options.use_all_suffix_particles)
        {
                add_to_vector(infinitive_2nd_suffixes,
                              suffix_strings(
                                      infinitive_2nd_possessivable_suffixes,
                                      suffix_particles));
        }
                
        // Imperative
        add_to_vector(
                imperative_suffixes,
                suffix_strings(imperative_suffixes,
                               imperative_suffix_particles));
        add_to_vector(imperative_suffixes,
                      imperative_no_suffix_particles_suffixes);

// Add possessive forms
        add_to_vector(infinitive_2nd_suffixes,
                      infinitive_2nd_possessivable_suffixes);
        
// flag *U, flag *V:        
        Suffix suffixes[] =
        {
                // All verbs:
                Suffix("A", "", infinitive_1st_suffixes),
                
                Suffix("EA", "EA",
                       prefix_strings(infinitive_2nd_suffixes, "i")),
                Suffix("[^E]A", "A",
                       infinitive_2nd_suffixes),
                
                // anta/a (type1) verbs (whose passive doesn't form
                //                       from this stem)
                Suffix("[AEIOU]A", "A",
                       prefix_strings(combine(participe_and_potential_suffixes,
                                              potential_singular_1st_suffix),
                                      "n")),
                Suffix("[AEIOU]A", "A", imperative_suffixes),

                // huomat/a (type2) verbs
                Suffix("[^S]TA", "TA",
                       combine(add_and_suffix(new_list("taan", NULL),
                                              suffix_particles_verbs),
                               prefix_strings(passive_suffixes, "t"))),
                Suffix("[^S]TA", "TA",
                       prefix_strings(combine(participe_and_potential_suffixes,
                                              potential_singular_1st_suffix),
                                      "nn")),
                Suffix("[^S]TA", "A", imperative_suffixes),

                // saa/da (type3) verbs
                Suffix("DA", "DA",
                       combine(add_and_suffix(new_list("daan", NULL),
                                              suffix_particles_verbs),
                               passive_suffixes)),
                Suffix("DA", "DA",
                       prefix_strings(combine(participe_and_potential_suffixes,
                                              potential_singular_1st_suffix),
                                      "n")),
                Suffix("DA", "DA", imperative_suffixes),

                
                // nous/ta (type4) verbs
                Suffix("STA", "TA",
                       combine(add_and_suffix(new_list("taan", NULL),
                                              suffix_particles_verbs),
                               passive_suffixes)),
                Suffix("STA", "TA",
                       prefix_strings(combine(participe_and_potential_suffixes,
                                              potential_singular_1st_suffix),
                                      "s")),
                Suffix("STA", "TA", imperative_suffixes),

                
                // tul/la (type5) verbs
                Suffix("LA", "LA",
                       combine(add_and_suffix(new_list("laan", NULL),
                                              suffix_particles_verbs),
                               passive_suffixes)),
                Suffix("LA", "A",
                       participe_and_potential_suffixes),
                Suffix("LA", "LA", imperative_suffixes),

                
                // men/nä (type5) verbs
                Suffix("NA", "NA",
                       combine(add_and_suffix(new_list("naan", NULL),
                                              suffix_particles_verbs),
                               passive_suffixes)),
                Suffix("NA", "A",
                       participe_and_potential_suffixes),
                Suffix("NA", "NA", imperative_suffixes),
                
                // pur/ra (type5) verbs
                Suffix("R A", "RA",
                       combine(add_and_suffix(new_list("raan", NULL),
                                              suffix_particles_verbs),
                               passive_suffixes)),
                Suffix("RA", "A",
                       participe_and_potential_suffixes),
                Suffix("RA", "RA", imperative_suffixes)
        };
        int suffixes_n = sizeof(suffixes) / sizeof(Suffix);

// flag *U, flag *V:
//        output_flag('U');
        output_suffix_list(suffixes, suffixes_n, 'U');

//        output_flag('V');
        output_suffix_list_to_front(suffixes, suffixes_n, 'V');
}


// Following forms form from pure declination stem:
//      - active present participe
//      - 3rd infinitive        } NOTE: These are very alike!
//      - agent participe       }
//      - 4th infinitive
//      - active conditional (all forms)
//      - active present singular and plural 3rd forms.
//      - active past singular and plural 3rd forms.
//        (FIXME or NOTE: ispell can't do vowel changing fully: when 
//         declinating verbs, whose declination stem ends '-a', the syllable 
//         count of words _must_ be known. Also exceptions arise in these
//         verbs)
//
// Active present participe base form (-va) is used as the base,
// as it attaches directly to the unmodified declination stem.
// 
void do_verbs_declination_stem()
{
        vector<string> verb_case_suffixes
                = combine(case_suffixes, new_list("na", NULL));
        vector<string> verb_case_possessivable_suffixes
                = combine(case_possessivable_suffixes, new_list("na", NULL));

        // This holds forms of 3rd infinitive and active present participe
        // They replace the -va suffix.
        vector<string> basic_suffixes;  

        // This is just for temporary use: it will be merged to basic_suffixes
        vector<string> basic_possessivable_suffixes;

        // Conditional
        vector<string> conditional_suffixes =
                new_list("isin", "isit", "isi", "isimme", "isitte", "isivat",
                         NULL);

        // These are meant to be prefixed by some string. This vector
        // contains also an empty item. (As you can see.)
        // These are used to provide suffix particles easily to some verb
        // forms (namely the 3rd present and past forms)
        vector<string> prefixable_suffixes = combine(new_list("", NULL),
                                                     suffix_particles_verbs);

// Add active present participe form declinations to basic_suffixes and
// basic_possessivable_suffixes

        // Add both singular and plural (noun like) case declinations
        add_to_vector(basic_suffixes, prefix_strings(verb_case_suffixes, "va"));
        add_to_vector(basic_suffixes, prefix_strings(verb_case_suffixes, "vi"));

        // Add plural and singular partitive, illative and plural genitive
        // (but not the basic -va form, as it is used as the base)
        add_to_vector(basic_suffixes, new_list("vaa", "vaan", "vat",
                                               "via", "vien", "viin",
                                               NULL));

        // Then add possessivable forms of the above
        add_to_vector(basic_possessivable_suffixes,
                      prefix_strings(verb_case_possessivable_suffixes, "va"));
        add_to_vector(basic_possessivable_suffixes,
                      prefix_strings(verb_case_possessivable_suffixes, "vi"));

        // This time add also base form, as it will be suffixed with
        // possessive suffixes. Add also comitative.
        add_to_vector(basic_possessivable_suffixes,
                      new_list("va", "vaa", "via", "vie", "vii", "vine",
                               NULL));
        
// Add 3rd infinitive, AND forms of agent participe.
// Practically forms the 3rd infinitive are a subset of agent participe's
// forms. So adding only forms of agent participe is enough.


        // Add both plural and singular 
        add_to_vector(basic_suffixes, prefix_strings(verb_case_suffixes,"ma"));
        add_to_vector(basic_suffixes, prefix_strings(verb_case_suffixes,"mi"));

        // Add plural and singular basic form, partitive, illative,
        // plural genitive and singular abessive
        add_to_vector(basic_suffixes, new_list("ma", "maa", "maan", "mat",
                                               "mia", "mien", "miin", "matta",
                                               NULL));

        add_to_vector(basic_possessivable_suffixes,
                      prefix_strings(verb_case_possessivable_suffixes,
                                     "ma"));
        add_to_vector(basic_possessivable_suffixes,
                      prefix_strings(verb_case_possessivable_suffixes,
                                     "mi"));
        add_to_vector(basic_possessivable_suffixes,
                      new_list("ma", "maa", "mia", "mie", "mii",
                               NULL));

// Generate possessive forms
// (i.e. merge basic_possessivable_suffixes to basic_suffixes, whilst
//       suffixing the former with possessive suffixes.)
        basic_possessivable_suffixes = combine(
                suffix_strings(basic_possessivable_suffixes,
                               possessive_suffixes),
                generate_n_possessive_suffix(
                        basic_possessivable_suffixes));

// Add proper suffix particled forms of conditional suffixes to
// vector conditional_suffixes
        add_to_vector(conditional_suffixes,
                      suffix_strings(conditional_suffixes,
                                     suffix_particles_verbs));
                
// Add suffix particles to basic_suffixes
        add_to_vector(basic_suffixes,
                      suffix_strings(basic_suffixes,
                                     suffix_particles));
        if (options.use_all_suffix_particles)
        {
                add_to_vector(basic_suffixes,
                              suffix_strings(basic_possessivable_suffixes,
                                             suffix_particles));
        }

// Add the possessive suffixed forms
        add_to_vector(basic_suffixes, basic_possessivable_suffixes);

// Add the 4th infinitive. Note that this is very much alike to the -minen
// "verb to noun" derivation suffix. These don't get suffix particles
// (being added after their adding), because these forms are rather rare.
        add_to_vector(basic_suffixes, new_list("minen", "mista", NULL));

// flag *W, flag *X
        Suffix suffixes[] =
        {
                /// First the active agent participe and 1st participe forms
                Suffix("VA", "VA", basic_suffixes),    // palava -> palavassa

                /// Then form the present active singular 3rd form.
                // Words which haven't got dipthong or double vowel before
                // -va get their vowel doubled
                Suffix("[^A]AVA", "VA",              // jakava -> jakaa
                       prefix_strings(prefixable_suffixes, "A")),
                Suffix("[^EI]EVA", "VA",             // hakeva -> hakee
                       prefix_strings(prefixable_suffixes, "E")),       
                Suffix("[^AEIOU]IVA", "VA",          // raapiva -> raapii
                       prefix_strings(prefixable_suffixes, "I")),    
                Suffix("[^OU]OVA", "VA",             // halkova -> halkoo
                       prefix_strings(prefixable_suffixes, "O")),       
                Suffix("[^AEIOU]UVA", "VA",          // sortuva -> sortuu
                       prefix_strings(prefixable_suffixes, "U")),    
                // Other words just drop their -va suffix
                Suffix("AAVA", "VA",                 // saava -> saa
                       prefixable_suffixes),            
                Suffix("[EI]EVA", "VA",              // ? -> ?
                       prefixable_suffixes),         
                Suffix("[AEIOU]IVA", "VA",           // ? -> ?
                       prefixable_suffixes),      
                Suffix("[OU]OVA", "VA",              // juova -> juo
                       prefixable_suffixes),         
                Suffix("[AEIOU]UVA", "VA",           // ? -> ?
                       prefixable_suffixes),      

                /// Then the present active plural 3rd form
                Suffix("VA", "",                       // lukeva -> lukevat
                       prefix_strings(prefixable_suffixes, "T")),

                /// Past active singular 3rd form

                // Triggers the vowel change, which is not back-front vowel
                // symmetric on declination stems ending in '-a' or '-ä'.
                // There is also other trickery about in these forms.

                // Note, that I haven't included here those vowel change
                // rules, which lead to forms not appearing in verbs.
                // Same applies to the conditional forms.
                Suffix("[^EI]EVA", "EVA",            // lukeva -> luki
                       prefix_strings(prefixable_suffixes, "I")),      
                Suffix("IVA", "VA",                   // juhliva -> juhli
                       prefix_strings(prefixable_suffixes, "")),
                Suffix("[^OU]OVA", "VA",             // uskova -> uskoi
                       prefix_strings(prefixable_suffixes, "I")),       
                Suffix("UOVA", "UOVA",               // juova -> joi
                       prefix_strings(prefixable_suffixes, "OI")),        
                Suffix("[^U]UVA", "VA",              // sattuva -> sattui
                       prefix_strings(prefixable_suffixes, "I")),

                // NOTE, FIXME: saada doesn't declinate this way!
                //              Thus this extremely ugly hack.
                Suffix("[ABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ] [^AEIOU] [AEIOU] A V A", "AVA",
                       prefix_strings(prefixable_suffixes, "SI")),
                Suffix("[ABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ] [^AEIOU] [AEIOU] A V A", "AVA",
                       prefix_strings(prefixable_suffixes, "SIVAT")),

                // Past active plural 3rd form 
                Suffix("[^EI]EVA", "EVA",    // lukeva -> lukivat
                       prefix_strings(prefixable_suffixes, "IVAT")),   
                Suffix("IVA", "VA",           // juhliva -> juhlivat
                       prefix_strings(prefixable_suffixes, "VAT")),
                Suffix("[^OU]OVA", "VA",     // uskova -> uskoivat
                       prefix_strings(prefixable_suffixes, "IVAT")),    
                Suffix("UOVA", "UOVA",       // juova -> joivat
                       prefix_strings(prefixable_suffixes, "OIVAT")),     
                Suffix("[^U]UVA", "VA",      // sattuva -> sattuivat
                       prefix_strings(prefixable_suffixes, "IVAT")),


                /// Conditional
                // Conditional triggers vowel change, but without ambiguities.
                // It is also fully back-front vowel symmetric.
                        
                // singular active 3rd conditional
                Suffix("AAVA", "AVA", conditional_suffixes),
                Suffix("[^A]AVA", "VA", conditional_suffixes),
                Suffix("[^EI]EVA", "EVA", conditional_suffixes),
                Suffix("IVA", "IVA", conditional_suffixes),
                Suffix("UOVA", "UOVA",
                       prefix_strings(conditional_suffixes, "o")),
                Suffix("[^OU]OVA", "VA", conditional_suffixes),
                Suffix("[^U]UVA", "VA", conditional_suffixes)
        };
        int suffixes_n = sizeof(suffixes) / sizeof(Suffix);

// flag *W:
//        output_flag('W');
        output_suffix_list(suffixes, suffixes_n, 'W');

        /// Past active singular 3rd form cannot be formed
        /// from -a ending verbs because of ambiguity, which
        /// ispell has no means of resolving. (Syllables should be counted,
        /// and the first vowel of the word checked). For example:
        // A V A > -AVA,OI     # palava -> paloi, two-syllable
        // A V A > -AVA,I      # saava -> sai, two-syllable
        // A V A > -AVA,I      # valmistava -> valmisti, non-two-syll.

// flag *X:
//        output_flag('X');
        output_suffix_list_to_front(suffixes, suffixes_n, 'X');

        // In anta/a (type1) verbs if stem ends in -ta or -tä, the -ta or -tä
        // changes in imperfect to -s. This doesn't happen always, and is
        // thus considered ambiguous, and not implemented here.

        // Other anta/a verbs 
        output_suffix_group((char) NULL, "[^ÄEIÖYT]ÄVÄ", "ÄVÄ",   // elävä -> eli
                            to_front_vowel(prefix_strings(prefixable_suffixes,
                                                          "I")));
        output_suffix_group((char) NULL, "[^ÄEIÖYT]ÄVÄ", "ÄVÄ",   // elävä -> elivät
                            to_front_vowel(prefix_strings(prefixable_suffixes,
                                                          "IVÄT")));
}


// Following forms form from consonant gradated declination stem:
//      - active present singular and plural, except the 3rd forms
//      - active imperative singular 3rd form
//      - active past singular and plural, except the 3rd forms
//      - some verbs form passive from this stem
//
// Active present singular 1st form (-n) is used as the base.
//
void do_verbs_consonant_gradated_declination_stem()
{
        vector<string> person_endings = // -n is used as base
                new_list("t", "mme", "tte", NULL);

        // Note the empty item of this list.
        vector<string> imperative_and_negative_suffix_particles =
                combine(new_list("", NULL),
                        negative_suffix_particles,
                        imperative_suffix_particles);

        vector<string> past_person_endings = // -n is used as base
                new_list("n", "t", "mme", "tte", NULL);


// Suffix particles        
        add_to_vector(person_endings,
                      suffix_strings(person_endings,
                                     suffix_particles_verbs));
        add_to_vector(past_person_endings,
                      suffix_strings(past_person_endings,
                                     suffix_particles_verbs));
        
// flag *Y, flag *Z
        Suffix suffixes[] =
        {
                /// Active present 1st form
                Suffix("N", "",
                       suffix_particles_verbs),

                // Active present other forms (except negative)
                Suffix("N", "N",
                       person_endings),

                // Active present negative form, which is also the active
                // imperative singular 3rd form.
                Suffix("[^I]N", "N",
                       imperative_and_negative_suffix_particles),

                /// Active past forms, except the 3rd forms
                // Triggers the vowel change, which is not back-front vowel
                // symmetric on declination stems ending in '-a' or '-ä'.
                // There is also other trickery about in these forms.

                // Note, that I haven't included here those vowel change
                // rules, which lead to forms not appearing in verbs.
                // Verbs, whose this stem ends in -i don't have past forms
                Suffix("[^EI]EN", "EN",            // näen -> näin
                       prefix_strings(past_person_endings, "I")),
                Suffix("[^OU]ON", "N",             // uskon -> uskoin
                       prefix_strings(past_person_endings, "I")),       
                Suffix("UON", "UON",               // juon -> join
                       prefix_strings(past_person_endings, "OI")),        
                Suffix("[^U]UN", "N",              // satun -> satuin
                       prefix_strings(past_person_endings, "I")),

                /// huomat/a verbs
                // NOTE, FIXME: saada doesn't declinate this way!
                //              Thus this extremely ugly hack.
                Suffix("[ABCDEFGHIJKLMNOPQRSTUVWXZÅ] [^AEIOU] [AEIOU] A N",
                       "AN",
                       prefix_strings(past_person_endings, "SI")),
                        
                /// Passive forms of anta/a (type1) verbs
                Suffix("[^AEIOU][OU]N", "N",
                       combine(suffix_strings(new_list("taan", NULL),
                                              suffix_particles_verbs),
                               prefix_strings(passive_suffixes, "t"))),
                Suffix("[^AEIOU]AN", "AN",
                       prefix_strings(
                               combine(suffix_strings(new_list("taan", NULL),
                                                      suffix_particles_verbs),
                                       prefix_strings(passive_suffixes, "t")),
                               "e"))
                        
        };
        int suffixes_n = sizeof(suffixes) / sizeof(Suffix);

// flag *Y:        
//        output_flag('Y');
        output_suffix_list(suffixes, suffixes_n, 'Y');

        // For comments see flag *W

// flag *Z:
//        output_flag('Z');
        output_suffix_list_to_front(suffixes, suffixes_n, 'Z');

        // For comment see flag *X.
        // Also note that the alka/a verbs have here gone through consonant
        // gradation, so I don't know how could I distinguish the thing spoken
        // in flag *X. (Excluding T won't help now, as it may be changed)
}
