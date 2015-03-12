Return-Path: <a0866934local@udb0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 1485352A78
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 12:56:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CCu5vF023629
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 07:56:05 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CCu37t007425
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 07:56:04 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Mar 2015 07:56:03 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CCu3iP025974;
	Thu, 12 Mar 2015 07:56:03 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YW2eh-0005k9-Jr;
	Thu, 12 Mar 2015 08:56:03 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 Mar 2015 08:55:57 -0400
Message-ID: <1426164957-22030-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426164957-22030-1-git-send-email-j-stiffler@ti.com>
References: <1426164957-22030-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] branding-processor-sdk: Add processor-sdk brand.
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
X-List-Received-Date: Thu, 12 Mar 2015 12:56:06 -0000
Content-Type: text/plain

* Set ARAGO_TISDK_IMAGE to "processor-sdk-linux-image"
* For now, use sitara-linux-ti-staging
* and remove wayland feature for ti33x and ti43x soc families.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../conf/distro/include/branding-processor-sdk.inc |   35 ++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-processor-sdk.inc

diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
new file mode 100644
index 0000000..5eab952
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
@@ -0,0 +1,35 @@
+ARAGO_TISDK_IMAGE = "processor-sdk-linux-image"
+
+# Remove wayland from ti33x and ti43x DISTRO_FEATURES.
+DIRSTO_FEATURES_ti33x = "${@oe_filter_out('DISTRO_FEATURES', 'wayland', d)}"
+DIRSTO_FEATURES_ti43x = "${@oe_filter_out('DISTRO_FEATURES', 'wayland', d)}"
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


