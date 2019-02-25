Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 9AAAB529AD
	for <meta-arago@arago-project.org>;
	Mon, 25 Feb 2019 22:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 90EC540B0A;
	Mon, 25 Feb 2019 22:31:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8q6e8X2_NBiX; Mon, 25 Feb 2019 22:31:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7B3B9403F2;
	Mon, 25 Feb 2019 22:31:05 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 2FCF116ACB6;
	Mon, 25 Feb 2019 17:31:05 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 25 Feb 2019 17:31:05 -0500
Message-Id: <1551133865-15645-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] packagegroup-arago-standalone-sdk-target: conditionally install glibc-staticdev for linaro
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
X-List-Received-Date: Mon, 25 Feb 2019 22:31:11 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-standalone-sdk-target.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
index 26cb503..5a33a04 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
@@ -11,7 +11,7 @@ RDEPENDS_${PN} = "\
     libgcc-dev \
     libstdc++-dev \
     ${LIBC_DEPENDENCIES} \
-    glibc-staticdev \
+    ${@oe.utils.conditional('TCMODE', 'external-linaro', 'glibc-staticdev', '', d)} \
     linux-libc-headers-dev \
     gdbserver \
     alsa-dev \
-- 
2.7.4


