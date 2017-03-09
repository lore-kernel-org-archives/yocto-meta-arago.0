Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id D2E1352ABE
	for <meta-arago@arago-project.org>;
	Thu,  9 Mar 2017 21:28:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v29LRql7027472
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 15:27:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489094872;
	bh=zjgmzlaaFoLBP7eocNw4BS/YND6OTcGHVQKPSnU3y5E=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=tmDi7T/7E+I0MuIqjG+qXNfcCkTyC25GQcyvxdoeIQ6NdBuY/6pn7mYiF/GiU4Ngi
	NgowKSAahuL3Bg/OHBGjZfnt5AGH9Q/2mTobRI9meaMwyWd/2oOuf1nmT9mWkp121b
	Bhx6j8DKANMoh4OjpYWHOEGiPrZjF9N7rByojsUo=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v29LRlci004853
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 15:27:47 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Mar 2017 15:27:47 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v29LRfEs025736	for <meta-arago@arago-project.org>;
	Thu, 9 Mar 2017 15:27:47 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 9 Mar 2017 16:27:36 -0500
Message-ID: <1489094857-27497-5-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1489094857-27497-1-git-send-email-e-ruei1@ti.com>
References: <1489094857-27497-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [morty][PATCH V2 4/5] weston: fix hotplug weston termination problem
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
X-List-Received-Date: Thu, 09 Mar 2017 21:28:03 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
index 08f2f22..55484b7 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
@@ -2,7 +2,7 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = ".arago20"
+PR_append = ".arago21"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -14,4 +14,5 @@ SRC_URI += " \
 	file://0002-Weston-Allow-visual_id-to-be-0.patch \
 	file://0003-Weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
 	file://0004-Weston-Fix-touch-screen-crash-issue.patch \
+	file://0001-compositor-drm-fix-hotplug-weston-termination-proble.patch \
 "
-- 
1.9.1


