#!/dunnstore/hassan/paul/Git_repository/python_scripts/Humagne_C.D_validation/py3/bin/python3
# -*- coding: utf-8 -*-
import re
import sys
from biorun.methods.fasta_filter import run
if __name__ == '__main__':
    sys.argv[0] = re.sub(r'(-script\.pyw|\.exe)?$', '', sys.argv[0])
    sys.exit(run())
