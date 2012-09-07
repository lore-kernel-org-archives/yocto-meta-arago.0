Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id EEBE752A61
	for <meta-arago@arago-project.org>;
	Fri,  7 Sep 2012 18:32:53 +0000 (UTC)
Received: by obbeh20 with SMTP id eh20so4891799obb.38
	for <meta-arago@arago-project.org>;
	Fri, 07 Sep 2012 11:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=sUBhYc3VHdE11uKlFAVOvtM8r/s017dSu1PqbB4dHRQ=;
	b=cnfQGVcg++Z75bNgWurdcJ4gZ8NMI75Jv7UoriisL3kjwE597USSiSHONg35CgMktm
	9Qa4jP173yvtHlmq0ENOpF4042x/bQdbgToOWTkKssjk0RipVtSr6b/5PlSOBflwv4Mz
	XSqF32FIB581HQQH1fjLDH09i4RxjAHOzM0jhLwtzykVlDiO26wNo8kqfPj1jW5Afahr
	YpTeUTVv/fEwMrNwcLXT3gI5lRnUAqk5T5Cvj7LklUEFE8gYtSfp4IxXzUUWaAcnA0Gv
	hioBQFeVH9/xBIz2A+pUhw3Wfn0Ewps8j4dPFMCnFF4P6ukgSHLB4Bo+xZQBX+7DO9Ix
	2EPw==
Received: by 10.60.26.134 with SMTP id l6mr7153095oeg.40.1347042772759;
	Fri, 07 Sep 2012 11:32:52 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id a20sm4289247oei.2.2012.09.07.11.32.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Sep 2012 11:32:52 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  7 Sep 2012 13:50:56 -0500
Message-Id: <1347043857-20831-1-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [meta-arago-distro][PATCH 1/2] flash-utility: Add flash utility tool
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
X-List-Received-Date: Fri, 07 Sep 2012 18:32:55 -0000

* Add Windows base flash utility
* Port flash utility recipe from arago
* The current recipe pulls in a zip file that doesn't contain license
  information. License information will be added in an updated recipe.

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 .../flash-utility/flash-utility_1.6.0.0.bb         |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-arago/flash-utility/flash-utility_1.6.0.0.bb

diff --git a/meta-arago-distro/recipes-arago/flash-utility/flash-utility_1.6.0.0.bb b/meta-arago-distro/recipes-arago/flash-utility/flash-utility_1.6.0.0.bb
new file mode 100644
index 0000000..94d78f6
--- /dev/null
+++ b/meta-arago-distro/recipes-arago/flash-utility/flash-utility_1.6.0.0.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Texas Instruments Flash Utility"
+LICENSE = "BSD"
+
+PR = "r0"
+
+COMPATIBLE_MACHINE = "am37x-evm|am3517-evm"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/580/4785/Flash_v1.6.0.0.zip;name=base;subdir=${P}"
+S = "${WORKDIR}/${P}"
+
+installdir = "host-tools/flash_utils/windows"
+
+do_install() {
+    install -d ${D}/${installdir}
+    install ${S}/setup.exe ${D}/${installdir}
+    install ${S}/FlashInstaller.msi ${D}/${installdir}
+    install ${S}/Release_Notes.txt ${D}/${installdir}
+}
+
+FILES_${PN} += "${installdir}/*" 
+
+SRC_URI[base.md5sum] = "1f53efa31996afb5af78930739090ae6"
+SRC_URI[base.sha256sum] = "f6722422016ec4e49b8c55c38affea4c924b6636a47d0d67e6537e7dab108a1b"
-- 
1.7.0.4


