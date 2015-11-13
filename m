Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 0DF9C52A27
	for <meta-arago@arago-project.org>;
	Fri, 13 Nov 2015 02:59:07 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NXQ004GYGAH5H10@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 12 Nov 2015 20:59:06 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=HihYlcsHAAAA:8	a=GQhdbfSxddHKiuVwHuUA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 76599161D05;	Thu,
	12 Nov 2015 21:59:05 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 12 Nov 2015 21:59:05 -0500
Message-id: <1447383545-4700-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] arago.conf: enable default Arago mirrors
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
X-List-Received-Date: Fri, 13 Nov 2015 02:59:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index b33f311..c7a2909 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -4,6 +4,11 @@ DISTRO_VERSION = "2015.09"
 DISTRO_FEED_URI ?= "http://gtautoftp.gt.design.ti.com"
 FEEDURIPREFIX ?= "lcpd/core-sdk/nightly/deploy/ipk/"
 
+MIRRORS += " \
+ftp://.*/.*       http://arago-project.org/files/sources/ \n \
+https?$://.*/.*   http://arago-project.org/files/sources/ \n \
+"
+
 # SDK paths and names
 SDK_NAME_PREFIX = "arago"
 SDK_VERSION = "${DISTRO_VERSION}"
-- 
2.2.0


