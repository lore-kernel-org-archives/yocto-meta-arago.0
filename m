Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id E3E2352AF4
	for <meta-arago@arago-project.org>;
	Mon, 18 Sep 2017 19:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 649D920AE0;
	Mon, 18 Sep 2017 19:24:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ajVNQlX6T2cM; Mon, 18 Sep 2017 19:24:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 43E04207BA;
	Mon, 18 Sep 2017 19:24:48 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id A1295162325;
	Mon, 18 Sep 2017 15:24:47 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 18 Sep 2017 15:24:47 -0400
Message-Id: <1505762687-130176-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH v2] arago-base-tisdk-image: enable UBI for minimal FS on dra7xx platforms
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
X-List-Received-Date: Mon, 18 Sep 2017 19:24:50 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - only enable on dra7xx, as some other platforms can't do UBI

 meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
index a3f5128..e926724 100644
--- a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
@@ -4,6 +4,7 @@
 require arago-image.inc
 
 IMAGE_FSTYPES += "cpio.xz"
+IMAGE_FSTYPES_append_dra7xx = " ubifs ubi"
 
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
-- 
2.7.4


