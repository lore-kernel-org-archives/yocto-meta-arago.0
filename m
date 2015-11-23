Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 43F7D52A64
	for <meta-arago@arago-project.org>;
	Mon, 23 Nov 2015 17:40:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tANHeir2010286
	for <meta-arago@arago-project.org>; Mon, 23 Nov 2015 11:40:44 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tANHei99030825
	for <meta-arago@arago-project.org>; Mon, 23 Nov 2015 11:40:44 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 23 Nov 2015 11:40:44 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tANHeitI006742;
	Mon, 23 Nov 2015 11:40:44 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1a0v6a-0005JJ-0W; Mon, 23 Nov 2015 12:40:44 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 23 Nov 2015 12:40:35 -0500
Message-ID: <1448300436-20360-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448300436-20360-1-git-send-email-j-stiffler@ti.com>
References: <1448300436-20360-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] meta-toolchain-arago-tisdk-server: tisdk devkit without QT
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
X-List-Received-Date: Mon, 23 Nov 2015 17:40:48 -0000
Content-Type: text/plain

* used for machines which do not have a display

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago-tisdk-server.bb          | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.bb

diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.bb
new file mode 100644
index 0000000..f972eaa
--- /dev/null
+++ b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.bb
@@ -0,0 +1,6 @@
+TOOLCHAIN_SUFFIX ?= "-tisdk-server"
+
+require meta-toolchain-arago-tisdk.inc
+require recipes-core/meta/meta-toolchain-arago.bb
+
+PR = "${INC_PR}.0"
-- 
1.9.1


