GHS labels in LaTeX
###################

:date: 2015-04-30
:tags: GHS, LaTeX, labels
:author: Roland Smith

Introduction
============

Containers filled with chemical substances should be clearly labelled to
indicate what they contain and what the hazards associated with the contents
are.

To replace the many different labelling systems in use around the world, the
"Globally Harmonized System of Classification and Labelling of Chemicals"
(GHS_) was agreed upon.

.. _GHS: http://en.wikipedia.org/wiki/Globally_Harmonized_System_of_Classification_and_Labelling_of_Chemicals

I've been working at a company that makes fiber-reinforced composites for a
number of years. We use a lot of thermosetting resins and related materials.
Often we have to transfer resins or related materials from drums ans IBCs to
smaller containers. These containers also need labels.


The template
============

This is a template for making labels with LaTeX_ that conform to the GHS.  The
template is set up to print 8 labels of 105 x 75 mm on an A4-sized sheet.
These labels are meant for containers up to 25 liters.

.. _LaTeX: http://www.latex-project.org/

How it works
------------

You should have a copy of the material safety data sheet (“MSDS”) for the
material that you want to make a label for at hand.  In this example we'll
make a label for ethanol.

First, copy the file ``template-A4.tex`` to a new file ``ethanol.tex`` and open
that for editing.

Fill in the name of the substance and the signal word as mentioned in the
MSDS;

.. code-block:: tex

    % \Chemname should contain the product identifier for the substance, use
    % \huge, or Large if the name doesn't fit.
    \newcommand{\Chemname}{\huge Ethanol}
    % \Signal contains the signal word
    \newcommand{\Signal}{DANGER}

Next, add up to four symbols. PDF versions of the symbols are provided in the
``figures`` subdirectory.

.. code-block:: tex

    \newcommand{\FirstSymbol}{figures/flamme}
    \newcommand{\SecondSymbol}{figures/exclam}
    %\newcommand{\ThirdSymbol}{}
    %\newcommand{\FourthSymbol}{}

Then add the Hazard and Precaution statements;

.. code-block:: tex

    \newcommand{\Hazards}{%
    H225: Highly flammable liquid and vapour.\\
    H319: Causes serious eye irritation.\\
    }
    \newcommand{\Precautions}{%
    P201: Keep away from heat/sparks/open flames/hot surfaces. -- No smoking.\\
    P233: Keep container tightly closed.\\
    P243: Take precautionary measures against static discharge.\\
    P280: Wear protective gloves / protective clothing / eye protection /
    face protection.\\
    P403+235: Store in a well ventilated place. Keep cool.\\
    }
    \newcommand{\Additionals}{%
    }

As shown above, every statement should be terminated by a double backslash.
My personal preference is to include the number of the hazard and precaution
sentences, but I don't think this is required.  If there are no additionals,
you can leave that empty.

Last but not least you should add the address and emergency contact number of
the supplier of the material;

.. code-block:: tex

    \newcommand{\Firm}{Supplier -- Streetname 1, Town\\
    tel. 012-3456789}

The date on the label will be set to the date the document was compiled, but
you can change that, of course;

.. code-block:: tex

    \newcommand{\filedate}{\number\year-\number\month-\number\day}

The rest of the document should normally not need to be modified.
Producing typeset output is done with ``pdflatex``;

.. code-block:: console

    pdflatex ethanol.tex
    rm -f *.aux *.log *.out

Example output is provided as ``ethanol.pdf``.
