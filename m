Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 9F6E1529BA
	for <meta-arago@arago-project.org>;
	Mon, 10 Jul 2017 21:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4B0D220BCC;
	Mon, 10 Jul 2017 21:30:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 9PlQ5jwxgy5v; Mon, 10 Jul 2017 21:30:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 29647207AF;
	Mon, 10 Jul 2017 21:30:54 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 8BD47162522;
	Mon, 10 Jul 2017 17:30:53 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 10 Jul 2017 17:30:53 -0400
Message-Id: <1499722253-89823-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] chromium-wayland: disable use of gold linker
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
X-List-Received-Date: Mon, 10 Jul 2017 21:30:55 -0000

It seems to break with our default external Linaro toolchain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-browser/chromium/chromium-wayland_%.bbappend | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-browser/chromium/chromium-wayland_%.bbappend b/meta-arago-distro/recipes-browser/chromium/chromium-wayland_%.bbappend
index 97e2509..3130a64 100644
--- a/meta-arago-distro/recipes-browser/chromium/chromium-wayland_%.bbappend
+++ b/meta-arago-distro/recipes-browser/chromium/chromium-wayland_%.bbappend
@@ -5,4 +5,6 @@ OZONE_WAYLAND_EXTRA_PATCHES = " \
 	file://0001-libva-adjust-paths-in-headers-to-include-libva-prefi.patch \
 "
 
+USEGOLD = ""
+
 DEPENDS += "gperf-native"
-- 
2.7.4


