Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 9382952991
	for <meta-arago@arago-project.org>;
	Mon, 10 Aug 2015 19:01:26 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSV000MMRHEOVB0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 10 Aug 2015 14:01:06 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=nv1sZLqTjuu3UIHtmpUA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8703F161B6C;	Mon,
	10 Aug 2015 15:00:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 10 Aug 2015 15:00:50 -0400
Message-id: <1439233250-5088-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [master/fido][PATCH] wpa-supplicant-wl18xx: fix license checksums, bump version
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
X-List-Received-Date: Mon, 10 Aug 2015 19:01:26 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wpa-supplicant/wpa-supplicant-wl18xx.bb                    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
index 412c214..dea4384 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
@@ -4,19 +4,19 @@
 require wpa-supplicant.inc
 
 LICENSE = "GPLv2 | BSD"
-LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
-                    file://../README;md5=ba46b65db36e3c82244a3815b3738d63 \
-                    file://wpa_supplicant.c;beginline=1;endline=17;md5=8835156c8ab8cad6356ec7f39ebe3aba"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=36b27801447e0662ee0138d17fe93880 \
+                    file://../README;md5=7f393579f8b109fe91f3b9765d26c7d3 \
+                    file://wpa_supplicant.c;beginline=1;endline=17;md5=8a3131126465e08eb6b8d17ea880e162"
 
 FILESEXTRAPATHS_append := "${THISDIR}/wpa-supplicant:"
 
 # Tag: R8.6
 SRCREV = "f80fe345acf103ba6882ac8396f19584ac184904"
 BRANCH = "upstream_24"
-PR_append = "d"
+PR_append = "a"
 
 # Add ti to the PV to indicate that this is a TI modify version of wpa-supplicant.
-PV = "R8.5-devel-ti+git${SRCPV}"
+PV = "R8.6-devel-ti+git${SRCPV}"
 
 PROVIDES += "wpa-supplicant"
 RPROVIDES_${PN}  += "wpa-supplicant"
-- 
2.2.0


