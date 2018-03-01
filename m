Return-Path: <jake@udc0866934>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 2C115529F2
	for <meta-arago@arago-project.org>;
	Thu,  1 Mar 2018 14:56:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w21Etcqp008651
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 08:55:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519916138;
	bh=7+GXP0WhpiJEzdPMQrzM+ZN0HpgZ98HaQKnjAxolmPs=;
	h=From:To:CC:Subject:Date;
	b=GBrWafSx2QC5yWaKolyoBbmgKMlzL7eOWpcLbR9yzGxC7puJZK1o1TzFiVTZ9tpIp
	X/s76azVe5KAXp9UML82r2fSVsUkKOfkb5fMp4oWU3g35ia4B1o261O0ZEdUPvMVwk
	oCXY50puw2zCK/eV5Bn2DYM1p8GPAeKssVCUFlDw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21Etbtk016516
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 08:55:37 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 1 Mar 2018 08:55:37 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 1 Mar 2018 08:55:37 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21EtbeZ019077;
	Thu, 1 Mar 2018 08:55:37 -0600
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1erPcO-00021a-Oe; Thu, 01 Mar 2018 09:55:36 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 1 Mar 2018 09:55:31 -0500
Message-ID: <1519916131-7750-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-setup-scripts][PATCH] setup-package-install: select u-boot-tools for Ubuntu 16.04
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
X-List-Received-Date: Thu, 01 Mar 2018 14:56:15 -0000
Content-Type: text/plain

And fix potential issue in detection of required package status as
"dpkg-query -l" will list matching packages available on the system,
but not the intallation status as "dpkg-query -s" does.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-package-install.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/setup-package-install.sh b/setup-package-install.sh
index 1ef94f9..c5c134f 100644
--- a/setup-package-install.sh
+++ b/setup-package-install.sh
@@ -63,7 +63,7 @@ get_host_type host
 # Starting with Ubuntu 14.04 the package name for uboot-mkimage has changed
 # to u-boot-tools
 
-if [ "$host" = "trusty" ]; then
+if [ "$host" = "trusty" -o "$host" = "xenial" ]; then
     packages_to_install="$packages_to_install u-boot-tools"
 else
     packages_to_install="$packages_to_install uboot-mkimage"
@@ -74,7 +74,7 @@ cmd="sudo apt-get install "
 
 # Check and only install the missing packages
 for i in $packages_to_install; do
-	is_it_installed=`dpkg-query -l $i 2>/dev/null`
+	is_it_installed=`dpkg-query -s $i 2>/dev/null`
 	if [ "$?" -ne "0" ]; then
 		needs_installation=`echo $needs_installation`" "$i
 		new_cmd=`echo $cmd`" "$i
-- 
1.9.1


