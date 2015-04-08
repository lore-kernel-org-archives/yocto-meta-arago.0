Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 1FAF852A81
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2015 20:20:09 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NMI00EPZ8H3GT10@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 08 Apr 2015 15:19:52 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpCc6mbq c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=e9J7MTPGsLIA:10
	a=sozttTNsAAAA:8 a=kP6i_H-9AAAA:8	a=DX_STfnTiOZ5PKkjnRIA:9
	a=ka_Bsb4LX1YA:10
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CD131200F0;	Wed,
	8 Apr 2015 16:19:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 08 Apr 2015 16:19:50 -0400
Message-id: <1428524390-6848-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] stream: use proper version, cleanup license and QA issues
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
X-List-Received-Date: Wed, 08 Apr 2015 20:20:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{stream_git.bbappend => stream_5.10.bbappend}  |  3 ++
 meta-arago-extras/conf/layer.conf                  |  2 ++
 .../licenses/Stream_Benchmark_License              | 34 ++++++++++++++++++++++
 .../stream/{stream_git.bb => stream_5.10.bb}       |  2 +-
 4 files changed, 40 insertions(+), 1 deletion(-)
 rename meta-arago-distro/recipes-benchmark/stream/{stream_git.bbappend => stream_5.10.bbappend} (77%)
 create mode 100644 meta-arago-extras/licenses/Stream_Benchmark_License
 rename meta-arago-extras/recipes-benchmark/stream/{stream_git.bb => stream_5.10.bb} (98%)

diff --git a/meta-arago-distro/recipes-benchmark/stream/stream_git.bbappend b/meta-arago-distro/recipes-benchmark/stream/stream_5.10.bbappend
similarity index 77%
rename from meta-arago-distro/recipes-benchmark/stream/stream_git.bbappend
rename to meta-arago-distro/recipes-benchmark/stream/stream_5.10.bbappend
index 0f93e02..6418ff4 100644
--- a/meta-arago-distro/recipes-benchmark/stream/stream_git.bbappend
+++ b/meta-arago-distro/recipes-benchmark/stream/stream_5.10.bbappend
@@ -1,3 +1,6 @@
+INSANE_SKIP_${PN} += "ldflags"
+INSANE_SKIP_${PN}-openmp += "ldflags"
+
 PR_append = "-arago1"
 
 BRANCH = "sdk"
diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
index db98224..d3064e5 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -10,3 +10,5 @@ BBFILE_PRIORITY_meta-arago-extras = "10"
 
 # Set a variable to get to the top of the metadata location
 ARAGOBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
+
+LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-arago-extras/licenses/Stream_Benchmark_License b/meta-arago-extras/licenses/Stream_Benchmark_License
new file mode 100644
index 0000000..cf1c8e0
--- /dev/null
+++ b/meta-arago-extras/licenses/Stream_Benchmark_License
@@ -0,0 +1,34 @@
+*=======================================================================
+*-----------------------------------------------------------------------
+* Copyright 1991-2003: John D. McCalpin
+*-----------------------------------------------------------------------
+* License:
+*  1. You are free to use this program and/or to redistribute
+*     this program.
+*  2. You are free to modify this program for your own use,
+*     including commercial use, subject to the publication
+*     restrictions in item 3.
+*  3. You are free to publish results obtained from running this
+*     program, or from works that you derive from this program,
+*     with the following limitations:
+*     3a. In order to be referred to as "STREAM benchmark results",
+*         published results must be in conformance to the STREAM
+*         Run Rules, (briefly reviewed below) published at
+*         http://www.cs.virginia.edu/stream/ref.html
+*         and incorporated herein by reference.
+*         As the copyright holder, John McCalpin retains the
+*         right to determine conformity with the Run Rules.
+*     3b. Results based on modified source code or on runs not in
+*         accordance with the STREAM Run Rules must be clearly
+*         labelled whenever they are published.  Examples of
+*         proper labelling include:
+*         "tuned STREAM benchmark results" 
+*         "based on a variant of the STREAM benchmark code"
+*         Other comparable, clear and reasonable labelling is
+*         acceptable.
+*     3c. Submission of results to the STREAM benchmark web site
+*         is encouraged, but not required.
+*  4. Use of this program or creation of derived works based on this
+*     program constitutes acceptance of these licensing restrictions.
+*  5. Absolutely no warranty is expressed or implied.
+*-----------------------------------------------------------------------
diff --git a/meta-arago-extras/recipes-benchmark/stream/stream_git.bb b/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
similarity index 98%
rename from meta-arago-extras/recipes-benchmark/stream/stream_git.bb
rename to meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
index 6a86dc9..7661722 100644
--- a/meta-arago-extras/recipes-benchmark/stream/stream_git.bb
+++ b/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
@@ -4,7 +4,7 @@ LICENSE = "Stream_Benchmark_License"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=bca8cbe07976fe64c8946378d08314b0"
 SECTION = "system"
 
-PR = "r2"
+PR = "r0"
 
 BRANCH ?= "master"
 SRCREV = "b66f2bab5d6d0b35732ef8406ae03873725a3306"
-- 
2.2.0


