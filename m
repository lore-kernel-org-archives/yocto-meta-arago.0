Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 50EAD52A7F
	for <meta-arago@arago-project.org>;
	Mon, 16 Feb 2015 21:30:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1GLUUtT020293
	for <meta-arago@arago-project.org>; Mon, 16 Feb 2015 15:30:30 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1GLUTPE006925
	for <meta-arago@arago-project.org>; Mon, 16 Feb 2015 15:30:29 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 16 Feb 2015 15:30:29 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1GLUSHn005823;	Mon, 16 Feb 2015 15:30:28 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t1GLUOpm030075;	Tue, 17 Feb 2015 03:00:26 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Feb 2015 15:30:16 -0600
Message-ID: <1424122222-26709-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1424122222-26709-1-git-send-email-fcooper@ti.com>
References: <1424122222-26709-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/8] nativesdk-packagegroup-arago-sdk-host: Add nativesdk-git
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
X-List-Received-Date: Mon, 16 Feb 2015 21:30:31 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../nativesdk-packagegroup-arago-sdk-host.bb       |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
index 1db12aa..9ef9ddd 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Host packages for a standalone Arago SDK or external toolchain"
-PR = "r4"
+PR = "r5"
 LICENSE = "MIT"
 
 inherit nativesdk packagegroup
@@ -9,4 +9,5 @@ RDEPENDS_${PN} = "\
     nativesdk-opkg \
     nativesdk-libtool \
     nativesdk-python-distutils \
+    nativesdk-git \
     "
-- 
1.7.9.5


