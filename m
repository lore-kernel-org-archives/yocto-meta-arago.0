Return-Path: <e-ruei1@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id 3E3A6529C2
	for <meta-arago@arago-project.org>;
	Mon, 22 Aug 2016 20:26:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u7MKQccZ005534
	for <meta-arago@arago-project.org>; Mon, 22 Aug 2016 15:26:38 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7MKQcCk013270
	for <meta-arago@arago-project.org>; Mon, 22 Aug 2016 15:26:38 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 22 Aug 2016 15:26:38 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u7MKQatm027787	for <meta-arago@arago-project.org>;
	Mon, 22 Aug 2016 15:26:37 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 22 Aug 2016 16:19:06 -0400
Message-ID: <1471897150-34179-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1471897150-34179-1-git-send-email-e-ruei1@ti.com>
References: <1471897150-34179-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] matrix-gui-touch-demos: add touch demo: touch interact
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
X-List-Received-Date: Mon, 22 Aug 2016 20:26:40 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-core/matrix/matrix-gui-touch-demos_2.0.bb     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-touch-demos_2.0.bb

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-touch-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-touch-demos_2.0.bb
new file mode 100644
index 0000000..49b85ed
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-touch-demos_2.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Touch demo descriptions for Matrix v2"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+
+require matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = "${WORKDIR}/git/touch_apps"
+
+# Make sure touch submenu and app images has been installed
+RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-touch"
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
-- 
1.9.1


