Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 1205B52A40
	for <meta-arago@arago-project.org>;
	Wed,  6 May 2020 22:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D748D40C2D;
	Wed,  6 May 2020 22:35:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id t23tqpS00YTL; Wed,  6 May 2020 22:35:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BB1EF40C33;
	Wed,  6 May 2020 22:35:54 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 5350C172F72;
	Wed,  6 May 2020 18:35:53 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed,  6 May 2020 18:35:51 -0400
Message-Id: <1588804551-10982-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588804551-10982-1-git-send-email-denis@denix.org>
References: <1588804551-10982-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 4/4] arago.conf: re-enable "opencv" distro feature
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
X-List-Received-Date: Wed, 06 May 2020 22:38:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Corresponding fixes for external-arm-toolchain have been accepted upstream.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index ee1bb10..9dcc495 100644
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


