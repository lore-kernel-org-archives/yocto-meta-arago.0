Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 017B45299E
	for <meta-arago@arago-project.org>;
	Thu, 26 Jan 2017 21:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0A7C620AB6;
	Thu, 26 Jan 2017 21:11:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id G8jKv1zffJkk; Thu, 26 Jan 2017 21:11:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DE672208B1;
	Thu, 26 Jan 2017 21:10:59 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 0E04516231F;
	Thu, 26 Jan 2017 16:10:59 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 26 Jan 2017 16:10:58 -0500
Message-Id: <1485465058-12998-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] arago.conf: allow switching between systemd and sysvinit with a variable
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
X-List-Received-Date: Thu, 26 Jan 2017 21:11:01 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index a8e9a4b..b434509 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -60,14 +60,17 @@ DISTRO_FEATURES = "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
 DISTRO_FEATURES_remove = "x11"
 
 # Add additional distro features
-DISTRO_FEATURES_append = " pam wayland opengl systemd"
+DISTRO_FEATURES_append = " pam wayland opengl"
 
 # Set global runtime providers for major components
-VIRTUAL-RUNTIME_dev_manager = "systemd"
-VIRTUAL-RUNTIME_init_manager = "systemd"
-VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
+ARAGO_SYSVINIT ?= "0"
+VIRTUAL-RUNTIME_dev_manager = "${@base_conditional("ARAGO_SYSVINIT", "1", "udev", "systemd", d)}"
+VIRTUAL-RUNTIME_init_manager = "${@base_conditional("ARAGO_SYSVINIT", "1", "sysvinit", "systemd", d)}"
+VIRTUAL-RUNTIME_initscripts = "${@base_conditional("ARAGO_SYSVINIT", "1", "initscripts", "systemd-compat-units", d)}"
 VIRTUAL-RUNTIME_login_manager = "busybox shadow"
 
+DISTRO_FEATURES_append = "${@base_conditional("ARAGO_SYSVINIT", "1", "", " systemd", d)}"
+
 # Set preferred Qt version
 QT_PROVIDER ?= "qt5"
 
-- 
2.7.4


