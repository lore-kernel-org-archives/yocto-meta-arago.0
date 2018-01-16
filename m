Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id DC71052A5B
	for <meta-arago@arago-project.org>;
	Tue, 16 Jan 2018 03:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2690420B99;
	Tue, 16 Jan 2018 03:26:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id pSKrouyDysXw; Tue, 16 Jan 2018 03:26:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0D61320B84;
	Tue, 16 Jan 2018 03:26:23 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id BD382163261;
	Mon, 15 Jan 2018 22:26:22 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 15 Jan 2018 22:26:21 -0500
Message-Id: <1516073181-119142-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] chromium-wayland: as qtwebengine, chromium requires bison-native dependency
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
X-List-Received-Date: Tue, 16 Jan 2018 03:26:38 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-browser/chromium/chromium-wayland_%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-browser/chromium/chromium-wayland_%.bbappend b/meta-arago-distro/recipes-browser/chromium/chromium-wayland_%.bbappend
index 3130a64..d13606d 100644
--- a/meta-arago-distro/recipes-browser/chromium/chromium-wayland_%.bbappend
+++ b/meta-arago-distro/recipes-browser/chromium/chromium-wayland_%.bbappend
@@ -7,4 +7,4 @@ OZONE_WAYLAND_EXTRA_PATCHES = " \
 
 USEGOLD = ""
 
-DEPENDS += "gperf-native"
+DEPENDS += "gperf-native bison-native"
-- 
2.7.4


