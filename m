Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E81FD52ADA
	for <meta-arago@arago-project.org>;
	Fri, 19 Feb 2016 19:43:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1JJh2rE010039
	for <meta-arago@arago-project.org>; Fri, 19 Feb 2016 13:43:02 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1JJh1pO022377
	for <meta-arago@arago-project.org>; Fri, 19 Feb 2016 13:43:02 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 19 Feb 2016 13:43:01 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1JJh1jG028779;
	Fri, 19 Feb 2016 13:43:01 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aWqxB-0006eV-0P; Fri, 19 Feb 2016 14:43:01 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 19 Feb 2016 14:42:53 -0500
Message-ID: <1455910978-25530-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455910978-25530-1-git-send-email-j-stiffler@ti.com>
References: <1455910978-25530-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] openmpacc: Add OpenMP-Acc library
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
X-List-Received-Date: Fri, 19 Feb 2016 19:43:04 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-ti/openmpacc/openmpacc_git.bb             | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb

diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb b/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
new file mode 100644
index 0000000..89f6b79
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "TI OpenMP-Acc host runtime and development packages"
+
+include openmpacc.inc
+
+PR = "${INC_PR}.0"
+
+inherit cmake
+
+DEPENDS = "boost boost-native opencl"
+RDEPENDS_${PN} += "opencl-runtime"
+
+S = "${WORKDIR}/git/host"
+
+export TARGET_ROOTDIR = "${STAGING_DIR_HOST}"
+export LINUX_DEVKIT_ROOT = "${STAGING_DIR_HOST}"
+
+EXTRA_OECMAKE += "-DVERSION="${PV}" -DBUILD_OUTPUT=lib"
+
+FILES_${PN} += "/usr/share/ti/openmpacc/*"
-- 
1.9.1


