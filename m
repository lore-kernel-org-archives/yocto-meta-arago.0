Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 94D2152987
	for <meta-arago@arago-project.org>;
	Sun, 17 Jun 2018 19:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7374520B1F;
	Sun, 17 Jun 2018 19:37:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id JYxxjPuRQeyt; Sun, 17 Jun 2018 19:37:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3C0A920BBF;
	Sun, 17 Jun 2018 19:37:42 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id C89641634AF;
	Sun, 17 Jun 2018 15:37:41 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Sun, 17 Jun 2018 15:37:35 -0400
Message-Id: <1529264260-41284-4-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529264260-41284-1-git-send-email-denys@ti.com>
References: <1529264260-41284-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 4/9] optee-test: update to 3.1.0
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
X-List-Received-Date: Sun, 17 Jun 2018 19:37:51 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-security/optee/optee-test_git.bbappend | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
index 996032e..d99361f 100644
--- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
@@ -1,8 +1,8 @@
-PR_append = ".arago1"
+PR_append = ".arago0"
 
 SRC_URI = "git://git.ti.com/optee/ti-optee-test.git;branch=${BRANCH}"
 
-PV = "2.6.0+git${SRCPV}"
+PV = "3.1.0+git${SRCPV}"
 
 BRANCH = "ti_optee_test"
-SRCREV = "cc72dd2ce5c45318ad1618633bf0c859ad56cd8a"
+SRCREV = "b284eedf4fa20c21403ececfe0a47af55fbaa5d8"
-- 
2.7.4


