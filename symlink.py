#!/usr/bin/env python
##############################################################################
# Automatically symlink all dotfiles to the user's home directory.
#
# Copyright (c) 2013, Martey Dodoo.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
##############################################################################
import errno
import os
import shutil
import re


home_dir = os.environ["HOME"] + '/'
# Name of the directory where dotfiles are located.
dotfiles_dir = home_dir + "dotfiles/"
# Name of the directory where already-existing dotfiles should be moved.
backup_dir = home_dir + "dotfiles-backup/"

# Create backup directory if needed.
try:
    os.mkdir(backup_dir)
    print "Backup directory %s created." % backup_dir
except OSError as backup_creation_err:
    if backup_creation_err.errno == errno.EEXIST:
        print "Backup directory %s already exists." % backup_dir
    else:
        raise

# Generate a list of dotfiles from $dotfiles that we will need to link.
dotfiles = os.listdir(dotfiles_dir)
# For each file/directory in this list, attempt to symlink to the
# home directory.
for root, subFolders, files in os.walk(dotfiles_dir):
    files.extend(subFolders)
    for filename in files:
        if not re.match('.*\.symlink$',filename):
            continue

        # Add dots to dotfile names.
        dotfile = '.' + filename[:-8]
        oldpath = os.path.abspath(os.path.join(root, filename))
        # Assume that this is a directory and try to create a symlink.
        try:
            os.symlink(oldpath, home_dir + dotfile)
            print "Linked %s to %s." % (oldpath, home_dir + dotfile)
        except OSError as link_err:
            if link_err.errno == errno.EEXIST:
                # Check to see if this is a symlink, which means it has
                # already been copied.
                if os.path.islink(home_dir + dotfile):
                    print "%s is already a symlink." % (home_dir + dotfile)
                    continue

                # This file already exists in the home directory,
                # so we move the old file to the backup directory.
                print "%s already exists in %s." % (dotfile, home_dir)
                shutil.move(home_dir + dotfile, backup_dir + dotfile)
                print "Moved %s to %s" % (dotfile, backup_dir)
                os.symlink(dotfiles_dir + dotfile, home_dir + dotfile)
                print "Linked %s to %s." % (dotfiles_dir + filename,
                                            home_dir + dotfile)
            else:
                raise
