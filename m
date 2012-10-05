Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 4A286529A1
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 06:25:04 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so1322863oag.38
	for <meta-arago@arago-project.org>;
	Thu, 04 Oct 2012 23:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8sVpCG2+PWfm8pATfW6cq2bybSTpHaxsYqcZ66Oi+0E=;
	b=A86KXncbFAAEOusViOp5c78bPFs+KnhiNQr35AsSV1Aln9dyTklbLXkKmppgr1r4Dw
	JAzXaQm5p7gpSK44t1D/Fuvp7qms7gIoZBuIcSE+kZiYxolI7xNvIa6ZSAIYKhhH2N/Q
	L4YNOtYbMvpksKnhcG3un23tpt1NPdDzpOOeyjek0hNvkpi4DnIMqsw+AL919Qeo0HNu
	Ab9O37YAdFJbyIMojeQaDZJ+NVPSZoQdYhYB/Mx1DbDoE5z+odk8F7NE0tM+PlB1FjOo
	kqb+BWUw29ayofYF+Mdktve33yn0R4B9NgGtZMmSKhGdJ5Qw1Dgrwj1gtHpjQgnEzb4V
	yavQ==
Received: by 10.60.22.196 with SMTP id g4mr6447317oef.95.1349418303622;
	Thu, 04 Oct 2012 23:25:03 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id ez16sm8730234obc.8.2012.10.04.23.25.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 23:25:03 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  5 Oct 2012 01:53:24 -0500
Message-Id: <1349420004-21899-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] arago: Mask meta-oe lighttpd bbappend
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
X-List-Received-Date: Fri, 05 Oct 2012 06:25:05 -0000

* Meta-oe includes an append for lighttpd that adds systemd.
* In master this is fixed since a new layer meta-systemd has been created
  and the lighttpd bbappend that adds systemd has been moved there.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 002f000..c5d826c 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -1,5 +1,5 @@
 # Mask some broken recipes
-BBMASK = "meta-ti/recipes-misc|meta-linaro/recipes-lamp"
+BBMASK = "meta-ti/recipes-misc|meta-linaro/recipes-lamp|meta-oe/recipes-extended/lighttpd"
 
 # Select external binary prebuilt Linaro toolchain
 TCMODE = "external-arago"
-- 
1.7.0.4


