Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id 3453F52A82
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 00:35:42 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUM00978UZ6VE30@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 13 Oct 2013 19:35:31 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C87A12139F; Sun,
	13 Oct 2013 20:35:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 13 Oct 2013 20:35:17 -0400
Message-id: <1381710923-22471-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1381710923-22471-1-git-send-email-denis@denix.org>
References: <1381710923-22471-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/9] relocate_sdk.py: remove local copy, as dylan now has all the fixes
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Oct 2013 00:35:42 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 scripts/relocate_sdk.py | 219 ------------------------------------------------
 1 file changed, 219 deletions(-)
 delete mode 100755 scripts/relocate_sdk.py

diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
deleted file mode 100755
index 1d7bbb3..0000000
--- a/scripts/relocate_sdk.py
+++ /dev/null
@@ -1,219 +0,0 @@
-#!/usr/bin/env python
-#
-# Copyright (c) 2012 Intel Corporation
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
-#
-# DESCRIPTION
-# This script is called by the SDK installer script. It replaces the dynamic
-# loader path in all binaries and also fixes the SYSDIR paths/lengths and the
-# location of ld.so.cache in the dynamic loader binary
-#
-# AUTHORS
-# Laurentiu Palcu <laurentiu.palcu@intel.com>
-#
-
-import struct
-import sys
-import stat
-import os
-import re
-import errno
-
-old_prefix = re.compile("##DEFAULT_INSTALL_DIR##")
-
-def get_arch():
-    f.seek(0)
-    e_ident =f.read(16)
-    ei_mag0,ei_mag1_3,ei_class = struct.unpack("<B3sB11x", e_ident)
-
-    if (ei_mag0 != 0x7f and ei_mag1_3 != "ELF") or ei_class == 0:
-        return 0
-
-    if ei_class == 1:
-        return 32
-    elif ei_class == 2:
-        return 64
-
-def parse_elf_header():
-    global e_type, e_machine, e_version, e_entry, e_phoff, e_shoff, e_flags,\
-           e_ehsize, e_phentsize, e_phnum, e_shentsize, e_shnum, e_shstrndx
-
-    f.seek(0)
-    elf_header = f.read(64)
-
-    if arch == 32:
-        # 32bit
-        hdr_fmt = "<HHILLLIHHHHHH"
-        hdr_size = 52
-    else:
-        # 64bit
-        hdr_fmt = "<HHIQQQIHHHHHH"
-        hdr_size = 64
-
-    e_type, e_machine, e_version, e_entry, e_phoff, e_shoff, e_flags,\
-    e_ehsize, e_phentsize, e_phnum, e_shentsize, e_shnum, e_shstrndx =\
-        struct.unpack(hdr_fmt, elf_header[16:hdr_size])
-
-def change_interpreter(elf_file_name):
-    if arch == 32:
-        ph_fmt = "<IIIIIIII"
-    else:
-        ph_fmt = "<IIQQQQQQ"
-
-    """ look for PT_INTERP section """
-    for i in range(0,e_phnum):
-        f.seek(e_phoff + i * e_phentsize)
-        ph_hdr = f.read(e_phentsize)
-        if arch == 32:
-            # 32bit
-            p_type, p_offset, p_vaddr, p_paddr, p_filesz,\
-                p_memsz, p_flags, p_align = struct.unpack(ph_fmt, ph_hdr)
-        else:
-            # 64bit
-            p_type, p_flags, p_offset, p_vaddr, p_paddr, \
-            p_filesz, p_memsz, p_align = struct.unpack(ph_fmt, ph_hdr)
-
-        """ change interpreter """
-        if p_type == 3:
-            # PT_INTERP section
-            f.seek(p_offset)
-            # External SDKs with mixed pre-compiled binaries should not get
-            # relocated so look for some variant of /lib
-            fname = f.read(11)
-            if fname.startswith("/lib/") or fname.startswith("/lib64/") or fname.startswith("/lib32/") or fname.startswith("/usr/lib32/") or fname.startswith("/usr/lib32/") or fname.startswith("/usr/lib64/"):
-                break
-            if (len(new_dl_path) >= p_filesz):
-                print "ERROR: could not relocate %s, interp size = %i and %i is needed." % (elf_file_name, p_memsz, len(new_dl_path) + 1)
-                break
-            dl_path = new_dl_path + "\0" * (p_filesz - len(new_dl_path))
-            f.seek(p_offset)
-            f.write(dl_path)
-            break
-
-def change_dl_sysdirs():
-    if arch == 32:
-        sh_fmt = "<IIIIIIIIII"
-    else:
-        sh_fmt = "<IIQQQQIIQQ"
-
-    """ read section string table """
-    f.seek(e_shoff + e_shstrndx * e_shentsize)
-    sh_hdr = f.read(e_shentsize)
-    if arch == 32:
-        sh_offset, sh_size = struct.unpack("<16xII16x", sh_hdr)
-    else:
-        sh_offset, sh_size = struct.unpack("<24xQQ24x", sh_hdr)
-
-    f.seek(sh_offset)
-    sh_strtab = f.read(sh_size)
-
-    sysdirs = sysdirs_len = ""
-
-    """ change ld.so.cache path and default libs path for dynamic loader """
-    for i in range(0,e_shnum):
-        f.seek(e_shoff + i * e_shentsize)
-        sh_hdr = f.read(e_shentsize)
-
-        sh_name, sh_type, sh_flags, sh_addr, sh_offset, sh_size, sh_link,\
-            sh_info, sh_addralign, sh_entsize = struct.unpack(sh_fmt, sh_hdr)
-
-        name = sh_strtab[sh_name:sh_strtab.find("\0", sh_name)]
-
-        """ look only into SHT_PROGBITS sections """
-        if sh_type == 1:
-            f.seek(sh_offset)
-            """ default library paths cannot be changed on the fly because  """
-            """ the string lengths have to be changed too.                  """
-            if name == ".sysdirs":
-                sysdirs = f.read(sh_size)
-                sysdirs_off = sh_offset
-                sysdirs_sect_size = sh_size
-            elif name == ".sysdirslen":
-                sysdirslen = f.read(sh_size)
-                sysdirslen_off = sh_offset
-            elif name == ".ldsocache":
-                ldsocache_path = f.read(sh_size)
-                new_ldsocache_path = old_prefix.sub(new_prefix, ldsocache_path)
-                # pad with zeros
-                new_ldsocache_path += "\0" * (sh_size - len(new_ldsocache_path))
-                # write it back
-                f.seek(sh_offset)
-                f.write(new_ldsocache_path)
-
-    if sysdirs != "" and sysdirslen != "":
-        paths = sysdirs.split("\0")
-        sysdirs = ""
-        sysdirslen = ""
-        for path in paths:
-            """ exit the loop when we encounter first empty string """
-            if path == "":
-                break
-
-            new_path = old_prefix.sub(new_prefix, path)
-            sysdirs += new_path + "\0"
-
-            if arch == 32:
-                sysdirslen += struct.pack("<L", len(new_path))
-            else:
-                sysdirslen += struct.pack("<Q", len(new_path))
-
-        """ pad with zeros """
-        sysdirs += "\0" * (sysdirs_sect_size - len(sysdirs))
-
-        """ write the sections back """
-        f.seek(sysdirs_off)
-        f.write(sysdirs)
-        f.seek(sysdirslen_off)
-        f.write(sysdirslen)
-
-
-# MAIN
-if len(sys.argv) < 4:
-    sys.exit(-1)
-
-new_prefix = sys.argv[1]
-new_dl_path = sys.argv[2]
-executables_list = sys.argv[3:]
-
-for e in executables_list:
-    perms = os.stat(e)[stat.ST_MODE]
-    if os.access(e, os.W_OK|os.R_OK):
-        perms = None
-    else:
-        os.chmod(e, perms|stat.S_IRWXU)
-
-    try:
-        f = open(e, "r+b")
-    except IOError, ioex:
-        if ioex.errno == errno.ETXTBSY:
-            print("Could not open %s. File used by another process.\nPlease "\
-                  "make sure you exit all processes that might use any SDK "\
-                  "binaries." % e)
-        else:
-            print("Could not open %s: %s(%d)" % (e, ioex.strerror, ioex.errno))
-        sys.exit(-1)
-
-    arch = get_arch()
-    if arch:
-        parse_elf_header()
-        change_interpreter(e)
-        change_dl_sysdirs()
-
-    """ change permissions back """
-    if perms:
-        os.chmod(e, perms)
-
-    f.close()
-
-- 
1.8.3.2


