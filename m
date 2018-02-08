Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 7D0DB52092
	for <meta-arago@arago-project.org>;
	Thu,  8 Feb 2018 18:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 070F62085A;
	Thu,  8 Feb 2018 18:09:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id jJYBnWbBrmdd; Thu,  8 Feb 2018 18:09:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9D44720059;
	Thu,  8 Feb 2018 18:09:16 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id ED1BB163261;
	Thu,  8 Feb 2018 13:09:15 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  8 Feb 2018 13:09:15 -0500
Message-Id: <1518113355-10794-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] ndisc6: need to set USE_NLS="yes" to use gettext.h
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
X-List-Received-Date: Thu, 08 Feb 2018 18:09:27 -0000

Otherwise we can get gettext-minimal-native dependency instead, which does not
provide gettext.h header.

The patch has been submitted upstream to meta-oe/meta-networking, but hasn't
landed yet.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-support/ndisc6/ndisc6_git.bbappend | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 meta-arago-distro/recipes-support/ndisc6/ndisc6_git.bbappend

diff --git a/meta-arago-distro/recipes-support/ndisc6/ndisc6_git.bbappend b/meta-arago-distro/recipes-support/ndisc6/ndisc6_git.bbappend
new file mode 100644
index 0000000..7e2cfd2
--- /dev/null
+++ b/meta-arago-distro/recipes-support/ndisc6/ndisc6_git.bbappend
@@ -0,0 +1 @@
+USE_NLS = "yes"
-- 
2.7.4


