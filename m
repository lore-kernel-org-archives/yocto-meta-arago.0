Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTPS id 8A58B52AA2
	for <meta-arago@arago-project.org>;
	Wed, 13 Apr 2016 16:30:22 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.148])
	by vms173011.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5K00HJUZ66JS30@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 13 Apr 2016 11:30:07 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=Kvt-r--gsZ_bW0Bo37UA:9
Received: by 100.15.86.14 with SMTP id 5120ce0c; Wed, 13 Apr 2016 16:30:07 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 63E61161F9B;	Wed,
	13 Apr 2016 12:30:06 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 13 Apr 2016 12:30:05 -0400
Message-id: <1460565005-5892-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] openmpacc: remove -march=armv7-a gcc flag, OE passes correct one
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
X-List-Received-Date: Wed, 13 Apr 2016 16:30:23 -0000

From: Denys Dmytriyenko <denys@ti.com>

We already pass the necessary -march, -mcu, -mfpu and -mfloat-abi flags based
on the machine tunes. Moreover, cortex-a15 is not armv7-a, but armv7ve, so gcc
will give a warning, but since also -Werror is passed, it breaks the build.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb b/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
index 89f6b79..8fec0d1 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
+++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
@@ -17,3 +17,7 @@ export LINUX_DEVKIT_ROOT = "${STAGING_DIR_HOST}"
 EXTRA_OECMAKE += "-DVERSION="${PV}" -DBUILD_OUTPUT=lib"
 
 FILES_${PN} += "/usr/share/ti/openmpacc/*"
+
+do_configure_prepend() {
+	sed -i -e 's/-march=armv7-a//' ${S}/libompacc/CMakeLists.txt
+}
-- 
2.2.0


