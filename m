Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5321B529D9
	for <meta-arago@arago-project.org>;
	Tue,  3 Feb 2015 16:12:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t13GCtQr009407
	for <meta-arago@arago-project.org>; Tue, 3 Feb 2015 10:12:55 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t13GCsCi002729
	for <meta-arago@arago-project.org>; Tue, 3 Feb 2015 10:12:54 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Feb 2015 10:12:53 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t13GCqsG021492;	Tue, 3 Feb 2015 10:12:53 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t13GCnTL018196;	Tue, 3 Feb 2015 21:42:51 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Feb 2015 10:12:47 -0600
Message-ID: <1422979967-19687-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1422979967-19687-1-git-send-email-fcooper@ti.com>
References: <1422979967-19687-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/2] branding-amsdk: Add "local" branch name and commit message used by sourceipk
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
X-List-Received-Date: Tue, 03 Feb 2015 16:12:56 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/include/branding-amsdk.inc         |   24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-amsdk.inc b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
index 0884077..27d651d 100644
--- a/meta-arago-distro/conf/distro/include/branding-amsdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
@@ -4,3 +4,27 @@ QT_PROVIDER := "${@bb.utils.contains('SOC_FAMILY','omap-a15:dra7xx','qt5','qt4e'
 PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "sitara-linux-ti-staging"
 PREFERRED_PROVIDER_virtual/kernel_am437x-evm = "sitara-linux-ti-staging"
 PREFERRED_VERSION_sitara-linux-ti-staging = "3.14%"
+
+# To create newlines in the message \n is used and the slash must be escaped
+# to function properly
+
+SRCIPK_GIT_COMMIT_MESSAGE = "\
+Create local branch\\n\
+\\n\
+The below commit is used for this local branch and is the one used by this sdk:\\n\
+${SRCREV}."
+
+SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE ="${SRCIPK_GIT_COMMIT_MESSAGE}\\n\\n\
+To save on installer space only a portion of the commit history has been\\n\
+preserved. Also links to remote branches and tags do not exist in this\\n\
+copy of the repository. To fix this please run:\\n\
+git fetch\\n\
+\\n\
+This may take a couple of minutes but you will then have a full copy of\\n\
+the git repository.\\n"
+
+SRCIPK_CUSTOM_GIT_BRANCH_pn-sitara-linux-ti-staging = "amsdk-8.0"
+SRCIPK_CUSTOM_GIT_MESSAGE_pn-sitara-linux-ti-staging = "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
+
+SRCIPK_CUSTOM_GIT_BRANCH_pn-u-boot-ti-staging = "amsdk-8.0"
+SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-staging = "${SRCIPK_GIT_COMMIT_MESSAGE}"
-- 
1.7.9.5


