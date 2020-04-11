Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 5B41F52988
	for <meta-arago@arago-project.org>;
	Sat, 11 Apr 2020 22:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 16DA540C15;
	Sat, 11 Apr 2020 22:48:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id K5ic7dGNyAUE; Sat, 11 Apr 2020 22:48:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EEF6540A6E;
	Sat, 11 Apr 2020 22:48:26 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A8680172011;
	Sat, 11 Apr 2020 18:48:26 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 11 Apr 2020 18:48:21 -0400
Message-Id: <1586645302-19047-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/2] layer.conf: migrate from meta-linaro layers to meta-arm
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
X-List-Received-Date: Sat, 11 Apr 2020 22:50:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/layer.conf | 2 --
 meta-arago-extras/conf/layer.conf | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index 4371e02..a219c74 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -16,8 +16,6 @@ LAYERDEPENDS_meta-arago-distro = " \
     openembedded-layer \
     networking-layer \
     meta-python \
-    linaro-toolchain \
-    meta-optee \
     qt5-layer \
     browser-layer \
     meta-arago-extras \
diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
index 59830a4..7e3081b 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -21,7 +21,7 @@ LAYERDEPENDS_meta-arago-extras = " \
     openembedded-layer \
     networking-layer \
     meta-python \
-    linaro-toolchain \
+    arm-toolchain \
     qt5-layer \
 "
 
-- 
2.7.4


