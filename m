Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id C1E595208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:53:47 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so4802582obb.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=wVWthoAEA4/4HDR2lS1DHBDXCIAKK2H67+DApiYcB84=;
	b=e8ivnldnOnuWncLtfTNrqQMRNxCS9uhxG7v6A+TNv99jqNK3QEz/PzOkJiIDDh7kL0
	/eg1eqOO89Dsk6yEhRgreCqC82NWPs5Ek1XgTMN4+iZSG4GcKxMGXQj0A93OLvb4cHjS
	4c5c8fFZbUR++X3icqxkLIjMqRdZghj5ADZxq52fbIYlJnoWc5zvNkH2e0oevFDIeMig
	JveiP5AJhEthdDTGOw/w7/hrh9blRvw+BaDL4wVN/U9DCHK3P34bIOG1QBBeCI9y2FCD
	RAsrFkojNvvjzqmAJ72eds+S0ZdFMAfNiku1Qm7ar/+pwesIl4KA1KpvdyG2yujQLgtX
	WDrg==
Received: by 10.182.49.104 with SMTP id t8mr6772610obn.0.1352080426690;
	Sun, 04 Nov 2012 17:53:46 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.53.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:53:46 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:52:59 -0600
Message-Id: <1352080417-9792-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 04/42] libjpeg-turbo: Fix jpeg-tools error
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
X-List-Received-Date: Mon, 05 Nov 2012 01:53:48 -0000

* Recipes that depended on jpeg-tools were failing when the PREFERRED_PROVIDER
  was set to libjpeg-turbo.
* Add RPROVIDES to fix this issue.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/jpeg/libjpeg-turbo_svn.bbappend   |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend b/meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend
index 08c085d..65a34f0 100644
--- a/meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend
+++ b/meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend
@@ -1,4 +1,4 @@
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 # Temporarily add this append which incorporates the changes of meta-oe master 
 # patch "libjpeg-turbo: Add RPROVIDES to fix errors when rdepending on jpeg"
@@ -7,3 +7,10 @@ PRINC := "${@int(PRINC) + 1}"
 RPROVIDES_${PN}  += "jpeg"
 RREPLACES_${PN}  += "jpeg"
 RCONFLICTS_${PN} += "jpeg"
+
+# Patch to incorporate the below changes will be sent to meta-oe master and
+# maintenance branch. When this fix is in the maintenance branch then the
+# below changes can be removed.
+RPROVIDES_jpeg-tools  += "libjpeg-tools"
+RREPLACES_jpeg-tools  += "libjpeg-tools"
+RCONFLICTS_jpeg-tools += "libjpeg-tools"
-- 
1.7.0.4


