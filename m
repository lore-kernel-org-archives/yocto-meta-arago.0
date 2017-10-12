Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 5DF51529AC
	for <meta-arago@arago-project.org>;
	Thu, 12 Oct 2017 21:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 97AD220AD5;
	Thu, 12 Oct 2017 21:28:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id a_Dw8yMUlSCI; Thu, 12 Oct 2017 21:28:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7856A20B0C;
	Thu, 12 Oct 2017 21:28:17 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id EC6C91626F1;
	Thu, 12 Oct 2017 17:28:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 12 Oct 2017 17:28:10 -0400
Message-Id: <1507843693-2615-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507843693-2615-1-git-send-email-denis@denix.org>
References: <1507843693-2615-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 6/9] matrix-gui-submenus: RDEPENDS on bash
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
X-List-Received-Date: Thu, 12 Oct 2017 21:28:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
index b9973dd..34bd759 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
@@ -73,7 +73,7 @@ PACKAGES += " ${PN}-arm \
 "
 
 # Make sure app images has been installed
-RDEPENDS_${PN} += "matrix-gui-apps-images"
+RDEPENDS_${PN} += "matrix-gui-apps-images bash"
 
 # Add the files for each submenu package
 FILES_${PN}-arm = "${MATRIX_APP_DIR}/arm_submenu/*"
-- 
2.7.4


