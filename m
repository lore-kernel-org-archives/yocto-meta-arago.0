Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 10E1E52A2D
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2020 00:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DF7C840A6E;
	Wed,  8 Apr 2020 00:48:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 6UrON27UgIrD; Wed,  8 Apr 2020 00:48:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C2B3F40C1D;
	Wed,  8 Apr 2020 00:48:28 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 71E871718E9;
	Tue,  7 Apr 2020 20:48:28 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  7 Apr 2020 20:48:27 -0400
Message-Id: <1586306907-8544-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586306907-8544-1-git-send-email-denis@denix.org>
References: <1586306907-8544-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 2/2] packagegroup-arago-base-tisdk-server-extra: Keystone secure storage has been deprecated
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
X-List-Received-Date: Wed, 08 Apr 2020 00:50:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-base-tisdk-server-extra.bb  | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index d1f8a49..95617fe 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -23,20 +23,11 @@ ARAGO_NDISC6 = "\
     ndisc6-tracert6 \
     "
 
-ARAGO_SECURE_STORAGE = ""
-# All these secure storage packages need to be
-# migrated to openssl 1.1
-#    ti-softhsmv2 \
-#    libp11 \
-#    engine-pkcs11 \
-#    "
-
 # ipsecmgr has been disabled for a while
 # disable ipsecmgr-mod,hplib-mod due to K4.14 API changes
 #    ipsecmgr-mod
 #    hplib-mod
 ARAGO_TI_KEYSTONE_PKGS = "\
-    ${ARAGO_SECURE_STORAGE} \
     uio-module-drv \
     traceframework \
     cuia \
-- 
2.7.4


