Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 14FF852094
	for <meta-arago@arago-project.org>;
	Fri, 11 Sep 2015 18:32:49 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NUI006NCZI2UL60@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 11 Sep 2015 13:32:26 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=ff-B7xzCdYMA:10 a=sozttTNsAAAA:8
	a=Q4-j1AaZAAAA:8	a=w7axTSrIzA3ncDEfJRgA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2DEB5161BEA;	Fri,
	11 Sep 2015 14:32:26 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 11 Sep 2015 14:32:25 -0400
Message-id: <1441996345-21751-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] arago.conf: bump version, update feed url, drop old workaround
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
X-List-Received-Date: Fri, 11 Sep 2015 18:32:54 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 6057846..c26cbc9 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -1,8 +1,8 @@
 # Name and version of the distribution
 DISTRO_NAME = "Arago"
-DISTRO_VERSION = "2015.08"
-DISTRO_FEED_URI ?= "http://lcpd.dal.design.ti.com"
-FEEDURIPREFIX ?= "core-sdk/nightly/deploy/ipk/"
+DISTRO_VERSION = "2015.09"
+DISTRO_FEED_URI ?= "http://gtautoftp.gt.design.ti.com"
+FEEDURIPREFIX ?= "lcpd/core-sdk/nightly/deploy/ipk/"
 
 # SDK paths and names
 SDK_NAME_PREFIX = "arago"
@@ -15,10 +15,6 @@ SDKPATH = "${@"/tmp/"+"x"*96+"/"+"y"*96}"
 IMAGE_CLASSES += "image_types_md5"
 IMAGE_FSTYPES += "tar.gz.md5"
 
-# Daisy has a syntax error in lib/oe/sdk.py, use workaround for now
-# http://cgit.openembedded.org/openembedded-core/commit/?id=81b3cc448f040dcb4c2f2b05983231ac53270663
-IPKGCONF_Target = "${IPKGCONF_TARGET}"
-
 # Mask any broken recipes (currently none)
 #BBMASK = ""
 
-- 
2.2.0


