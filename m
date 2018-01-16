Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id B0C3852A5B
	for <meta-arago@arago-project.org>;
	Tue, 16 Jan 2018 04:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D01BB20B93;
	Tue, 16 Jan 2018 04:10:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Ut8WT4rCfhJc; Tue, 16 Jan 2018 04:10:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B7B0220B99;
	Tue, 16 Jan 2018 04:10:49 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 58322163267;
	Mon, 15 Jan 2018 23:10:49 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 15 Jan 2018 23:10:47 -0500
Message-Id: <1516075847-37500-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516075847-37500-1-git-send-email-denys@ti.com>
References: <1516075847-37500-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 2/2] gstreamer1.0-plugins-hevc: add explicit gettext-native dependency
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
X-List-Received-Date: Tue, 16 Jan 2018 04:11:04 -0000

Fixes this error:

| + check for build tools
|   checking for autoconf >= 2.60 ... found 2.69, ok.
|   checking for automake >= 1.10 ... found 1.15.1, ok.
|   checking for autopoint >= 0.17 ... autopoint not found !
| You must have autopoint installed to compile gst-h265dec.
| Download the appropriate package for your distribution,
| or get the source tarball at ftp://ftp.gnu.org/pub/gnu/gettext/
|   checking for libtoolize >= 1.5.0 ... found 2.4.6, ok.
|   checking for pkg-config >= 0.8.0 ... found 0.29.2, ok.
|
| - Please get the right tools before proceeding.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
index cd93955..741895f 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
@@ -10,7 +10,7 @@ SRCREV = "e4ea007d0ddeb95ae01742293454ef3c87a6e84c"
 
 S = "${WORKDIR}/git"
 
-DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base hevc-arm-decoder"
+DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base hevc-arm-decoder gettext-native"
 
 inherit autotools-brokensep pkgconfig gettext
 
-- 
2.7.4


