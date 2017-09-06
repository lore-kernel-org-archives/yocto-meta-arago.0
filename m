Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 4BEB4529CD
	for <meta-arago@arago-project.org>;
	Wed,  6 Sep 2017 01:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 400E4209BC;
	Wed,  6 Sep 2017 01:31:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id WYiOAc3jlteD; Wed,  6 Sep 2017 01:31:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 164D6208FB;
	Wed,  6 Sep 2017 01:31:04 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 7F6F81625ED;
	Tue,  5 Sep 2017 21:31:03 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue,  5 Sep 2017 21:31:01 -0400
Message-Id: <1504661462-77396-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH 1/2] can-utils: update to the latest
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
X-List-Received-Date: Wed, 06 Sep 2017 01:31:05 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend

diff --git a/meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend b/meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend
new file mode 100644
index 0000000..c0e6666
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend
@@ -0,0 +1,3 @@
+SRCREV = "5b518a0a5fa56856f804372a6b99b518dedb5386"
+
+PR_append = ".arago0"
-- 
2.7.4


