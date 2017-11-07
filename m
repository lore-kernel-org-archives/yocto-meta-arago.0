Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id E818C52A41
	for <meta-arago@arago-project.org>;
	Tue,  7 Nov 2017 17:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DDC1A20147;
	Tue,  7 Nov 2017 17:01:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id tfznNwQ6WG9I; Tue,  7 Nov 2017 17:01:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BCEF9209BC;
	Tue,  7 Nov 2017 17:01:02 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 4DD19162717;
	Tue,  7 Nov 2017 12:01:02 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue,  7 Nov 2017 12:01:01 -0500
Message-Id: <1510074061-147363-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510074061-147363-1-git-send-email-denys@ti.com>
References: <1510074061-147363-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 2/2] unshallow-repositories: RDEPENDS on bash
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
X-List-Received-Date: Tue, 07 Nov 2017 17:01:04 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb
index 7873587..d75fb4b 100644
--- a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb
@@ -13,3 +13,4 @@ do_install () {
 }
 
 FILES_${PN} = "/*"
+RDEPENDS_${PN} += "bash"
-- 
2.7.4


