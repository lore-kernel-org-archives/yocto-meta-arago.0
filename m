Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id D4C5152A65
	for <meta-arago@arago-project.org>;
	Wed, 10 Oct 2012 19:26:17 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so888166oag.38
	for <meta-arago@arago-project.org>;
	Wed, 10 Oct 2012 12:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ZpfaVyoTsVSiq6MTQOtZu6ixPZKTNv8AXh3kg3nIAEA=;
	b=fSwSjDXaHsAWbXSfj4MOEVFpGn69kpEE3N7kuSzsm9I+tCyyt4SNocl4cEcaRLdzmv
	DILVpJSW+Fg3TrlxKXI3Zde63W7AGgfW1ijb2HX0Fkt38a7/5MgkiAYZgUOKnWrMtT68
	2At/+DxbfvjUrT10VTB+4E/uGY1BIvNBpPgVdCqcdqRYVeSUzO9+63deMqZpHmKwkL5a
	/86vDNEIITXpCDUl7nW8xBwZL3cy9yBa2iXNxC6gwU5AJTOo2yriZMt/EHtOC9LsvEcD
	wLeF2AVj2Nyokcj12D0lsHWaTZg+McCg/o2Mj+vQ1uSKIhFpCKy6BODsNOiO0sfXsDsJ
	Pl5A==
Received: by 10.60.32.135 with SMTP id j7mr10120475oei.132.1349897177444;
	Wed, 10 Oct 2012 12:26:17 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id k8sm1500965oeh.9.2012.10.10.12.26.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Oct 2012 12:26:17 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed, 10 Oct 2012 14:56:38 -0500
Message-Id: <1349898999-485-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/2] u-boot_2011.09-psp04.06.00.08: Add Arago specific tweaks
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
X-List-Received-Date: Wed, 10 Oct 2012 19:26:18 -0000

* Set the PSPREL and UVER variable. These variables are used by the sourceipk
  class.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../u-boot/u-boot_2011.09-psp04.06.00.08.bbappend  |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bbappend

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bbappend
new file mode 100644
index 0000000..9871300
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bbappend
@@ -0,0 +1,5 @@
+PR_append = "-arago0"
+
+# PSPREL and UVER are used by arago-source-ipk.conf
+PSPREL = "04.06.00.08"
+UVER = "2011.09"
-- 
1.7.0.4


