Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5F11952A8C
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 18:31:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t25IVqJf005717
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 12:31:52 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25IVpBC005339
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 12:31:51 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Mar 2015 12:31:51 -0600
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t25IVpki023854;	Thu, 5 Mar 2015 12:31:51 -0600
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YTaYp-0005CA-3c;
	Thu, 05 Mar 2015 13:31:51 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 5 Mar 2015 13:31:43 -0500
Message-ID: <1425580304-19919-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425580304-19919-1-git-send-email-j-stiffler@ti.com>
References: <1425580304-19919-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [RFC v2 4/4] branding-processor-sdk: Add processor-sdk brand.
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
X-List-Received-Date: Thu, 05 Mar 2015 18:31:54 -0000
Content-Type: text/plain

* For now, use sitara-linux-ti-staging
* and disable wayland support for ti33x and ti43x soc families.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../conf/distro/include/branding-processor-sdk.inc |   34 ++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-processor-sdk.inc

diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
new file mode 100644
index 0000000..39f0bf0
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
@@ -0,0 +1,34 @@
+
+# Override QT Platform with eglfs
+WAYLAND_SUPPORT_ti33x = "0"
+WAYLAND_SUPPORT_ti43x = "0"
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


