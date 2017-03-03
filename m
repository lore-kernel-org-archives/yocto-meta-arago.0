Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id C8F2C52AD6
	for <meta-arago@arago-project.org>;
	Fri,  3 Mar 2017 02:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 957AA20BA8;
	Fri,  3 Mar 2017 02:59:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id qm5MVz_FSfYY; Fri,  3 Mar 2017 02:59:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9EF8120BAD;
	Fri,  3 Mar 2017 02:59:08 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 49FAA1623B3;
	Thu,  2 Mar 2017 21:59:06 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  2 Mar 2017 21:59:02 -0500
Message-Id: <1488509945-12853-10-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488509945-12853-1-git-send-email-denis@denix.org>
References: <1488509945-12853-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 09/12] packagegroup-*-qte: use qtdeclarative-qmlplugins instead of -plugins
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
X-List-Received-Date: Fri, 03 Mar 2017 02:59:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
index 5030caa..2479af4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
@@ -28,7 +28,7 @@ QT4_ESSENTIALS = "\
 
 QT5_ESSENTIALS = "\
     qtbase-plugins \
-    qtdeclarative-plugins \
+    qtdeclarative-qmlplugins \
     qtdeclarative-qmlplugins \
     qtlocation-plugins \
     qtlocation-qmlplugins \
-- 
2.7.4


