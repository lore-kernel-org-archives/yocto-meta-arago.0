Return-Path: <a0875592@swubn01>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id DC8C452AB3
	for <meta-arago@arago-project.org>;
	Wed, 26 Jun 2013 11:03:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5QB3PZV031792
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 06:03:25 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5QB3PqG028478
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 06:03:25 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 26 Jun 2013 06:03:25 -0500
Received: from swubn01 (swubn01.india.ti.com [172.24.162.214])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5QB3OKq008293;
	Wed, 26 Jun 2013 06:03:25 -0500
Received: from a0875592 by swubn01 with local (Exim 4.71)	(envelope-from
	<a0875592@swubn01>)	id 1UrnVU-00031u-Gz; Wed, 26 Jun 2013 16:33:24 +0530
From: Siddharth Heroor <heroor@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 26 Jun 2013 16:33:17 +0530
Message-ID: <1372244597-11600-3-git-send-email-heroor@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1372244597-11600-1-git-send-email-heroor@ti.com>
References: <1372244597-11600-1-git-send-email-heroor@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] glsdk: add the initial GLSDK branding policy
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
X-List-Received-Date: Wed, 26 Jun 2013 11:03:27 -0000
Content-Type: text/plain

* Choose ti-linux-glsdk as the preferred provider

Signed-off-by: Siddharth Heroor <heroor@ti.com>
cc: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 .../conf/distro/include/branding-glsdk.inc         |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-glsdk.inc

diff --git a/meta-arago-distro/conf/distro/include/branding-glsdk.inc b/meta-arago-distro/conf/distro/include/branding-glsdk.inc
new file mode 100644
index 0000000..d1c30f3
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/branding-glsdk.inc
@@ -0,0 +1,4 @@
+# GLSDK branding configuration
+
+# Use the SDK supported kernel and kernel version
+PREFERRED_PROVIDER_virtual/kernel = "linux-ti-glsdk"
-- 
1.7.0.4


