Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id C2ACA52ACF
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2015 03:02:42 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQW00GUL5S5MG80@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 02 Jul 2015 22:02:30 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Jp0M15MC c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8	a=HdP0dGgHUlue44aGmwEA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3DEB3161AEB;	Thu,
	2 Jul 2015 23:02:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 02 Jul 2015 23:02:01 -0400
Message-id: <1435892533-6046-43-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1435892533-6046-1-git-send-email-denis@denix.org>
References: <1435892533-6046-1-git-send-email-denis@denix.org>
Subject: [PATCH 42/54] obexd: move from extras to distro, fix build when B != S
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
X-List-Received-Date: Fri, 03 Jul 2015 03:02:45 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-connectivity/{obex => obexd}/obexd_0.34.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-extras/recipes-connectivity/{obex => obexd}/obexd_0.34.bb (93%)

diff --git a/meta-arago-extras/recipes-connectivity/obex/obexd_0.34.bb b/meta-arago-extras/recipes-connectivity/obexd/obexd_0.34.bb
similarity index 93%
rename from meta-arago-extras/recipes-connectivity/obex/obexd_0.34.bb
rename to meta-arago-extras/recipes-connectivity/obexd/obexd_0.34.bb
index 8de34e9..388a6dd 100644
--- a/meta-arago-extras/recipes-connectivity/obex/obexd_0.34.bb
+++ b/meta-arago-extras/recipes-connectivity/obexd/obexd_0.34.bb
@@ -4,7 +4,7 @@ DEPENDS = "openobex glib-2.0 dbus bluez4 libical"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "files://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz \
 "
@@ -12,7 +12,7 @@ SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz \
 SRC_URI[md5sum] = "36080a767e63e54878cd6bcfb20c4f3b"
 SRC_URI[sha256sum] = "f99fb58562a3d7edef6fd9e63ca04510e241bbdab37fdb122c2c7a112a09100a"
 
-inherit autotools
+inherit autotools-brokensep pkgconfig
 
 PACKAGES =+ "obex-client obex-plugins"
 
-- 
2.2.0


