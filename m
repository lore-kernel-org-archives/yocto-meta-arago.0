Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id DD064529C8
	for <meta-arago@arago-project.org>;
	Tue,  1 Aug 2017 17:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C3B4F20B1D;
	Tue,  1 Aug 2017 17:54:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id OhRkP1rEBYKL; Tue,  1 Aug 2017 17:54:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9D11D2085A;
	Tue,  1 Aug 2017 17:54:16 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 179F4162548;
	Tue,  1 Aug 2017 13:54:16 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue,  1 Aug 2017 13:54:15 -0400
Message-Id: <1501610055-10022-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501610055-10022-1-git-send-email-denys@ti.com>
References: <1501610055-10022-1-git-send-email-denys@ti.com>
Subject: [morty/master][PATCH 2/2] arago.conf: add VIRTUAL-RUNTIME_initramfs with corresponding initramfs subpackage
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
X-List-Received-Date: Tue, 01 Aug 2017 17:54:18 -0000

Convert hardcoded arago-base-tisdk-image to use this new variable.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                        | 1 +
 meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 51296d5..f4c9f7d 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -75,6 +75,7 @@ ARAGO_SYSVINIT ?= "0"
 VIRTUAL-RUNTIME_dev_manager = "${@base_conditional("ARAGO_SYSVINIT", "1", "udev", "systemd", d)}"
 VIRTUAL-RUNTIME_init_manager = "${@base_conditional("ARAGO_SYSVINIT", "1", "sysvinit", "systemd", d)}"
 VIRTUAL-RUNTIME_initscripts = "${@base_conditional("ARAGO_SYSVINIT", "1", "initscripts", "systemd-compat-units", d)}"
+VIRTUAL-RUNTIME_initramfs = "${@base_conditional("ARAGO_SYSVINIT", "1", "sysvinit-initramfs", "systemd-initramfs", d)}"
 VIRTUAL-RUNTIME_login_manager = "busybox shadow"
 
 DISTRO_FEATURES_append = "${@base_conditional("ARAGO_SYSVINIT", "1", "", " systemd", d)}"
diff --git a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
index 6ce97ee..a3f5128 100644
--- a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
@@ -10,7 +10,7 @@ IMAGE_INSTALL += "\
     packagegroup-arago-console \
     packagegroup-arago-base-tisdk \
     packagegroup-arago-test \
-    systemd-initramfs \
+    ${VIRTUAL-RUNTIME_initramfs} \
     "
 
 export IMAGE_BASENAME = "arago-base-tisdk-image"
-- 
2.7.4


