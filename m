Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 5A5BE52975
	for <meta-arago@arago-project.org>;
	Tue,  6 Mar 2018 04:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C4AF720B70;
	Tue,  6 Mar 2018 04:02:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Y4JQTfDwXo1h; Tue,  6 Mar 2018 04:02:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 88E9720855;
	Tue,  6 Mar 2018 04:02:50 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id CE62116330F;
	Mon,  5 Mar 2018 23:02:49 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon,  5 Mar 2018 23:02:46 -0500
Message-Id: <1520308967-16965-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH 1/2] ltp-ddt: update to 20180118
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
X-List-Received-Date: Tue, 06 Mar 2018 04:03:33 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ltp-ddt/{ltp-ddt_20170929.bb => ltp-ddt_20180118.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-extras/recipes-devtools/ltp-ddt/{ltp-ddt_20170929.bb => ltp-ddt_20180118.bb} (97%)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb
similarity index 97%
rename from meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
rename to meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb
index 29a2223..e401d23 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PR = "r6"
+PR = "r0"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
@@ -39,7 +39,7 @@ RDEPENDS_${PN} = "\
 
 inherit autotools-brokensep
 
-SRCREV = "c2ca6740c240ccb9780868a52317b82f2a30fcc1"
+SRCREV = "41e36ba5eb1dd1e059503576b6cc3c93b901652f"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
-- 
2.7.4


