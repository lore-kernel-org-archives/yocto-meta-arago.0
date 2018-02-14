Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 19C2B52986
	for <meta-arago@arago-project.org>;
	Wed, 14 Feb 2018 20:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DB26820ACD;
	Wed, 14 Feb 2018 20:36:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id lgngdl6ETVkT; Wed, 14 Feb 2018 20:36:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B62B2208FD;
	Wed, 14 Feb 2018 20:36:54 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3866816329B;
	Wed, 14 Feb 2018 15:36:54 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 14 Feb 2018 15:36:53 -0500
Message-Id: <1518640613-37116-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] gstreamer1.0-plugins-ti: pass USE_NLS to get proper gettext dependencies
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
X-List-Received-Date: Wed, 14 Feb 2018 20:37:13 -0000

When USE_NLS is disabled globally, OE uses simplified minimal gettext.
But gstreamer1.0-plugins-ti use autopoint from the proper gettext:

| + check for build tools
|   checking for autoconf >= 2.60 ... found 2.69, ok.
|   checking for automake >= 1.10 ... found 1.15.1, ok.
|   checking for autopoint >= 0.17 ... autopoint not found !
| You must have autopoint installed to compile gst-vpe.
| Download the appropriate package for your distribution,
| or get the source tarball at ftp://ftp.gnu.org/pub/gnu/gettext/

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ti.inc       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ti.inc b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ti.inc
index 529306b..2a1fa06 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ti.inc
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ti.inc
@@ -1,6 +1,8 @@
 # Include file for common build settings for TI GStreamer plugins
 DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad libdrm libdce"
 
+USE_NLS = "yes"
+
 inherit autotools-brokensep pkgconfig gettext
 
 INC_PR = "r2"
-- 
2.7.4


