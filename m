Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 5611D529C0
	for <meta-arago@arago-project.org>;
	Thu, 19 Dec 2019 16:51:04 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBJGnQdn127334
	for <meta-arago@arago-project.org>; Thu, 19 Dec 2019 10:49:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576774166;
	bh=mLXsFZnsI0Iw+Bj61hQl6e5RrZQ5lOsIIXhYRXKHE8A=;
	h=From:To:CC:Subject:Date;
	b=mX1v0YkRyOq9I+uaCPF5UfHTInHXv/0mTmByO27LjM4zAxj+/+UoxlwBBvG6Mi7rx
	P03gOEl5oHz4Tf5G5lEoa9gf/YYlbD4mOWDiN9JJS+ks9iAC1KLZNpZz2sjxrW4pi1
	sc8PJTsrMi6Nv5BTRcBhV05n7PFQ6kiKC2TxdPsY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBJGnQ1D025810
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 19 Dec 2019 10:49:26 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 19 Dec 2019 10:49:25 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 19 Dec 2019 10:49:26 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBJGnPZu102518;
	Thu, 19 Dec 2019 10:49:25 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 19 Dec 2019 11:30:18 -0500
Message-ID: <1576773018-27634-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH] ti-tisdk-setup: only install create-ubifs if args are provided
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
X-List-Received-Date: Thu, 19 Dec 2019 16:51:04 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb         | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index 5ef9ef8..886a8b5 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Package containing scripts to setup the development host and targ
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
 
-PR = "r45"
+PR = "r46"
 
 BRANCH ?= "master"
 SRCREV = "42a8379fda829f34c374ddfca0242a479a84d454"
@@ -51,9 +51,15 @@ do_install () {
 
     install -m 0755 ${S}/${UBOOT_ENV} ${D}/bin/setup-uboot-env.sh
 
-    sed -i -e "s|__MKUBIFS_ARGS__|${MKUBIFS_ARGS}|" \
-           -e "s|__UBINIZE_ARGS__|${UBINIZE_ARGS}|" \
-              "${D}/bin/create-ubifs.sh"
+    if [ -z "${MKUBIFS_ARGS}" -o -z "${UBINIZE_ARGS}" ]
+    then
+        # UBIFS not supported
+        rm "${D}/bin/create-ubifs.sh"
+    else
+        sed -i -e "s|__MKUBIFS_ARGS__|${MKUBIFS_ARGS}|" \
+               -e "s|__UBINIZE_ARGS__|${UBINIZE_ARGS}|" \
+                  "${D}/bin/create-ubifs.sh"
+    fi
 }
 
 FILES_${PN} += "setup.sh"
-- 
2.7.4


