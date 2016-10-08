Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 9BD5952A93
	for <meta-arago@arago-project.org>;
	Sat,  8 Oct 2016 04:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7CAE120A34;
	Sat,  8 Oct 2016 04:36:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 3B7_cHV0rISa; Sat,  8 Oct 2016 04:36:56 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 62DD0202B9;
	Sat,  8 Oct 2016 04:36:55 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id E1ED2162066;
	Sat,  8 Oct 2016 00:36:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat,  8 Oct 2016 00:36:53 -0400
Message-Id: <1475901414-2167-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/2] bluez: use overrides instead of immediate assignment
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
X-List-Received-Date: Sat, 08 Oct 2016 04:37:01 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend b/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
index 8cb5cfb..21d696c 100644
--- a/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
+++ b/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".arago1"
+PR_append = ".arago2"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -8,9 +8,10 @@ SRC_URI += "file://bluez4-fix-synchronization-between-bluetoothd-and-dr.patch \
 "
 # udev 150-170 provide its on hid2hci tool and udev rules for it. Therefore,
 # disabling hid2hci from bluez4.
-EXTRA_OECONF := "${@oe_filter_out('--enable-hid2hci', '${EXTRA_OECONF}', d)}"
 
-EXTRA_OECONF := "${@'${EXTRA_OECONF}'.replace('--disable-hidd', '--enable-hidd')}"
+EXTRA_OECONF_remove = "--enable-hid2hci"
+EXTRA_OECONF_remove = "--disable-hidd"
+EXTRA_OECONF_append = " --enable-hid"
 
 DEPENDS += "libsndfile1"
 
-- 
2.7.4


