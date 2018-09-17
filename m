Return-Path: <jake@udc0866934>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id DF503529B6
	for <meta-arago@arago-project.org>;
	Mon, 17 Sep 2018 16:49:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8HGnkIK070133
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 11:49:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537202986;
	bh=W/by4N5w/vCxgEq4rgIQOJkKU2iHbi1nwLFLrbswpn4=;
	h=From:To:CC:Subject:Date;
	b=V2HqvlQ8F/PO9JBeReor885FoXf7B4fnhCo9QhQNKBQuF550KFTA8+KHUc5HDS+O0
	7JMffNMeC3vQfSSYV0IdyRQ9q7imia1NUbBKwrMKaQNUjOZw5yltWNbffFvwo7t1X6
	vSkYJNLgXgct+hsDz1jyIPpwcS6z6pfuKk+pETtA=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HGnkZY015826
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 11:49:46 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 17 Sep 2018 11:49:46 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 17 Sep 2018 11:49:46 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HGnkdZ032055;
	Mon, 17 Sep 2018 11:49:46 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1g1wiX-0005lI-Su; Mon, 17 Sep 2018 12:49:45 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 17 Sep 2018 12:49:24 -0400
Message-ID: <1537202964-22116-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-setup-scripts][PATCH] setup: add support for Ubuntu 18.04
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
X-List-Received-Date: Mon, 17 Sep 2018 16:49:55 -0000
Content-Type: text/plain

* Add support for Ubuntu 18.04 LTS (Bionix Beaver)

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-host-check.sh      | 4 ++--
 setup-package-install.sh | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/setup-host-check.sh b/setup-host-check.sh
index f1d63d0..45b4c71 100644
--- a/setup-host-check.sh
+++ b/setup-host-check.sh
@@ -39,8 +39,8 @@ echo "Verifying Linux host distribution"
 
 get_host_type host
 
-if [ "$host" != "lucid" -a "$host" != "precise" -a "$host" != "trusty" -a "$host" != "xenial" ]; then
-    echo "Unsupported host machine, only Ubuntu 12.04 LTS, Ubuntu 14.04 LTS, and Ubuntu 16.04 LTS are supported"
+if [ "$host" != "precise" -a "$host" != "trusty" -a "$host" != "xenial"  -a "$host" != "bionic" ]; then
+    echo "Unsupported host machine, only Ubuntu 12.04 LTS, Ubuntu 14.04 LTS, Ubuntu 16.04 LTS, and Ubuntu 18.04 LTS are supported"
     exit 1
 fi
 echo "Ubuntu 12.04 LTS, Ubuntu 14.04, or Ubuntu 14.04 LTS is being used, continuing.."
diff --git a/setup-package-install.sh b/setup-package-install.sh
index 77f235a..1e9fedb 100644
--- a/setup-package-install.sh
+++ b/setup-package-install.sh
@@ -58,12 +58,12 @@ entry_header
 
 packages_to_install="xinetd tftpd nfs-kernel-server minicom build-essential libncurses5-dev autoconf automake dos2unix screen lrzsz lzop"
 
-get_host_type host
+get_major_host_version host_major_version
 
 # Starting with Ubuntu 14.04 the package name for uboot-mkimage has changed
 # to u-boot-tools
 
-if [ "$host" = "trusty" -o "$host" = "xenial" ]; then
+if [ $host_major_version -ge 14 ]; then
     packages_to_install="$packages_to_install u-boot-tools"
 else
     packages_to_install="$packages_to_install uboot-mkimage"
-- 
1.9.1


