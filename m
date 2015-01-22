Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id BB54C52978
	for <meta-arago@arago-project.org>;
	Thu, 22 Jan 2015 16:42:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0MGgpjt004013
	for <meta-arago@arago-project.org>; Thu, 22 Jan 2015 10:42:51 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0MGgoWL024758
	for <meta-arago@arago-project.org>; Thu, 22 Jan 2015 10:42:50 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 22 Jan 2015 10:42:49 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0MGgmQo004230;	Thu, 22 Jan 2015 10:42:49 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t0MGgiaE021460;	Thu, 22 Jan 2015 22:12:47 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Jan 2015 10:42:39 -0600
Message-ID: <1421944962-32315-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1421944962-32315-1-git-send-email-fcooper@ti.com>
References: <1421944962-32315-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/5] matrix-gui-helper-scripts: Add script that will be useful to other matrix apps
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
X-List-Received-Date: Thu, 22 Jan 2015 16:42:58 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* For now this recipe simply adds the optimize-benchmark script

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../matrix/matrix-gui-helper-scripts.bb            |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-helper-scripts.bb

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-helper-scripts.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-helper-scripts.bb
new file mode 100644
index 0000000..9f96be1
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-helper-scripts.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Demo helper scripts for Matrix v2"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+
+require matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = "${WORKDIR}/git/scripts"
+
+do_install_append(){
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/optimize-benchmark.sh ${D}${bindir}/ 
+}
+
+FILES_${PN} += "{bindir}/*"
-- 
1.7.9.5


