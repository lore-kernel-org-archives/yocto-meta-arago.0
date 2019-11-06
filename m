Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 51AED529D4
	for <meta-arago@arago-project.org>;
	Wed,  6 Nov 2019 19:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CF22C40BFD;
	Wed,  6 Nov 2019 19:02:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id oH-zsVLzE-dT; Wed,  6 Nov 2019 19:02:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BD69840BF0;
	Wed,  6 Nov 2019 19:02:31 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DD81C1742E2;
	Wed,  6 Nov 2019 14:02:28 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  6 Nov 2019 14:02:20 -0500
Message-Id: <1573066944-48181-6-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573066944-48181-1-git-send-email-denys@ti.com>
References: <1573066944-48181-1-git-send-email-denys@ti.com>
Subject: [RFC][PATCH 5/9] arago-test-image: drop unused image recipe
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
X-List-Received-Date: Wed, 06 Nov 2019 19:03:58 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/arago-test-image.bb           | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/images/arago-test-image.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-test-image.bb b/meta-arago-distro/recipes-core/images/arago-test-image.bb
deleted file mode 100644
index 1142112..0000000
--- a/meta-arago-distro/recipes-core/images/arago-test-image.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-# Arago System Test image
-# gives you test applications
-LICENSE = "MIT"
-
-require arago-image.inc
-
-IMAGE_FSTYPES = "tar.xz"
-
-IMAGE_INSTALL += "\
-    packagegroup-arago-base \
-    packagegroup-arago-console \
-    packagegroup-arago-base-tisdk \
-    packagegroup-arago-tisdk-crypto \
-    packagegroup-arago-tisdk-addons \
-    packagegroup-arago-test \
-    packagegroup-arago-test-addons \
-    "
-
-export IMAGE_BASENAME = "arago-test-image"
-- 
2.7.4


