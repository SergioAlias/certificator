# Certificator: master of names

Small script for *ad hoc* multiple named certificates generation. It is likely that it does not work for your own certificates, but feel free to adapt it to your needs.

I will write a proper description when I feel about it, but in the meantime: the script basically treats documents as zipped files and search for keywords inside the corresponding XML. It introduces there the names (I save them in a CSV file) and saves the document.

Newlines are a little bit tricky: I use an empty extra column in the CSV files to prevent newlines to be introduced into the XML (it is not a big problem but for example in my case the text became left aligned instead of centered).

You can use [`pdfunite`](https://manpages.ubuntu.com/manpages/trusty/man1/pdfunite.1.html) to merge all the PDF files generated.