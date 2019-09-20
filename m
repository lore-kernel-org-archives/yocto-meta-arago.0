Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 9D84852960
	for <meta-arago@arago-project.org>;
	Fri, 20 Sep 2019 19:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 588F540BE2;
	Fri, 20 Sep 2019 19:53:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id md45WXZTDOW5; Fri, 20 Sep 2019 19:53:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D54DC40A2D;
	Fri, 20 Sep 2019 19:53:45 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 1A738174268;
	Fri, 20 Sep 2019 15:53:45 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 20 Sep 2019 15:53:44 -0400
Message-Id: <1569009224-37194-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] systemd: restore use of sysinit.target.wants by pre-creating the dir
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
X-List-Received-Date: Fri, 20 Sep 2019 19:54:56 -0000

TODO: convert to use systemd-conf instead of main systemd for machine/distro config

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/systemd/systemd_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
index eb70690..39fe64d 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
@@ -31,9 +31,9 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/30-wlan.network ${D}${sysconfdir}/systemd/network/
     install -m 0644 ${WORKDIR}/60-usb.network ${D}${sysconfdir}/systemd/network/
 
-    install -d ${D}${sysconfdir}/systemd/system/
+    install -d ${D}${sysconfdir}/systemd/system/sysinit.target.wants
     install -m 0644 ${WORKDIR}/sync-clocks.service ${D}${sysconfdir}/systemd/system/
-    ln -sf ../sync-clocks.service ${D}${sysconfdir}/systemd/system/multi-user.target.wants/sync-clocks.service
+    ln -sf ../sync-clocks.service ${D}${sysconfdir}/systemd/system/sysinit.target.wants/sync-clocks.service
 
     # Allow automount from udev
     install -m 0644 ${D}${systemd_system_unitdir}/systemd-udevd.service ${D}${sysconfdir}/systemd/system/
-- 
2.7.4


