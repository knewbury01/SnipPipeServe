# Welcome to Snip Pipe Serve
  * This is a tool to assess cryptographic security in Stack Overflow code snippets!
  * Input: code snippets from SO!
  * Output: Error reports, as produced by [CogniCrypt](https://github.com/CROSSINGTUD/CryptoAnalysis)


# Steps to process:

Disclaimer: This project was developed on Mac OSX. There are some differences between GNU utils and BSD utils. For example csplit, and sed. All instances of sed's in scripts are annotated with the alternative, however some combing is currently required to make everything "just work" on Linux.

  ## Acquire Entire Dataset

  * this is around 400GB, so beware of that
  1) Obtain Stack Overflow dump formatted as sqlite db from [here](https://github.com/awwong1/sotorrent-sqlite3#data)

  ## Acquire Snippets of Interest:

  * code snippets of interest in this project are:
    * From accepted answer posts
    * Answer posts are for question posts tagged with "Java" AND "Security"
    * Code snippets are latest version
    * Each code block in a post is treated as a separate snippet
  * The result of this step is a set of files xx* containing snippets. 

    
  2) perform the following steps to obtain textual format of snippets:


      $ sqlite3
      sqlite> .open sotorrent18_12.sqlite3
      sqlite> .read snippetquery.sqlite
      $ ./splitsnippets.sh IndividualSnippets.txt

  ## Sort Snippets:

  * As this project focuses on **cryptographic** security, the snippets of interest are ones that use cryptographic APIs. To detect these we filter based on textual content, if the snippet contains a core class or interface keyword from the [JCA](https://docs.oracle.com/javase/9/security/java-cryptography-architecture-jca-reference-guide.htm#JSSEC-GUID-2BCFDD85-D533-4E6C-8CE9-29990DEB0190)

  3) Moves snippets containing at least one of the keywords into own dir;


    $ ./findKeywords.sh


  ## Compile Snippets:

  * CogniCrypt operates on java bytecode. This means we need to compile the snippets. This is the main contribution of this work. Here we use [Soot's PPA](http://www.sable.mcgill.ca/ppa/ppa_polyglot.html) implementation to do the compilation.
  * This step generates a set of files X* that are the attempts of this process
  * X* files left in this dir will be the failed ones
  * But the corresponding PPA outputs are placed in fails dir

  4) First try to compile snippets with minor modifications. Then iteratively try a few other things. Further details on what these modifications are can be found [here]().


     $ cd containKeyword
     $ ./pipelineNoWork.sh
     $ ./pipeline.sh


  ## Assess Security:

  * CogniCrypt produces reports of objects assessed, and errors found. These are piped ! into text files in CogniCryptResults
  5) Finally ready to assess correctness of crypto API usage in these snippets


     $ ./runCogniCrypt.sh

  ## Produce a Summary:

  6) For a lot of data it is nice to have a summary


     $ ./summary.sh