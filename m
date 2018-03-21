Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id D8813529A2
	for <meta-arago@arago-project.org>;
	Wed, 21 Mar 2018 00:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E949D20B73;
	Wed, 21 Mar 2018 00:56:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id SPFGxgWolnIg; Wed, 21 Mar 2018 00:56:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C40292099C;
	Wed, 21 Mar 2018 00:56:06 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 4827416337D;
	Tue, 20 Mar 2018 20:56:06 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 20 Mar 2018 20:56:01 -0400
Message-Id: <1521593761-7567-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521582729-47998-1-git-send-email-denys@ti.com>
References: <1521582729-47998-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCHv2 1/4] matrix-gui-machinevision-demos: make machine-specific due to machine override
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
X-List-Received-Date: Wed, 21 Mar 2018 00:57:08 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - instead of removing machine override, make package machine-specific

 .../recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb      | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
index 4adb7bc..35cd630 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
@@ -5,7 +5,7 @@ require recipes-core/matrix/matrix-gui-apps-git.inc
 
 PR = "${INC_PR}.3"
 
-inherit allarch
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git/machinevision_apps"
 
@@ -20,8 +20,11 @@ PACKAGES = "matrix-machinevision-demo-dlp3dscanner \
             matrix-machinevision-demo-simplepeopletracking \
 "
 
-RDEPENDS_matrix-machinevision-demo-dlp3dscanner_dra7xx = " \
+RDEPENDS_matrix-machinevision-demo-dlp3dscanner = " \
     ${MACHINEVISION_RDEPENDS} \
+"
+
+RDEPENDS_matrix-machinevision-demo-dlp3dscanner_append_dra7xx = " \
     point-cloud-viewer \
 "
 
-- 
2.7.4


