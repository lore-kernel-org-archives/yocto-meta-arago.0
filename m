Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (unknown [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 296A452992
	for <meta-arago@arago-project.org>;
	Tue,  6 Nov 2018 21:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4FD3620B37;
	Tue,  6 Nov 2018 21:23:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id qHAa9pLavbsp; Tue,  6 Nov 2018 21:23:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3DE3B20B2F;
	Tue,  6 Nov 2018 21:23:11 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id CA80E164DC7;
	Tue,  6 Nov 2018 16:23:10 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue,  6 Nov 2018 16:23:08 -0500
Message-Id: <1541539388-7197-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541539388-7197-1-git-send-email-denys@ti.com>
References: <1541539388-7197-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 2/2] uvc-gadget: update to the latest for many fixes and new g_uvc API
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
X-List-Received-Date: Tue, 06 Nov 2018 21:23:22 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/uvc-gadget/uvc-gadget_git.bb             | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git.bb b/meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
index 1f75f15..39f8cb3 100644
--- a/meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
+++ b/meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
@@ -2,18 +2,17 @@ SUMMARY = "UVC gadget userspace sample application"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://uvc-gadget.c;beginline=1;endline=18;md5=414860c3c534dc95d81da9564cfb8d2a"
 
-DEPENDS = "virtual/kernel"
-
 SRC_URI = "git://git.ideasonboard.org/uvc-gadget.git"
-SRC_URI += "file://0001-uvc-gadget-don-t-hardcode-uvc.h-path.patch"
 
-PV = "1.0+git${SRCPV}"
-SRCREV = "3c5a666f9d2eea0e0f7e9a8a0eb8bbfd7687ca13"
+PV = "1.1+git${SRCPV}"
+SRCREV = "aa82df887ab995473cd83c89777cdf4bc4685dd0"
 
 S = "${WORKDIR}/git"
 
+EXTRA_OEMAKE = 'CC="${CC}" CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" KERNEL_INCLUDE=""'
+
 do_compile () {
-	${CC} ${CFLAGS} -I${STAGING_KERNEL_DIR}/drivers/usb/gadget/function ${LDFLAGS} -o uvc-gadget uvc-gadget.c
+	oe_runmake
 }
 
 do_install () {
-- 
2.7.4


