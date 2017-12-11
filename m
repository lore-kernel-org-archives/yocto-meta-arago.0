Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id DF34E52A0B
	for <meta-arago@arago-project.org>;
	Mon, 11 Dec 2017 22:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 64AD420B2C;
	Mon, 11 Dec 2017 22:19:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id GWzUnqqs_S6p; Mon, 11 Dec 2017 22:19:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3B9F22087C;
	Mon, 11 Dec 2017 22:19:43 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id A65E1162771;
	Mon, 11 Dec 2017 17:19:42 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 11 Dec 2017 17:19:42 -0500
Message-Id: <1513030782-22973-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513030782-22973-1-git-send-email-denys@ti.com>
References: <1513030782-22973-1-git-send-email-denys@ti.com>
Subject: [morty/master][PATCH 2/2] linalg-examples: remove SRCIPK variables
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
X-List-Received-Date: Mon, 11 Dec 2017 22:19:45 -0000

Already defined in corresponding .inc file in meta-arago-distro

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb b/meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb
index 58b3b88..350c5cf 100644
--- a/meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb
@@ -32,7 +32,3 @@ FILES_${PN}-dbg += "\
 "
 
 INSANE_SKIP_${PN} = "arch ldflags textrel"
-
-CREATE_SRCIPK = "1"
-SRCIPK_INSTALL_DIR = "example-applications/${PN}-${PV}"
-SRCIPK_SRC_DIR = "${EXAMPLES_ROOT}"
-- 
2.7.4


