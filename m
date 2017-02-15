Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id E8B0152996
	for <meta-arago@arago-project.org>;
	Wed, 15 Feb 2017 02:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 00FD720B52;
	Wed, 15 Feb 2017 02:46:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Oiytc8nTGMaf; Wed, 15 Feb 2017 02:46:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D4CED208AD;
	Wed, 15 Feb 2017 02:46:14 +0000 (UTC)
Received: from gimli.denix (pippin [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 1B1E4162373;
	Tue, 14 Feb 2017 21:46:14 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 14 Feb 2017 21:46:13 -0500
Message-Id: <1487126773-129400-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [krogoth][PATCH] attr/ea-acl: pass --disable-gettext when USE_NLS=no
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
X-List-Received-Date: Wed, 15 Feb 2017 02:46:16 -0000

From: Denys Dmytriyenko <denys@ti.com>

Backport previous fix from morty.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-support/attr/acl_%.bbappend  | 1 +
 meta-arago-distro/recipes-support/attr/attr_%.bbappend | 1 +
 2 files changed, 2 insertions(+)
 create mode 100644 meta-arago-distro/recipes-support/attr/acl_%.bbappend
 create mode 100644 meta-arago-distro/recipes-support/attr/attr_%.bbappend

diff --git a/meta-arago-distro/recipes-support/attr/acl_%.bbappend b/meta-arago-distro/recipes-support/attr/acl_%.bbappend
new file mode 100644
index 0000000..59be8ee
--- /dev/null
+++ b/meta-arago-distro/recipes-support/attr/acl_%.bbappend
@@ -0,0 +1 @@
+EXTRA_OECONF_append_class-target = "${@['', ' --disable-gettext '][(d.getVar('USE_NLS', True) == 'no')]}"
diff --git a/meta-arago-distro/recipes-support/attr/attr_%.bbappend b/meta-arago-distro/recipes-support/attr/attr_%.bbappend
new file mode 100644
index 0000000..59be8ee
--- /dev/null
+++ b/meta-arago-distro/recipes-support/attr/attr_%.bbappend
@@ -0,0 +1 @@
+EXTRA_OECONF_append_class-target = "${@['', ' --disable-gettext '][(d.getVar('USE_NLS', True) == 'no')]}"
-- 
2.7.4


