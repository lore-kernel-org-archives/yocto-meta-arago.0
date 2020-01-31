Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 5462852975
	for <meta-arago@arago-project.org>;
	Fri, 31 Jan 2020 23:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2CD7E40BDA;
	Fri, 31 Jan 2020 23:21:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id hx0QFrpSioC3; Fri, 31 Jan 2020 23:21:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 15C04409E1;
	Fri, 31 Jan 2020 23:21:45 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id CD4281743CE;
	Fri, 31 Jan 2020 18:21:44 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 31 Jan 2020 18:21:44 -0500
Message-Id: <1580512904-38929-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] arago.conf: simplify DISTRO_FEATURES logic to not rely on oe/lib
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
X-List-Received-Date: Fri, 31 Jan 2020 23:23:38 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 99ba36f..026dae2 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -82,13 +82,13 @@ DISTRO_FEATURES_append = " pam wayland opengl"
 
 # Set global runtime providers for major components
 ARAGO_SYSVINIT ?= "0"
-VIRTUAL-RUNTIME_dev_manager = "${@oe.utils.conditional("ARAGO_SYSVINIT", "1", "udev", "systemd", d)}"
-VIRTUAL-RUNTIME_init_manager = "${@oe.utils.conditional("ARAGO_SYSVINIT", "1", "sysvinit", "systemd", d)}"
-VIRTUAL-RUNTIME_initscripts = "${@oe.utils.conditional("ARAGO_SYSVINIT", "1", "initscripts", "systemd-compat-units", d)}"
-VIRTUAL-RUNTIME_initramfs = "${@oe.utils.conditional("ARAGO_SYSVINIT", "1", "sysvinit-initramfs", "systemd-initramfs", d)}"
+VIRTUAL-RUNTIME_dev_manager = "${@["udev", "systemd"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
+VIRTUAL-RUNTIME_init_manager = "${@["sysvinit", "systemd"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
+VIRTUAL-RUNTIME_initscripts = "${@["initscripts", "systemd-compat-units"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
+VIRTUAL-RUNTIME_initramfs = "${@["sysvinit-initramfs", "systemd-initramfs"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
 VIRTUAL-RUNTIME_login_manager = "busybox shadow"
 
-DISTRO_FEATURES_append = "${@oe.utils.conditional("ARAGO_SYSVINIT", "1", "", " systemd", d)}"
+DISTRO_FEATURES_append = "${@[""," systemd"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
 
 # Set preferred Qt version
 QT_PROVIDER ?= "qt5"
-- 
2.7.4


