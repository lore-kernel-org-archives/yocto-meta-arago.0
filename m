Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id AD4525209D
	for <meta-arago@arago-project.org>;
	Thu, 25 Oct 2012 02:31:39 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so1071042obb.38
	for <meta-arago@arago-project.org>;
	Wed, 24 Oct 2012 19:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=vrTkgcPCiXC38ksxEJQlKbSULey4a6RixgTDIXO0PtA=;
	b=iNT4gth63KMdKlEof0UfMnPsngaHhise5afGIddgwdvyb4sTcQGj9MqHBRxEjrcZ/F
	jMbikwHCtnCi4GIMTaJE7CREsNXZrxdq9vC0XgFa2Q2TRlSE8TYHKX4rwCkZuX9FwwQY
	drQTdeXrPtIFQk1HH3w/8ziQR5ALpkAfGbBeV2xCJS5Sjax05OoWBVACmJC2UJHAssz1
	2hHGrhErDwTZLPgpMp83MVzPx1hj6fUNP6vxODzO2FJHlNMQOAcB9vGXJ2WdIQnjWUIM
	+QdqRHrQOUAjaspMp/EuwuuVras3VXJ2WeusnlJ3q4YSvKcoel08aTTHd2JqOODtt0gV
	9oYA==
Received: by 10.182.131.37 with SMTP id oj5mr14259753obb.54.1351132299108;
	Wed, 24 Oct 2012 19:31:39 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id yn8sm17299407obb.12.2012.10.24.19.31.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 19:31:38 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed, 24 Oct 2012 21:31:35 -0500
Message-Id: <1351132295-21150-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] libjpeg-turbo: Add additional RPROVIDES, RREPLACES and RCONFLICTS
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
X-List-Received-Date: Thu, 25 Oct 2012 02:31:39 -0000

* Add the changes incorporated by the patch
  "libjpeg-turbo: Add RPROVIDES to fix errors when rdepending on jpeg"
  currently applied to meta-oe master but the denzil branch.
* Add additional RPROVIDES and RREPLACES and RCONFLICTS for jpeg-tools that
  the above patch does not incorporate. A patch will be sent to meta-oe that
  adds these additional changes.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/jpeg/libjpeg-turbo_svn.bbappend   |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend

diff --git a/meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend b/meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend
new file mode 100644
index 0000000..760fc86
--- /dev/null
+++ b/meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend
@@ -0,0 +1,14 @@
+PRINC := "${@int(PRINC) + 1}"
+
+# Temporarily add this append which incorporates the changes of meta-oe master 
+# patch "libjpeg-turbo: Add RPROVIDES to fix errors when rdepending on jpeg"
+# commit id 662fd013adcbee8c59f4f475a11911c3267eae90.
+
+RPROVIDES_${PN}  += "jpeg"
+RREPLACES_${PN}  += "jpeg"
+RCONFLICTS_${PN} += "jpeg"
+
+# Additional changes required that were not apart of the above patch
+RPROVIDES_jpeg-tools  += "libjpeg-tools"
+RREPLACES_jpeg-tools  += "libjpeg-tools"
+RCONFLICTS_jpeg-tools += "libjpeg-tools"
-- 
1.7.0.4


