Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id AC96B529DC
	for <meta-arago@arago-project.org>;
	Mon, 17 Feb 2020 17:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CEB7840C04;
	Mon, 17 Feb 2020 17:19:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 9qKLtVj43lY3; Mon, 17 Feb 2020 17:19:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B4626400E7;
	Mon, 17 Feb 2020 17:19:25 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3D463174406;
	Mon, 17 Feb 2020 12:19:24 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 17 Feb 2020 12:19:21 -0500
Message-Id: <1581959963-41208-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH 1/3] HACK: opencv: disable python2 bindings as well for now
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
X-List-Received-Date: Mon, 17 Feb 2020 17:21:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
index 1725d1b..a87e832 100644
--- a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
+++ b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
@@ -25,7 +25,7 @@ PACKAGECONFIG_append = " ${PACKAGECONFIG_QTWAYLAND} \
 "
 
 PACKAGECONFIG_remove = "python3"
-PACKAGECONFIG_append = " python2"
+PACKAGECONFIG_remove = "python2"
 
 inherit cmake_qt5
 
-- 
2.7.4


