Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 962F052A26
	for <meta-arago@arago-project.org>;
	Tue,  2 Sep 2014 10:55:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s82At7D8017409
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 05:55:07 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s82At7V1032061
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 05:55:07 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 05:55:06 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s82AsrZE026077;
	Tue, 2 Sep 2014 05:55:05 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Sep 2014 16:24:33 +0530
Message-ID: <1409655283-4899-3-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1409655283-4899-1-git-send-email-a0393906@ti.com>
References: <1409655283-4899-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [PATCH 02/12] hostap-daemon: specify the branch being used for this version
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
X-List-Received-Date: Tue, 02 Sep 2014 10:55:07 -0000
Content-Type: text/plain

From: Denys Dmytriyenko <denys@ti.com>

Bitbake fetcher now requires the branch to be specified when SRCREV is not on master

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
Tested-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a8.10.bb        | 1 +
 meta-arago-extras/recipes-connectivity/hostap/hostap.inc                | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a8.10.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a8.10.bb
index acd3c29..cd5d8d3 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a8.10.bb
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a8.10.bb
@@ -16,6 +16,7 @@ PV = "2.0-devel-ti"
 
 # Tag: ol_r8.a8.10
 SRCREV = "257ab333aad993b4be81808524bc0d939c276058"
+BRANCH = "mbss_suspend"
 
 PROVIDES += "hostap-daemon"
 RPROVIDES_${PN} += "hostap-daemon"
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
index 9be2585..15e82d5 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
@@ -18,7 +18,7 @@ INITSCRIPT_NAME="hostapd"
 
 CONFFILES_${PN} += "${sysconfdir}/hostapd.conf"
 
-SRC_URI = "git://github.com/TI-OpenLink/hostap.git;protocol=git \
+SRC_URI = "git://github.com/TI-OpenLink/hostap.git;protocol=git;branch=${BRANCH} \
            file://0001-hostapd-change-conf-file-for-better-oob-startup.patch;patchdir=.. \
            file://defconfig \
 	       file://init"
-- 
2.0.1


