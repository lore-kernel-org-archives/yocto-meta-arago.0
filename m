Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id B2BDE529EA
	for <meta-arago@arago-project.org>;
	Thu, 19 Jan 2017 18:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1A10F20B66;
	Thu, 19 Jan 2017 18:24:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ed_t-hBf9jJE; Thu, 19 Jan 2017 18:24:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EF7472099C;
	Thu, 19 Jan 2017 18:24:01 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 3F64F162320;
	Thu, 19 Jan 2017 13:24:01 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 19 Jan 2017 13:24:00 -0500
Message-Id: <1484850240-9086-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty][PATCH] acl: pass --disable-gettext when USE_NLS=no
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
X-List-Received-Date: Thu, 19 Jan 2017 18:24:08 -0000

Overlay the fix locally until it gets backported to morty.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-support/attr/acl_%.bbappend | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 meta-arago-distro/recipes-support/attr/acl_%.bbappend

diff --git a/meta-arago-distro/recipes-support/attr/acl_%.bbappend b/meta-arago-distro/recipes-support/attr/acl_%.bbappend
new file mode 100644
index 0000000..59be8ee
--- /dev/null
+++ b/meta-arago-distro/recipes-support/attr/acl_%.bbappend
@@ -0,0 +1 @@
+EXTRA_OECONF_append_class-target = "${@['', ' --disable-gettext '][(d.getVar('USE_NLS', True) == 'no')]}"
-- 
2.7.4


