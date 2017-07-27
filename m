Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 7647E52AB7
	for <meta-arago@arago-project.org>;
	Thu, 27 Jul 2017 22:28:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6RMSK4J019185
	for <meta-arago@arago-project.org>; Thu, 27 Jul 2017 17:28:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501194500;
	bh=lXRpkJNdr/bXFOqM79XJU6Dfy3LjN+5B/5PQWLBxCDo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=s2PnULkSSeELml9TshPmwPBkP26DBA0PuRFXF8sjBufXIbBLDLSTV2no0zuzaySdx
	awadDZpHuZmRtsCbizjrVYyL+t1hg3E+EnGCTCuALK45Y2QUxyLEa+t7QlOmtzgp6h
	Mgkxuha38H3K4sr1n6rMBbfcu1QuvvCsT3WwKNXo=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RMSKsk004334
	for <meta-arago@arago-project.org>; Thu, 27 Jul 2017 17:28:20 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Jul 2017 17:28:19 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6RMSJXP022464	for <meta-arago@arago-project.org>;
	Thu, 27 Jul 2017 17:28:20 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 27 Jul 2017 18:28:13 -0400
Message-ID: <1501194495-48938-3-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1501194495-48938-1-git-send-email-e-ruei1@ti.com>
References: <1501194495-48938-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [morty/master][PATCH 2/4] matix-gui-browser-demos: add browser demos
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
X-List-Received-Date: Thu, 27 Jul 2017 22:28:21 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-core/matrix/matrix-gui-browser-demos_2.0.bb  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb
new file mode 100644
index 0000000..63811c7
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Various Demo Browsers for Matrix v2"
+HOMEPAGE = "https://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps"
+
+require matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = "${WORKDIR}/git/browser_apps"
+
+# Make sure browser submenu and app images has been installed
+RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-browser"
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
+FILES_${PN} += "${bindir}/runGoogleChrome.sh"
-- 
1.9.1


