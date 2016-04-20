Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 2A0B452A65
	for <meta-arago@arago-project.org>;
	Wed, 20 Apr 2016 19:33:47 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.152])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5Y002DL6BXH090@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 20 Apr 2016 14:33:34 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=vyo-Ye8WAAAA:8 a=vTr9H3xdAAAA:8
	a=SOadRDBe7Dq69O_VYWcA:9	a=bsCs_uRUHthtNiy9:21 a=p6wAvOYv39PmUsDl:21
Received: by 100.15.86.14 with SMTP id 5ae7381e; Wed, 20 Apr 2016 19:33:34 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C4800161FBE;	Wed,
	20 Apr 2016 15:33:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 20 Apr 2016 15:33:20 -0400
Message-id: <1461180805-25733-12-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1461180805-25733-1-git-send-email-denis@denix.org>
References: <1461180805-25733-1-git-send-email-denis@denix.org>
Subject: [PATCH 11/16] stress: available from oe-core, drop locally
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
X-List-Received-Date: Wed, 20 Apr 2016 19:33:49 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/stress/files/texinfo.patch    | 79 ----------------------
 .../recipes-devtools/stress/stress_1.0.4.bb        | 16 -----
 2 files changed, 95 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/stress/files/texinfo.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/stress/stress_1.0.4.bb

diff --git a/meta-arago-extras/recipes-devtools/stress/files/texinfo.patch b/meta-arago-extras/recipes-devtools/stress/files/texinfo.patch
deleted file mode 100644
index 5ac5951..0000000
--- a/meta-arago-extras/recipes-devtools/stress/files/texinfo.patch
+++ /dev/null
@@ -1,79 +0,0 @@
---- a/doc/stress.texi
-+++ b/doc/stress.texi
-@@ -62,47 +62,47 @@
- 
- @table @samp
- @item -?
--@itemx --help
-+@item --help
- Show help information.
- 
--@itemx --version
-+@item --version
- Show version information.
- 
- @item -v
--@itemx --verbose
-+@item --verbose
- Turn up verbosity.
- 
- @item -q
--@itemx --quiet
-+@item --quiet
- Turn down verbosity.
- 
- @item -n
--@itemx --dry-run
-+@item --dry-run
- Show what would have been done.
- 
- @item -t @var{secs}
--@itemx --timeout @var{secs}
-+@item --timeout @var{secs}
- Time out after @var{secs} seconds.
- 
--@itemx --backoff @var{usecs}
-+@item --backoff @var{usecs}
- Wait for factor of @var{usecs} microseconds before starting work.
- 
- @item -c @var{forks}
--@itemx --cpu @var{forks}
-+@item --cpu @var{forks}
- Spawn @var{forks} processes each spinning on @samp{sqrt()}.
- 
- @item -i @var{forks}
--@itemx --io @var{forks}
-+@item --io @var{forks}
- Spawn @var{forks} processes each spinning on @samp{sync()}.
- 
- @item -m @var{forks}
--@itemx --vm @var{forks}
-+@item --vm @var{forks}
- Spawn @var{forks} processes each spinning on @samp{malloc()}.
- 
--@itemx --vm-bytes @var{bytes}
-+@item --vm-bytes @var{bytes}
- Allocate @var{bytes} number of bytes.  The default is 1.
- 
--@itemx --vm-hang
-+@item --vm-hang
- Instruct each vm hog process to go to sleep after allocating memory.  This
- contrasts with their normal behavior, which is to free the memory and
- reallocate @emph{ad infinitum}.  This is useful for simulating low memory
-@@ -114,13 +114,13 @@
- @end example
- 
- @item -d @var{forks}
--@itemx --hdd @var{forks}
-+@item --hdd @var{forks}
- Spawn @var{forks} processes each spinning on @samp{write()}.
- 
--@itemx --hdd-bytes @var{bytes}
-+@item --hdd-bytes @var{bytes}
- Write @var{bytes} number of bytes.  The default is 1GB.
- 
--@itemx --hdd-noclean
-+@item --hdd-noclean
- Do not unlink file(s) to which random ASCII data is written.
- 
- @end table
diff --git a/meta-arago-extras/recipes-devtools/stress/stress_1.0.4.bb b/meta-arago-extras/recipes-devtools/stress/stress_1.0.4.bb
deleted file mode 100644
index 04ad6ce..0000000
--- a/meta-arago-extras/recipes-devtools/stress/stress_1.0.4.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Deliberately simple workload generator for POSIX systems. It \
-imposes a configurable amount of CPU, memory, I/O, and disk stress on the system."
-HOMEPAGE = "http://people.seas.harvard.edu/~apw/stress/"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-PR = "r0"
-
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/stress/stress-${PV}.tar.gz/a607afa695a511765b40993a64c6e2f4/stress-${PV}.tar.gz \
-           file://texinfo.patch \
-           "
-
-SRC_URI[md5sum] = "a607afa695a511765b40993a64c6e2f4"
-SRC_URI[sha256sum] = "369c997f65e8426ae8b318d4fdc8e6f07a311cfa77cc4b25dace465c582163c0"
-
-inherit autotools
-- 
2.2.0


