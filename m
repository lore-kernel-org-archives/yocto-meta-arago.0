Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 6029A52007
	for <meta-arago@arago-project.org>;
	Fri,  8 Apr 2016 05:55:37 +0000 (UTC)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.152])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5A001BCWGOKI20@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 08 Apr 2016 00:55:37 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=vZSPgBswV7W_9K1mbY0A:9
Received: by 100.15.86.14 with SMTP id 4653786b; Fri, 08 Apr 2016 05:55:37 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F1B70161F78;	Fri,
	8 Apr 2016 01:55:35 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 08 Apr 2016 01:55:35 -0400
Message-id: <1460094935-18489-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] opkg-utils: re-do find/ls code to not fail on filenames with spaces
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
X-List-Received-Date: Fri, 08 Apr 2016 05:55:37 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...re-do-find-ls-code-to-not-fail-on-filenam.patch | 56 ++++++++++++++++++++++
 .../opkg-utils/opkg-utils_%.bbappends              |  5 ++
 2 files changed, 61 insertions(+)
 create mode 100644 meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-re-do-find-ls-code-to-not-fail-on-filenam.patch
 create mode 100644 meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils_%.bbappends

diff --git a/meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-re-do-find-ls-code-to-not-fail-on-filenam.patch b/meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-re-do-find-ls-code-to-not-fail-on-filenam.patch
new file mode 100644
index 0000000..5cbb55a
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-re-do-find-ls-code-to-not-fail-on-filenam.patch
@@ -0,0 +1,56 @@
+From 8e424296ce2af4a5a7392c38a31f8723f9b9fbda Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Thu, 7 Apr 2016 20:43:13 -0400
+Subject: [PATCH] opkg-build: re-do find/ls code to not fail on filenames with
+ spaces
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ opkg-build | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/opkg-build b/opkg-build
+index a9ccad2..07305b2 100755
+--- a/opkg-build
++++ b/opkg-build
+@@ -6,7 +6,6 @@
+ # 2003-04-25 rea@sr.unh.edu
+ #   Updated to work on Familiar Pre0.7rc1, with busybox tar.
+ #   Note it Requires: binutils-ar (since the busybox ar can't create)
+-#   For UID debugging it needs a better "find".
+ set -e
+ 
+ version=1.0
+@@ -47,12 +46,12 @@ pkg_appears_sane() {
+ 
+ 	PKG_ERROR=0
+ 
+-	tilde_files=`find . -name '*~'`
++	tilde_files=`find . -name '*~' -ls -printf '\\\n'`
+ 	if [ -n "$tilde_files" ]; then
+ 	    if [ "$noclean" = "1" ]; then
+ 		echo "*** Warning: The following files have names ending in '~'.
+ You probably want to remove them: " >&2
+-		ls -ld $tilde_files
++		echo -e $tilde_files
+ 		if [ $? -ne 0 ]; then
+ 			echo "*** Error: Fail to list files have names ending in '~'."
+ 			exit 1
+@@ -64,12 +63,12 @@ You probably want to remove them: " >&2
+ 	    fi
+ 	fi
+ 
+-	large_uid_files=`find . -uid +99 || true`
++	large_uid_files=`find . -uid +99 -ls -printf '\\\n' || true`
+ 
+ 	if [ "$ogargs" = "" ]  && [ -n "$large_uid_files" ]; then
+ 		echo "*** Warning: The following files have a UID greater than 99.
+ You probably want to chown these to a system user: " >&2
+-		ls -ld $large_uid_files
++		echo -e $large_uid_files
+ 		if [ $? -ne 0 ]; then
+ 			echo "*** Error: Fail to list files have a UID greater than 99."
+ 			exit 1
+-- 
+2.2.0
+
diff --git a/meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils_%.bbappends b/meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils_%.bbappends
new file mode 100644
index 0000000..ed13087
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils_%.bbappends
@@ -0,0 +1,5 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += " \
+	file://0001-opkg-build-re-do-find-ls-code-to-not-fail-on-filenam.patch \
+"
-- 
2.2.0


