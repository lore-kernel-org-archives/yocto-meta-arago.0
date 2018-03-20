Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 242CD529A2
	for <meta-arago@arago-project.org>;
	Tue, 20 Mar 2018 21:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6236A2084C;
	Tue, 20 Mar 2018 21:52:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ds8w6ImIWVB0; Tue, 20 Mar 2018 21:52:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1F4F620B89;
	Tue, 20 Mar 2018 21:52:13 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 845BE16332A;
	Tue, 20 Mar 2018 17:52:13 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 20 Mar 2018 17:52:07 -0400
Message-Id: <1521582729-47998-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH 1/3] matrix-gui-machinevision-demos: remove unnecessary machine override affecting HS platforms
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
X-List-Received-Date: Tue, 20 Mar 2018 21:53:15 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
index 4adb7bc..87c487d 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
@@ -20,7 +20,7 @@ PACKAGES = "matrix-machinevision-demo-dlp3dscanner \
             matrix-machinevision-demo-simplepeopletracking \
 "
 
-RDEPENDS_matrix-machinevision-demo-dlp3dscanner_dra7xx = " \
+RDEPENDS_matrix-machinevision-demo-dlp3dscanner = " \
     ${MACHINEVISION_RDEPENDS} \
     point-cloud-viewer \
 "
-- 
2.7.4


