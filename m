Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 74F0D52994
	for <meta-arago@arago-project.org>;
	Thu, 27 Feb 2020 23:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3923A40BFD;
	Thu, 27 Feb 2020 23:05:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id CGJxVMICwbTi; Thu, 27 Feb 2020 23:05:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0473740A13;
	Thu, 27 Feb 2020 23:05:29 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 440EF161A11;
	Thu, 27 Feb 2020 18:05:29 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 27 Feb 2020 18:05:29 -0500
Message-Id: <1582844729-22802-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH] opencv: delete temp bbappend limiting it to dsp platforms only
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
X-List-Received-Date: Thu, 27 Feb 2020 23:07:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-support/opencv/opencv_%.bbappend | 3 ---
 1 file changed, 3 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-support/opencv/opencv_%.bbappend

diff --git a/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
deleted file mode 100644
index bc885a4..0000000
--- a/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit machine_features_check
-
-REQUIRED_MACHINE_FEATURES = "dsp"
-- 
2.7.4


