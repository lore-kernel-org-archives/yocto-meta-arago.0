Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 92F7952A28
	for <meta-arago@arago-project.org>;
	Fri,  7 Aug 2015 21:20:34 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSQ00MBHDXUEB40@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 07 Aug 2015 16:20:19 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=0Ybsuc2TEpVb4TrkxekA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3A034161B4B;	Fri,
	7 Aug 2015 17:20:18 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 07 Aug 2015 17:20:11 -0400
Message-id: <1438982412-15565-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1438982412-15565-1-git-send-email-denis@denix.org>
References: <1438982412-15565-1-git-send-email-denis@denix.org>
Subject: [fido/master][PATCH 4/5] HACK: strongswan: disable config patch as 5.2 changed format
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
X-List-Received-Date: Fri, 07 Aug 2015 21:20:35 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend b/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
index de281eb..f065a63 100644
--- a/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
+++ b/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-arago0"
+PR_append = "-arago1"
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 DEPENDS_remove = "gmp"
@@ -11,4 +11,4 @@ EXTRA_OECONF += "--disable-gmp \
         --disable-tools \
 "
 
-SRC_URI += "file://strongswan_libsecstore.patch"
+#SRC_URI += "file://strongswan_libsecstore.patch"
-- 
2.2.0


