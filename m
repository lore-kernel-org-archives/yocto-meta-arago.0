Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 53503529C6
	for <meta-arago@arago-project.org>;
	Sat, 22 Sep 2012 00:44:05 +0000 (UTC)
Received: by obbeh20 with SMTP id eh20so3684488obb.38
	for <meta-arago@arago-project.org>;
	Fri, 21 Sep 2012 17:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=I5Xwjv0yVNr7UaNRevODJpupUYW5vyx+82xh15rQerA=;
	b=MDAAbQo46ECG2upVwFRlVGgYju9s54HwsVBRnk4crvllhyOdy+qzGjOlh7WaVjlImm
	fhvzmGnkuOB5wOp05rqICM5pWkZVE+3NPa1qN+vZnb4Le+7ZvKwB++Ha6QsHn0IufUbz
	2Jgf9IE8KhTlroZPMPDLc4BTv138zH4gLGM4AZs5Q8aizlukMuaWxPpIjywr152eNPKm
	W4TEEC9zIwzGjY5aY4nqeduUcwUVx+C5ObGdrgSiu2xbv5E6Q3EzALCtcZqVOw41bGUd
	x51w+oCd0ZlVnuEAY6JSEkioiPZX/3orVi5uTJ6hL+wYOIYeZF2xfG8qtXdqyIDiM9NT
	vGKg==
Received: by 10.60.2.163 with SMTP id 3mr5283630oev.105.1348274644609;
	Fri, 21 Sep 2012 17:44:04 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id k8sm7388516oeh.9.2012.09.21.17.44.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Sep 2012 17:44:04 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 21 Sep 2012 20:07:28 -0500
Message-Id: <1348276048-27910-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2] board-port-labs: Port board-port-labs from arago
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
X-List-Received-Date: Sat, 22 Sep 2012 00:44:06 -0000

* Port board-port-labs from arago.
* This recipe will clone the Sitara board port lab git trees
  and package them as a sourceipk to be installed in the SDK.
* It keeps the git information intact as the tags and branches
  in the trees are used in the lab documentation.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 address the following issues:
Removed copy of license information from README file.
Updated README file to point the user to the license information in the kernel
and u-boot git repository.
Renamed README file to LICENSE.

 .../board-port-labs/board-port-labs/LICENSE        |   16 ++++++++++
 .../board-port-labs/board-port-labs_git.bb         |   31 ++++++++++++++++++++
 2 files changed, 47 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs/LICENSE
 create mode 100644 meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb

diff --git a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs/LICENSE b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs/LICENSE
new file mode 100644
index 0000000..738cb23
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs/LICENSE
@@ -0,0 +1,16 @@
+The trees found within this directory are git trees for the Linux
+kernel and u-boot.  These trees are based on the AM335x part and
+are meant to serve as a reference for general tasks involved in a board
+port.  These trees go along with the training available at:
+
+http://processors.wiki.ti.com/index.php/Sitara_Linux_Training
+
+Inside of each directory is a full git repository.  These repositories
+have tags that make isolating the changes for each functionality easier.
+You can view the tag using the "git tag" command and use "gitk --all"
+to better view the git tree contents.
+
+The individual trees are licensed under the same license as the Linux
+kernel and u-boot sources which is the GPLv2 license. A copy of license
+for the kernel and u-boot can be found in a file called COPYING within
+each of the respective git repositories.
diff --git a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb
new file mode 100644
index 0000000..97ca84d
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Git repositories containing sample board port code"
+HOMEPAGE = "https://gitorious.org/sitara-board-port"
+LICENSE = "GPLv2"
+DEPENDS += "git-native"
+
+SRC_URI = "file://LICENSE"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d9fb2a547cd8e6bb75c0ecf427a139a9"
+
+PACKAGE_ARCH = "all"
+CREATE_SRCIPK = "1"
+SRCIPK_INSTALL_DIR = "board-support/board-port-labs"
+
+PR = "r0"
+
+REPOS ?= "git://gitorious.org/sitara-board-port/sitara-board-port-linux.git \
+          git://gitorious.org/sitara-board-port/sitara-board-port-uboot.git \
+         "
+
+S = "${WORKDIR}"
+
+# Checkout the REPOS before the do_patch task so that it will be done prior
+# to the srcipk being made.
+do_repos_checkout() {
+    cd ${S}
+    for r in ${REPOS}
+    do
+        git clone $r
+    done
+}
+
+addtask repos_checkout after do_fetch before do_patch
-- 
1.7.0.4


