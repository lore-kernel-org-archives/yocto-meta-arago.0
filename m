Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 5C27152A8C
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 13:33:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t25DXujA014464
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 07:33:56 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25DXtOe018536
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 07:33:55 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Mar 2015 07:33:55 -0600
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t25DXtcK007678;	Thu, 5 Mar 2015 07:33:55 -0600
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YTVuV-0003pN-11;
	Thu, 05 Mar 2015 08:33:55 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 5 Mar 2015 08:33:29 -0500
Message-ID: <1425562410-19688-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425562410-19688-1-git-send-email-j-stiffler@ti.com>
References: <1425562410-19688-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [RFC 4/4] branding-processor-sdk: Add processor-sdk branding.
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
X-List-Received-Date: Thu, 05 Mar 2015 13:33:58 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../conf/distro/include/branding-processor-sdk.inc |   34 ++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-processor-sdk.inc

diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
new file mode 100644
index 0000000..d2e674e
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
@@ -0,0 +1,34 @@
+
+# Override QT Platform with eglfs
+ARAGO_QT_PLATFORM_ti33x = "eglfs"
+ARAGO_QT_PLATFORM_ti43x = "eglfs"
+
+PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "sitara-linux-ti-staging"
+PREFERRED_PROVIDER_virtual/kernel_am437x-evm = "sitara-linux-ti-staging"
+PREFERRED_VERSION_sitara-linux-ti-staging = "3.14%"
+
+# To create newlines in the message \n is used and the slash must be escaped
+# to function properly
+
+SRCIPK_GIT_COMMIT_MESSAGE = "\
+Create local branch\\n\
+\\n\
+The below commit is used for this local branch and is the one used by\\n\
+this sdk:\\n\
+${SRCREV}."
+
+SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE ="${SRCIPK_GIT_COMMIT_MESSAGE}\\n\\n\
+To reduce the size of the SDK installer only a portion of the git commit\\n\
+history has been preserved. Also links to remote branches and tags do\\n\
+not exist in this copy of the repository.\\n\
+To fix this please run the unshallow-repositories.sh\\n\
+script located in the sdk\'s bin directory\\n\
+\\n\
+The script may take several minutes but you will then have a full copy of\\n\
+the git repository including its entire git history.\\n"
+
+SRCIPK_CUSTOM_GIT_BRANCH_pn-sitara-linux-ti-staging = "processor-sdk-1.0"
+SRCIPK_CUSTOM_GIT_MESSAGE_pn-sitara-linux-ti-staging = "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
+
+SRCIPK_CUSTOM_GIT_BRANCH_pn-u-boot-ti-staging = "processor-sdk-1.0"
+SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-staging = "${SRCIPK_GIT_COMMIT_MESSAGE}"
-- 
1.7.9.5


