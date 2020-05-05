Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id A64E352A05
	for <meta-arago@arago-project.org>;
	Tue,  5 May 2020 00:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 46DAA40ADE;
	Tue,  5 May 2020 00:51:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id KqBrMICHeZjo; Tue,  5 May 2020 00:51:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2D1FE40A6E;
	Tue,  5 May 2020 00:51:17 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 5278316EC83;
	Mon,  4 May 2020 20:51:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon,  4 May 2020 20:51:16 -0400
Message-Id: <1588639876-5174-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] arago.conf: re-enable "opencv" distro feature
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
X-List-Received-Date: Tue, 05 May 2020 00:53:41 -0000

From: Denys Dmytriyenko <denys@ti.com>

Corresponding fixes for external-arm-toolchain have been accepted upstream.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index a0dbadb..9552ff7 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -85,7 +85,7 @@ DISTRO_FEATURES_remove = "x11"
 # Add additional distro features
 DISTRO_FEATURES_append = " pam wayland opengl"
 DISTRO_FEATURES_append = " opencl"
-#DISTRO_FEATURES_append = " opencv"
+DISTRO_FEATURES_append = " opencv"
 DISTRO_FEATURES_append = " openmp"
 
 # Normally target distro features will not be applied to native builds:
-- 
2.7.4


