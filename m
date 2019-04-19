Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 3EA0C5298F
	for <meta-arago@arago-project.org>;
	Fri, 19 Apr 2019 23:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 99DD540BC3;
	Fri, 19 Apr 2019 23:17:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id azBL256y6-2H; Fri, 19 Apr 2019 23:17:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8266440A3D;
	Fri, 19 Apr 2019 23:17:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 63F4E16D398;
	Fri, 19 Apr 2019 19:17:12 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 19 Apr 2019 19:17:10 -0400
Message-Id: <1555715831-1260-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH 1/2] chromium-wayland: adjust build flags to disable debug and fix size issue
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
X-List-Received-Date: Fri, 19 Apr 2019 23:17:37 -0000

Normally binaries are built with debug symbols and then those are stripped out
into corresponding -dbg packages for debugging purposes.

Chromium builds in a lot of components and that leads to a large binary size:
* with gcc7 it was 3.9GB with debugging info, stripped down to 80MB w/o it
* with gcc8 it became 4.3GB and that is larger than 32-bit addressing, so it
becomes corrupted and cannot be stripped or executed

By disabling generation of the debugging info in the first place, it is now
possible to get a working chromium, but w/o the ability to debug it.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-browser/chromium/chromium-wayland_%.bbappend | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-browser/chromium/chromium-wayland_%.bbappend b/meta-arago-distro/recipes-browser/chromium/chromium-wayland_%.bbappend
index d13606d..923db03 100644
--- a/meta-arago-distro/recipes-browser/chromium/chromium-wayland_%.bbappend
+++ b/meta-arago-distro/recipes-browser/chromium/chromium-wayland_%.bbappend
@@ -8,3 +8,5 @@ OZONE_WAYLAND_EXTRA_PATCHES = " \
 USEGOLD = ""
 
 DEPENDS += "gperf-native bison-native"
+
+FULL_OPTIMIZATION = "-O2 -pipe"
-- 
2.7.4


