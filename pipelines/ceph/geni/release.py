#!/usr/bin/env python
import os
import geni.cloudlab_util as cl
cl.release('ceph-'+os.environ['CLOUDLAB_USER'])
