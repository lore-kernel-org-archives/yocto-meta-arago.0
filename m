Return-Path: <jake@udc0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 758B652A83
	for <meta-arago@arago-project.org>;
	Thu, 19 Nov 2015 17:32:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAJHWqFL016683
	for <meta-arago@arago-project.org>; Thu, 19 Nov 2015 11:32:52 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAJHWqtv013814
	for <meta-arago@arago-project.org>; Thu, 19 Nov 2015 11:32:52 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 19 Nov 2015 11:32:53 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAJHWq7k006375	for
	<meta-arago@arago-project.org>; Thu, 19 Nov 2015 11:32:52 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZzT4m-0006wi-AA	for meta-arago@arago-project.org;
	Thu, 19 Nov 2015 12:32:52 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 19 Nov 2015 12:32:11 -0500
Message-ID: <1447954331-26663-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1447954331-26663-1-git-send-email-j-stiffler@ti.com>
References: <1447954331-26663-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] packagegroup-arago-tisdk-addons: Add strongswan
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
X-List-Received-Date: Thu, 19 Nov 2015 17:32:54 -0000
Content-Type: text/plain

* Add for ti33x, ti43x, and omap-a15 soc families

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index bf9d61c..5ef0d72 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r34"
+PR = "r35"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -29,6 +29,7 @@ UTILS_append_ti33x = " mmc-utils \
                        canutils \
                        switch-config \
                        pru-icss \
+                       strongswan \
 "
 
 UTILS_append_ti43x = " mmc-utils \
@@ -36,6 +37,7 @@ UTILS_append_ti43x = " mmc-utils \
                        switch-config \
                        libdrm-omap \
                        pru-icss \
+                       strongswan \
 "
 
 UTILS_append_omap-a15 = " mmc-utils \
@@ -44,6 +46,7 @@ UTILS_append_omap-a15 = " mmc-utils \
                           libdrm-omap \
                           stream-openmp \
                           pru-icss \
+                          strongswan \
 "
 
 # Add PRU examples for am180x-evm devices
-- 
1.9.1


