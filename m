Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7AA0D52A04
	for <meta-arago@arago-project.org>;
	Mon, 16 Feb 2015 21:30:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1GLUVci004504
	for <meta-arago@arago-project.org>; Mon, 16 Feb 2015 15:30:31 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1GLUUaX027940
	for <meta-arago@arago-project.org>; Mon, 16 Feb 2015 15:30:30 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 16 Feb 2015 15:30:30 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1GLUTrZ028899;	Mon, 16 Feb 2015 15:30:30 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t1GLUOpn030075;	Tue, 17 Feb 2015 03:00:28 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Feb 2015 15:30:17 -0600
Message-ID: <1424122222-26709-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1424122222-26709-1-git-send-email-fcooper@ti.com>
References: <1424122222-26709-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/8] unshallow-repositories: Add script to unshallow repositories
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
X-List-Received-Date: Mon, 16 Feb 2015 21:30:33 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Sourceipk includes the ability to do a shallow clone however the process to
  unshallow a repository is broken depending on the version of git your using.
* Unfortunately Ubuntu 12.04 includes a version of git that can not properly
  unshallow an entire git repository ( atleast a large one like the Linux
  git repository )
* Now that git is included in linux-devkit no matter what version of git
  the host has the shallowed git repository can now be unshallowed.
  To make things easier this script automatically handles the process of
  unshallowing the git repository.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../unshallow-repositories.sh                      |  110 ++++++++++++++++++++
 .../unshallow-repositories_1.0.bb                  |   15 +++
 2 files changed, 125 insertions(+)
 create mode 100755 meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
 create mode 100644 meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb

diff --git a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
new file mode 100755
index 0000000..f20a9b5
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
@@ -0,0 +1,110 @@
+#!/bin/bash
+
+# Authors:
+#    Franklin Cooper Jr.
+# This distribution contains contributions or derivatives under copyright
+# as follows:
+#
+# Copyright (c) 2015, Texas Instruments Incorporated
+# All rights reserved.
+#
+# Redistribution and use in source and binary forms, with or without
+# modification, are permitted provided that the following conditions
+# are met:
+# - Redistributions of source code must retain the above copyright notice,
+#   this list of conditions and the following disclaimer.
+# - Redistributions in binary form must reproduce the above copyright
+#   notice, this list of conditions and the following disclaimer in the
+#   documentation and/or other materials provided with the distribution.
+# - Neither the name of Texas Instruments nor the names of its
+#   contributors may be used to endorse or promote products derived
+#   from this software without specific prior written permission.
+#
+# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
+# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
+# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
+# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
+# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+install_dir="__SDK_INSTALL_DIR__"
+
+# Find git binary within the host native bin directory
+sdk_git_bin="$install_dir/linux-devkit/sysroots/i*/usr/bin/git"
+sdk_git_bin=`which $sdk_git_bin`
+
+if [ "$sdk_git_bin" = "" ]
+then
+    echo
+    echo "Couldn't find the git command within linux-devkit"
+    echo "Unable to automatically unshallow git repository"
+    echo "If you have git installed and a version higher than 1.8.0.3 ( git --version)"
+    echo "You can manually unshallow the Linux git repository by running the below"
+    echo "command within the SDK's Linux git repository"
+    echo "git fetch --unshallow"
+    echo
+    exit 1
+fi
+
+linux_dir=`find $install_dir/board-support -maxdepth 1 -name "linux*"`
+linux=`basename $linux_dir`
+
+if [ -f $linux_dir/.git/shallow ]
+then
+    echo
+    echo "The kernel git repository has been trimmed to reduce the size of the SDK installer"
+    echo "in a process called \"shallowing\". This process causes the repository to include"
+    echo "only a small fraction of the entire git history. To retrieve the entire git history"
+    echo "you must unshallow the repository. This will require internet access and if applicable"
+    echo "proper git proxy settings to access the original remote repository. This script will"
+    echo "automatically unshallow the Linux repository for you and retrieve its full history."
+    echo "Depending on your internet speed this process can take 5+ minutes."
+    echo "Would you like to continue (y/n)?"
+    echo
+
+    read -p "[ y ] " continueunshallow
+    echo
+
+    if [ ! -n "$continueunshallow" ]; then
+       continueunshallow="y"
+    fi
+
+    if [ "$continueunshallow" != "y" ]; then
+        echo "You selected no. Please run script the again when your ready to unshallow the"
+        echo "repository."
+        exit 0
+    fi
+
+    echo "The unshallowing process has begun. For the first couple of minutes you may not see"
+    echo "any additional output. This is normal."
+
+    cd $linux_dir
+
+    $sdk_git_bin fetch --unshallow
+
+    if [ "$?" = "0" ]
+    then
+        echo
+        echo "The unshallowing process has been completed. The Linux git repository has been"
+        echo "fully restored."
+    else
+        echo
+        echo "Error unshallowing git repository. Please check your internet connection and"
+        echo "your git proxy settings."
+    fi
+
+    echo
+
+    cd -
+else
+    echo
+    echo "Kernel git repository is not shallow."
+    echo "The repository has the full commit history and can be treated as a normal"
+    echo "git repository."
+    echo
+fi
diff --git a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb
new file mode 100644
index 0000000..f1ea414
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Contains script to unshallow git repositories"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://../unshallow-repositories.sh;beginline=3;endline=19;md5=234309914fd2cc17f3187bdb2d64553b"
+
+SRC_URI = "file://unshallow-repositories.sh"
+
+PR = "r0"
+
+do_install () {
+    install -d ${D}/
+    install -d ${D}/bin
+    install -m 0755 ${WORKDIR}/unshallow-repositories.sh ${D}/bin
+}
+
+FILES_${PN} = "/*"
-- 
1.7.9.5


