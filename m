Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 502A5529AD
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:16 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so4861422oag.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=8lFNVaegeJgVMt/jUmbLe96f7DjNGnELmHJKrZp2UOY=;
	b=CDt88LiS50etICMMAcgEPEDulPg4pPkKUk0p/XVBCkGBUhIUpSg7/p2G3jo7WG4CsY
	TGz/gW5kQJUGkN8d+935xGc0/37WoWCx7HU+LbxK0kJUNN5YEqYpjQoHq1TabiVNLI7N
	WEyq/eDT5uUi/uIESus0LkUNN7xD3Ck7yZ3+PPps58UYzm/g0YSgPGDo8/MVrxqoLUY/
	OpzgRZSYQEPxq+RKN5WpsZBHedK9mrOID0SPzSPeslKSo/FujpaIqcEf9AWB55t1U6LO
	/JWvx62DI7KA/ht55cPYikj+iaeSjJUp+cMb9dDQnHFXPkOvpvZfr7IkOSZwHJTwTwlC
	fphg==
Received: by 10.60.170.233 with SMTP id ap9mr6564558oec.31.1352080455977;
	Sun, 04 Nov 2012 17:54:15 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:15 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:20 -0600
Message-Id: <1352080417-9792-23-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 25/42] qt4-tools-nativesdk: Select LGPLv2.1 license
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:17 -0000

* Qt/E gives a choice of LGPLv2.1 or GPLv3. Selecting the LGPLv2.1 license.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../qt4/qt4-tools-nativesdk_4.8.0.bbappend         |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bbappend b/meta-arago-distro/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bbappend
index f40b683..2c50d35 100644
--- a/meta-arago-distro/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bbappend
+++ b/meta-arago-distro/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bbappend
@@ -1,3 +1,7 @@
-PR_append = "-arago0"
+PR_append = "-arago1"
+
+# Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
+# For our distribution purposes we only use LGPLv2.1
+LICENSE = "LGPLv2.1"
 
 DEPENDS := "${@oe_filter_out('libx11-nativesdk', '${DEPENDS}', d)}"
-- 
1.7.0.4


