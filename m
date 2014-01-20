Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 115CC52A6A
	for <meta-arago@arago-project.org>;
	Mon, 20 Jan 2014 21:54:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0KLsDPU029796
	for <meta-arago@arago-project.org>; Mon, 20 Jan 2014 15:54:13 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0KLsD3m006286
	for <meta-arago@arago-project.org>; Mon, 20 Jan 2014 15:54:13 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 20 Jan 2014 15:54:12 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0KLs4SS025418;
	Mon, 20 Jan 2014 15:54:11 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 20 Jan 2014 17:16:57 -0600
Message-ID: <1390259818-10267-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1390259818-10267-1-git-send-email-fcooper@ti.com>
References: <1390259818-10267-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/3] stress: Pull stress into meta-arago-extras
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
X-List-Received-Date: Mon, 20 Jan 2014 21:54:14 -0000
Content-Type: text/plain

* Stress is a useful userspace testing tool.
* The original recipe can be found in meta-linaro/meta-linaro/recipes-extra.
* However, to avoid pulling in that entire layer included bbappend overrides
  simply overlay the recipe into meta-arago-extras.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-devtools/stress/files/texinfo.patch    |   79 ++++++++++++++++++++
 .../recipes-devtools/stress/stress_1.0.4.bb        |   16 ++++
 2 files changed, 95 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/stress/files/texinfo.patch
 create mode 100644 meta-arago-extras/recipes-devtools/stress/stress_1.0.4.bb

diff --git a/meta-arago-extras/recipes-devtools/stress/files/texinfo.patch b/meta-arago-extras/recipes-devtools/stress/files/texinfo.patch
new file mode 100644
index 0000000..5ac5951
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/stress/files/texinfo.patch
@@ -0,0 +1,79 @@
+--- a/doc/stress.texi
++++ b/doc/stress.texi
+@@ -62,47 +62,47 @@
+ 
+ @table @samp
+ @item -?
+-@itemx --help
++@item --help
+ Show help information.
+ 
+-@itemx --version
++@item --version
+ Show version information.
+ 
+ @item -v
+-@itemx --verbose
++@item --verbose
+ Turn up verbosity.
+ 
+ @item -q
+-@itemx --quiet
++@item --quiet
+ Turn down verbosity.
+ 
+ @item -n
+-@itemx --dry-run
++@item --dry-run
+ Show what would have been done.
+ 
+ @item -t @var{secs}
+-@itemx --timeout @var{secs}
++@item --timeout @var{secs}
+ Time out after @var{secs} seconds.
+ 
+-@itemx --backoff @var{usecs}
++@item --backoff @var{usecs}
+ Wait for factor of @var{usecs} microseconds before starting work.
+ 
+ @item -c @var{forks}
+-@itemx --cpu @var{forks}
++@item --cpu @var{forks}
+ Spawn @var{forks} processes each spinning on @samp{sqrt()}.
+ 
+ @item -i @var{forks}
+-@itemx --io @var{forks}
++@item --io @var{forks}
+ Spawn @var{forks} processes each spinning on @samp{sync()}.
+ 
+ @item -m @var{forks}
+-@itemx --vm @var{forks}
++@item --vm @var{forks}
+ Spawn @var{forks} processes each spinning on @samp{malloc()}.
+ 
+-@itemx --vm-bytes @var{bytes}
++@item --vm-bytes @var{bytes}
+ Allocate @var{bytes} number of bytes.  The default is 1.
+ 
+-@itemx --vm-hang
++@item --vm-hang
+ Instruct each vm hog process to go to sleep after allocating memory.  This
+ contrasts with their normal behavior, which is to free the memory and
+ reallocate @emph{ad infinitum}.  This is useful for simulating low memory
+@@ -114,13 +114,13 @@
+ @end example
+ 
+ @item -d @var{forks}
+-@itemx --hdd @var{forks}
++@item --hdd @var{forks}
+ Spawn @var{forks} processes each spinning on @samp{write()}.
+ 
+-@itemx --hdd-bytes @var{bytes}
++@item --hdd-bytes @var{bytes}
+ Write @var{bytes} number of bytes.  The default is 1GB.
+ 
+-@itemx --hdd-noclean
++@item --hdd-noclean
+ Do not unlink file(s) to which random ASCII data is written.
+ 
+ @end table
diff --git a/meta-arago-extras/recipes-devtools/stress/stress_1.0.4.bb b/meta-arago-extras/recipes-devtools/stress/stress_1.0.4.bb
new file mode 100644
index 0000000..04ad6ce
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/stress/stress_1.0.4.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Deliberately simple workload generator for POSIX systems. It \
+imposes a configurable amount of CPU, memory, I/O, and disk stress on the system."
+HOMEPAGE = "http://people.seas.harvard.edu/~apw/stress/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+PR = "r0"
+
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/stress/stress-${PV}.tar.gz/a607afa695a511765b40993a64c6e2f4/stress-${PV}.tar.gz \
+           file://texinfo.patch \
+           "
+
+SRC_URI[md5sum] = "a607afa695a511765b40993a64c6e2f4"
+SRC_URI[sha256sum] = "369c997f65e8426ae8b318d4fdc8e6f07a311cfa77cc4b25dace465c582163c0"
+
+inherit autotools
-- 
1.7.0.4


