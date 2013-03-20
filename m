Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6621652A7E
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 02:06:07 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2K2655d010334
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 21:06:06 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K265Jn023056
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 07:36:05 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 20 Mar 2013 07:36:04 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K25epT026167;
	Wed, 20 Mar 2013 07:36:03 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Mar 2013 21:05:37 -0500
Message-ID: <1363745138-10288-16-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363745138-10288-1-git-send-email-fcooper@ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 16/17] wpa-supplicant_r5.00.18: Create bbappend
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
X-List-Received-Date: Wed, 20 Mar 2013 02:06:07 -0000
Content-Type: text/plain

* Create a bbappend to insure that any version changes to the wpa-supplicant
  recipe will result in a new TSU exemption will be filed.
---
 .../wpa-supplicant_r5.00.18.bbappend               |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100755 meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.00.18.bbappend

diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.00.18.bbappend b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.00.18.bbappend
new file mode 100755
index 0000000..6fe2023
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.00.18.bbappend
@@ -0,0 +1,11 @@
+################################################################################
+######################### TSU EXEMPTION REQUIRED ###############################
+################################################################################
+# Versions of wpa_supplicant that are TSU Exempted:
+# wpa_supplicant-0.7.3
+
+# This package requires TSU exemption. Any update to the version of
+# wpa_supplicant must be double checked to see if a new TSU exemption must be made.
+################################################################################
+
+PR_append = "-arago0"
-- 
1.7.0.4


