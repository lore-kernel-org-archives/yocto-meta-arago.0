Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8EF69529D5
	for <meta-arago@arago-project.org>;
	Wed,  3 Sep 2014 12:41:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s83Cfw2l004311
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 07:41:58 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83CfvUg020001
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 07:41:57 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 3 Sep 2014 07:41:57 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83CfZhh031656;
	Wed, 3 Sep 2014 07:41:56 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Sep 2014 18:11:22 +0530
Message-ID: <1409748091-12617-4-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1409748091-12617-1-git-send-email-a0393906@ti.com>
References: <1409748091-12617-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [for dora] [PATCH v2 03/12] wpa-supplicant: specify the branch being used for this version
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
X-List-Received-Date: Wed, 03 Sep 2014 12:41:58 -0000
Content-Type: text/plain

From: Denys Dmytriyenko <denys@ti.com>

Bitbake fetcher now requires the branch to be specified when SRCREV is not on master

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
Tested-by: Karthik Ramanan <a0393906@ti.com>
---
 .../wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.10.bb                    | 1 +
 .../recipes-connectivity/wpa-supplicant/wpa-supplicant.inc              | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.10.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.10.bb
index 6340967..bfe617e 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.10.bb
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.10.bb
@@ -12,6 +12,7 @@ FILESEXTRAPATHS_append := "${THISDIR}/wpa-supplicant:"
 
 # Tag: ol_r8.a8.10
 SRCREV = "257ab333aad993b4be81808524bc0d939c276058"
+BRANCH = "mbss_suspend"
 PR_append = "b+gitr${SRCPV}"
 
 # Add ti to the PV to indicate that this is a TI modify version of wpa-supplicant.
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index 9678b1b..e0bda11 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -16,7 +16,7 @@ DEFAULT_PREFERENCE = "-1"
 
 PR = "r6"
 
-SRC_URI = "git://github.com/TI-OpenLink/hostap.git;protocol=git \
+SRC_URI = "git://github.com/TI-OpenLink/hostap.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
            file://defaults-sane \
            file://wpa-supplicant.sh \
-- 
2.0.1


