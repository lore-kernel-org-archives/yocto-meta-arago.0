Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 04EB05208B
	for <meta-arago@arago-project.org>;
	Thu, 28 Jan 2016 13:31:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0SDVJLU020645
	for <meta-arago@arago-project.org>; Thu, 28 Jan 2016 07:31:19 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0SDVJ3k001151
	for <meta-arago@arago-project.org>; Thu, 28 Jan 2016 07:31:19 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 Jan 2016 07:31:19 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0SDVJDv017532;
	Thu, 28 Jan 2016 07:31:19 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aOmfO-000877-RO; Thu, 28 Jan 2016 08:31:18 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 Jan 2016 08:31:05 -0500
Message-ID: <1453987865-31150-6-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453987865-31150-1-git-send-email-j-stiffler@ti.com>
References: <1453987865-31150-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 6/6] tisdk-server-rootfs-image: Add unnecessary dev packages to BAD_RECOMMENDATIONS
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
X-List-Received-Date: Thu, 28 Jan 2016 13:31:20 -0000
Content-Type: text/plain

* Including the dev packages causes its build dependencies to become
  recommendataions.
* These packages are recommended because they are build dependencies
  for the opencl package.
* These packages are not necessary for developing opencl applications
  therefore list them as BAD_RECOMMENDATIONS.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* Update commit message with the reason for the BAD_RECOMMENDATIONS
* Update ti-llvm3.3-dev to ti-llvm3.6-dev

 meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
index 3928948..74b6a01 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
@@ -13,4 +13,11 @@ IMAGE_INSTALL += "\
     gdb \
 "
 
+BAD_RECOMMENDATIONS += " \
+    ti-llvm3.6-dev \
+    opencl-monitor-dev \
+    libulm-dev \
+    gdbserver-c6x-dev \
+"
+
 export IMAGE_BASENAME = "tisdk-server-rootfs-image"
-- 
1.9.1


