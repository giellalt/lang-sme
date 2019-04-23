This text documents the speller configuration that has turned out to be the
optimal configuration for North Sámi (ISO code {{SME}}). There are several parts
of the infrastructure that can be used for optimising the speller. They are:

* options to the {{./configure}} command
* settings in {{Makefile.am}} files
* flag elimination

The optimisations described here relate to speed and file size. Fine tuning the
error model is described in a [separate document|/infra/infraremake/HowToConfigureAndOptimiseSpellers.html].

This document is up-to-date as of 28.11.2016.

!!!{{configure}} options

The following configuration is what seems to produce the optimal speller:

{{{
./configure --with-hfst --without-xfst --enable-alignment --enable-spellers
}}}

Note specifically that the following option does ''not'' improve the __SME__
speller (the default value seems good), although it could in certain cases:

{{{
 --disable-minimised-spellers
}}}

The following can be added to increase ''compilation'' speed, although it should
not have an effect on the runtime speed or file size (but that has not been
tested):
{{{
 --with-backend-format=foma --enable-reversed-intersect
}}}

!!!Settings in {{Makefile.am}} files

The file {{tools/spellcheckers/fstbased/desktop/Makefile.am}} contains the
following variables (with the settings used for {{SME}}):

{{{
ENABLE_CORPUS_WEIGHTS=yes
CORPUS_SIZE=
}}}

Enabling corpus weights does help improving suggestion quality quite a bit. And
after experimenting, it seems there is no point in limiting the corpus size
being used for frequency weighting — it does not increase the size of the
speller fst very much, and there is some improvement in suggestion quality
also for the last hapax entries in the generated frequency list.

!!!Flag elimination

Eliminating flag diacritics can have a tremendeous effect on both speller speed
and file size. Uncritical use of flag diacritics elimination can make the
speller file size explode, so please use this optimisation tool carefully, and
test the change in file size and speed after each new flag added to the
elimination list.

The flag elimination is done in {{tools/spellcheckers/fstbased/Makefile.am}}.
The following is used for {{SME}}:

{{{
eliminate flag CmpHyph
eliminate flag CmpN
eliminate flag Der1
eliminate flag Der2
eliminate flag Der3
eliminate flag Der4
eliminate flag Der5
eliminate flag Der_PassL
eliminate flag Der_PassS
}}}

There are more flags being used in {{SME}}, but eliminating them made the fst
grow unreasonably big. The following flags are ''not'' removed for this reason:

{{{
eliminate flag NeedNoun
eliminate flag NeedsVowRed
eliminate flag Want_Left
}}}

{{NeedNoun}} and {{Want_Left}} crosses word boundaries, and will most likely
cause a massive network size explosion if removed. {{NeedsVowRed}} also caused
the fst to grow significantly in size, but that could probably be avoided with
some more work on the lexc code - it should really be just a local constraint.
