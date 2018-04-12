Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id B89B552A08
	for <meta-arago@arago-project.org>;
	Thu, 12 Apr 2018 14:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5AC0320BBC;
	Thu, 12 Apr 2018 14:58:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id YN3T1XGL3crh; Thu, 12 Apr 2018 14:58:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 323F220B70;
	Thu, 12 Apr 2018 14:58:09 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 890741633B1;
	Thu, 12 Apr 2018 10:58:08 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Apr 2018 10:58:06 -0400
Message-Id: <1523545087-21125-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH 1/2] wayland-protocols: make bbappend version-agnostic
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
X-List-Received-Date: Thu, 12 Apr 2018 14:58:14 -0000

The patch is self-contained and applies cleanly on 1.10 in rocko and 1.13 in master.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{wayland-protocols_1.10.bbappend => wayland-protocols_%.bbappend}   | 2 --
 1 file changed, 2 deletions(-)
 rename meta-arago-extras/recipes-graphics/wayland/{wayland-protocols_1.10.bbappend => wayland-protocols_%.bbappend} (89%)

diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_1.10.bbappend b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_%.bbappend
similarity index 89%
rename from meta-arago-extras/recipes-graphics/wayland/wayland-protocols_1.10.bbappend
rename to meta-arago-extras/recipes-graphics/wayland/wayland-protocols_%.bbappend
index c592d07..b136826 100644
--- a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_1.10.bbappend
+++ b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_%.bbappend
@@ -6,8 +6,6 @@ SRC_URI += " \
       file://0001-wayland-drm-Add-wayland-drm-protocol-to-stable.patch \
       "
 
-S = "${WORKDIR}/wayland-protocols-1.10"
-
 do_install_append() {
 	install -d ${D}${datadir}/wayland-protocols/stable/wayland-drm
 	cp ${S}/stable/wayland-drm/wayland-drm.xml ${D}${datadir}/wayland-protocols/stable/wayland-drm/
-- 
2.7.4


