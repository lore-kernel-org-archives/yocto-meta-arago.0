Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 1EC40529A4
	for <meta-arago@arago-project.org>;
	Wed, 12 Jun 2019 17:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9C18940BE5;
	Wed, 12 Jun 2019 17:30:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Lt1_MUk5IP1D; Wed, 12 Jun 2019 17:30:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E20FC40BBE;
	Wed, 12 Jun 2019 17:30:04 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id F3209170069;
	Wed, 12 Jun 2019 13:30:03 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 12 Jun 2019 13:30:03 -0400
Message-Id: <1560360603-34381-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] point-cloud-viewer: add RDEPENDS on libxkbcommon
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
X-List-Received-Date: Wed, 12 Jun 2019 17:30:47 -0000

Fixes following QA error:
ERROR: point-cloud-viewer-2.1-r1 do_package_qa: QA Issue: /usr/bin/point_cloud_viewer contained in package point-cloud-viewer requires libxkbcommon.so.0, but no providers found in RDEPENDS_point-cloud-viewer? [file-rdeps]

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
index 9ee4ff0..067ead9 100644
--- a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
+++ b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
@@ -17,7 +17,7 @@ PV = "2.1"
 
 S = "${WORKDIR}/git"
 
-RDEPENDS_${PN} = "glfw opencv libstdc++"
+RDEPENDS_${PN} = "glfw opencv libxkbcommon"
 
 do_install() {
     install -d ${D}${bindir}
-- 
2.7.4


