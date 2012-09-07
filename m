Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 677F3529AB
	for <meta-arago@arago-project.org>;
	Fri,  7 Sep 2012 18:51:58 +0000 (UTC)
Received: by obbeh20 with SMTP id eh20so4920075obb.38
	for <meta-arago@arago-project.org>;
	Fri, 07 Sep 2012 11:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ZVxlSv5vm0iZfmeMSXvY/NhQLaNLp6K8ZwhdhCQmrJs=;
	b=aH6GZ8tanEZpzDQWy1e28SepxKxFIgyBhK+Xx/omZGSog52NToACKzm5a6lx0g/4ta
	rvTu4URFJnCL6bVS7JqO1mkgUkPy1JMXkl5j+37UYHFdbYUrE0mOyEtkQcyja5Dkwa2b
	eJ60nn8rXnkIjgbJoJwaWrEiLbsG5FNkeMygcAWdNPePZQ25V1EIAtSlMH+b4b+y3ScQ
	M4mqoDQPPA857biSkovtSL2ZmQqrhkp3WRJQRG2xOfGceI8whzkb/2TZUZMiI2TvpuxN
	H7NQeW7fZxNaTwdCX9YrLf3TP6A/l9ZxwLff6urU+JBv5shvwl+fxLZXe33ht03bMEFR
	bZRw==
Received: by 10.60.2.105 with SMTP id 9mr7075128oet.65.1347043914919;
	Fri, 07 Sep 2012 11:51:54 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id 5sm2978527oeq.4.2012.09.07.11.51.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Sep 2012 11:51:54 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  7 Sep 2012 14:09:58 -0500
Message-Id: <1347044999-25201-1-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [meta-arago-distro][PATCH 1/2 v2] pinmux-utility: Add pinmux utility
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
X-List-Received-Date: Fri, 07 Sep 2012 18:52:02 -0000

* Add Windows base pinmux utility
* Port pinmux-utility recipe from arago.
* The current recipe pulls in a zip file that doesn't contain
  license information. License information will be added in an
  updated recipe.

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 .../pinmux-utility/pinmux-utility.inc              |   19 +++++++++++++++
 .../pinmux-utility/pinmux-utility_2.3.1.0.bb       |   25 ++++++++++++++++++++
 2 files changed, 44 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility.inc
 create mode 100644 meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility_2.3.1.0.bb

diff --git a/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility.inc b/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility.inc
new file mode 100644
index 0000000..46d409d
--- /dev/null
+++ b/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility.inc
@@ -0,0 +1,19 @@
+DESCRIPTION = "Texas Instruments Pinmux Utility"
+LICENSE = "BSD"
+
+PR = "r0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+S = "${WORKDIR}/${P}"
+
+installdir = "host-tools/pinmux_utils/windows"
+
+do_install() {
+    install -d ${D}/${installdir}
+    install ${S}/Pin_Mux_Utility.msi ${D}/${installdir}
+    install ${S}/setup.exe ${D}/${installdir}
+    install ${S}/Release_Notes.txt ${D}/${installdir}
+}
+
+FILES_${PN} += "${installdir}/*"
diff --git a/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility_2.3.1.0.bb b/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility_2.3.1.0.bb
new file mode 100644
index 0000000..e966f3a
--- /dev/null
+++ b/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility_2.3.1.0.bb
@@ -0,0 +1,25 @@
+require pinmux-utility.inc
+
+PR_append = "-arago0"
+
+SRC_URI = "\
+    https://gforge.ti.com/gf/download/frsrelease/815/5471/PinMuxUtility_v2_03_01_00.zip;name=base;subdir=${P} \
+"
+SRC_URI[base.md5sum] = "31f28b06f72c042e5400fc53b4a29c0e"
+SRC_URI[base.sha256sum] = "2b0de3592c5f4b803a207d092dba227d10e1af65e0d4f06e1d8d23f317a452f9"
+
+# Currently for omapl138 devices we are using a different pinmux utility
+# program.  This requires a separate SRC_URI as well as a different
+# do_install.
+SRC_URI_omapl138 = "\
+    https://gforge.ti.com/gf/download/frsrelease/461/4210/Pin_Setup_AM18xx_01_00_1076_03.zip;name=omapl138;subdir=${P} \
+"
+
+do_install_omapl138() {
+    install -d ${D}/${installdir}
+    cp -rf ${S}/bin ${D}/${installdir}/
+    cp -rf ${S}/configurations ${D}/${installdir}/
+}
+
+SRC_URI[omapl138.md5sum] = "5a4eb834bde44c662aaf669882adbfe6"
+SRC_URI[omapl138.sha256sum] = "6701ca0e91761b9eb80b0097fbb2e2ce2cd8e0bcdc0bd18c34cd0221d9d450d0"
-- 
1.7.0.4


