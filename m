Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id EAA5C529D4
	for <meta-arago@arago-project.org>;
	Sat, 11 Apr 2020 22:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8D8B740C33;
	Sat, 11 Apr 2020 22:32:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Ww2Uz-qZuq34; Sat, 11 Apr 2020 22:32:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5FB6940C30;
	Sat, 11 Apr 2020 22:32:54 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id C2DAF1724A2;
	Sat, 11 Apr 2020 18:32:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 11 Apr 2020 18:32:49 -0400
Message-Id: <1586644369-16268-10-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586644369-16268-1-git-send-email-denis@denix.org>
References: <1586644369-16268-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 10/10] arago.conf: add support for opencl, opencv, openmp distro features
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
X-List-Received-Date: Sat, 11 Apr 2020 22:35:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Disable opencv for now, due to breakage with external arm toolchain.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 05201f3..c4873e0 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -80,6 +80,14 @@ DISTRO_FEATURES_remove = "x11"
 
 # Add additional distro features
 DISTRO_FEATURES_append = " pam wayland opengl"
+DISTRO_FEATURES_append = " opencl"
+#DISTRO_FEATURES_append = " opencv"
+DISTRO_FEATURES_append = " openmp"
+
+# Normally target distro features will not be applied to native builds:
+# Native distro features on this list will use the target feature value
+DISTRO_FEATURES_FILTER_NATIVE_append = " opencl opencv openmp"
+DISTRO_FEATURES_FILTER_NATIVESDK_append = " opencl opencv openmp"
 
 # Set global runtime providers for major components
 ARAGO_SYSVINIT ?= "0"
-- 
2.7.4


