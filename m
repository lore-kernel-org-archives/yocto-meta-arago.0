Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 83E6C529A5
	for <meta-arago@arago-project.org>;
	Tue,  3 Mar 2020 16:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 82EEB40C2E;
	Tue,  3 Mar 2020 16:39:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id whIF4_NfgG6Q; Tue,  3 Mar 2020 16:39:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6E39040C1E;
	Tue,  3 Mar 2020 16:39:46 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3281E16D8F0;
	Tue,  3 Mar 2020 11:39:46 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  3 Mar 2020 11:39:46 -0500
Message-Id: <1583253586-28725-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH] Revert "arago.conf: add xkbcommon-evdev back to qtbase PACKAGECONFIG"
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
X-List-Received-Date: Tue, 03 Mar 2020 16:41:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit 5f571b9e528aa6e5d960991b20b0fe58f6499de8.

WARNING: qtbase-5.13.2+gitAUTOINC+a7a24784ee-r0.arago16 do_configure: QA Issue: qtbase: invalid PACKAGECONFIG: xkbcommon-evdev [invalid-packageconfig]

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 6b33896..6ecaf7e 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -99,7 +99,7 @@ PACKAGECONFIG_append_pn-systemd = " coredump"
 
 # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)
 PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
-PACKAGECONFIG_DISTRO_pn-qtbase = "icu examples accessibility gif gbm kms libinput xkbcommon-evdev"
+PACKAGECONFIG_DISTRO_pn-qtbase = "icu examples accessibility gif gbm kms libinput"
 PACKAGECONFIG_FONTS_pn-qtbase = "fontconfig"
 
 # Add gstreamer in package configuration to enable video
-- 
2.7.4


