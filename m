Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 419B952A63
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 18:06:53 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7H005G7BNGMEC0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 20 Jun 2014 13:06:52 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BEDDA259AD; Fri,
	20 Jun 2014 13:57:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 20 Jun 2014 13:56:43 -0400
Message-id: <1403287009-11256-14-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1403287009-11256-1-git-send-email-denis@denix.org>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
Subject: [PATCH 13/19] wpa-supplicant: specify the branch being used for this version
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
X-List-Received-Date: Fri, 20 Jun 2014 18:06:53 -0000

From: Denys Dmytriyenko <denys@ti.com>

Bitbake fetcher now requires the branch to be specified when SRCREV is not on master

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
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
2.0.0


