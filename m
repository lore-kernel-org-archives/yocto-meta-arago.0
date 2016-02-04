Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5E4EA52A1C
	for <meta-arago@arago-project.org>;
	Thu,  4 Feb 2016 14:04:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u14E4Vkg022809
	for <meta-arago@arago-project.org>; Thu, 4 Feb 2016 08:04:31 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u14E4Vic021286
	for <meta-arago@arago-project.org>; Thu, 4 Feb 2016 08:04:31 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 4 Feb 2016 08:04:31 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u14E4V7g013165;
	Thu, 4 Feb 2016 08:04:31 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aRKWN-0000lP-8S; Thu, 04 Feb 2016 09:04:31 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 4 Feb 2016 09:04:28 -0500
Message-ID: <1454594668-2894-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454594668-2894-1-git-send-email-j-stiffler@ti.com>
References: <1454594668-2894-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] packagegroup-arago-tisdk-addons-sdk-target: k2hk-evm: Add aif2-lld-staticdev
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
X-List-Received-Date: Thu, 04 Feb 2016 14:04:32 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 6843427..cf279b5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r21"
+PR = "r22"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -100,6 +100,8 @@ EXTRA_LIBS_append_k2hk-evm = "\
 	hplib-staticdev \
 	nwal-lld-dev \
 	nwal-lld-staticdev \
+	aif2-lld-dev \
+	aif2-lld-staticdev \
 	"
 
 EXTRA_LIBS_append_k2e-evm = "\
-- 
1.9.1


