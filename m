Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 24CC352A71
	for <meta-arago@arago-project.org>;
	Tue, 15 Jul 2014 11:28:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6FBSiL8031568
	for <meta-arago@arago-project.org>; Tue, 15 Jul 2014 06:28:44 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6FBSi9K031018
	for <meta-arago@arago-project.org>; Tue, 15 Jul 2014 06:28:44 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 15 Jul 2014 06:28:44 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s6FBShKv003553;	Tue, 15 Jul 2014 06:28:43 -0500
Received: from sdit-build04.dal.design.ti.com (sdit-build04.dal.design.ti.com
	[10.247.66.55])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s6FBSbVT017717;	Tue, 15 Jul 2014 16:58:41 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 15 Jul 2014 06:28:34 -0500
Message-ID: <1405423715-21885-4-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1405423715-21885-1-git-send-email-Chase.Maupin@ti.com>
References: <1405423715-21885-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] arago: unset ASSUME_PROVIDED for git-native
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
X-List-Received-Date: Tue, 15 Jul 2014 11:28:45 -0000
Content-Type: text/plain

* To get maximum size reduction use the later version of git
  that is provided by git-native.  This reduces the kernel sources
  size from 1002MB to 762MB.
* Older versions of git work but they provide a depth of 1 for
  all branches and tags instead of just for the branch requested.
* This was tested with git version 1.7.9.5 and 1.9 as comparison
  points.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index b9af13f..1470f22 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -50,6 +50,11 @@ require conf/distro/include/arago-prefs.inc
 # Hack out sgx flag for now, as breaking on kernels >= 3.14
 MACHINE_FEATURES := "${@filter_out('sgx','${MACHINE_FEATURES}',d)}"
 
+# Remove the ASSUME_PROVIDED setting for git-native so that we can
+# use the latest version for the sourceipk which leads to a smaller
+# git history.
+ASSUME_PROVIDED := "${@filter_out('git-native','${ASSUME_PROVIDED}',d)}"
+
 # Allow branding on top of Arago Distro and Core TI-SDK
 # If ARAGO_BRAND is not set in local.conf, default to core
 ARAGO_BRAND ??= "core"
-- 
1.7.9.5


