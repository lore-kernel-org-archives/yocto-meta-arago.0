Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 8A08152976
	for <meta-arago@arago-project.org>;
	Sat,  3 Mar 2018 06:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0198B20992;
	Sat,  3 Mar 2018 06:56:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 1MOOeUSO93l9; Sat,  3 Mar 2018 06:56:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D2AD12098D;
	Sat,  3 Mar 2018 06:56:12 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 490621632F8;
	Sat,  3 Mar 2018 01:56:12 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Sat,  3 Mar 2018 01:56:12 -0500
Message-Id: <1520060172-28521-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] qt-tstat: fix SRCREV
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
X-List-Received-Date: Sat, 03 Mar 2018 06:56:51 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
index b045714..22c0023 100644
--- a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
+++ b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
@@ -17,7 +17,7 @@ PR = "r10"
 DEPENDS += "${QT_DEPENDS_SVG} ${QT_DEPENDS_SCRIPT}"
 
 BRANCH ?= "master"
-SRCREV = "3429dfc4333f11b9022e3aa6fd2850c5093777f9"
+SRCREV = "665bff9a7bc0dbf82f9d6a58ff2778c03fe04fd1"
 
 SRC_URI = "git://git.ti.com/apps/thermostat-demo.git;protocol=git;branch=${BRANCH}"
 
-- 
2.7.4


