Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 86BA952970
	for <meta-arago@arago-project.org>;
	Fri,  3 Feb 2017 23:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 26E0120B82;
	Fri,  3 Feb 2017 23:26:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id PRtuDEIzpnaX; Fri,  3 Feb 2017 23:26:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 051DA20893;
	Fri,  3 Feb 2017 23:26:49 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 4C2F3162335;
	Fri,  3 Feb 2017 18:26:49 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri,  3 Feb 2017 18:26:48 -0500
Message-Id: <1486164408-1611-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty][PATCH] attr: corresponding fix got merged to morty, drop locally
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
X-List-Received-Date: Fri, 03 Feb 2017 23:26:52 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-support/attr/acl_%.bbappend  | 1 -
 meta-arago-distro/recipes-support/attr/attr_%.bbappend | 1 -
 2 files changed, 2 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-support/attr/acl_%.bbappend
 delete mode 100644 meta-arago-distro/recipes-support/attr/attr_%.bbappend

diff --git a/meta-arago-distro/recipes-support/attr/acl_%.bbappend b/meta-arago-distro/recipes-support/attr/acl_%.bbappend
deleted file mode 100644
index 59be8ee..0000000
--- a/meta-arago-distro/recipes-support/attr/acl_%.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-EXTRA_OECONF_append_class-target = "${@['', ' --disable-gettext '][(d.getVar('USE_NLS', True) == 'no')]}"
diff --git a/meta-arago-distro/recipes-support/attr/attr_%.bbappend b/meta-arago-distro/recipes-support/attr/attr_%.bbappend
deleted file mode 100644
index 59be8ee..0000000
--- a/meta-arago-distro/recipes-support/attr/attr_%.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-EXTRA_OECONF_append_class-target = "${@['', ' --disable-gettext '][(d.getVar('USE_NLS', True) == 'no')]}"
-- 
2.7.4


