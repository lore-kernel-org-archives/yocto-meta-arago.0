Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 1F00D52A7E
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 19:46:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CJkWsd001052
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 14:46:32 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CJkVdo001458
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 14:46:31 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Mar 2015 14:46:30 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t2CJkUjh007965;	Thu, 12 Mar 2015 14:46:30 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YW93t-0002wF-Lu;
	Thu, 12 Mar 2015 15:46:29 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 Mar 2015 15:46:22 -0400
Message-ID: <1426189582-16812-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426189582-16812-1-git-send-email-j-stiffler@ti.com>
References: <1426189582-16812-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 4/4] branding-processor-sdk: Add processor-sdk brand.
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
X-List-Received-Date: Thu, 12 Mar 2015 19:46:33 -0000
Content-Type: text/plain

* Set ARAGO_TISDK_IMAGE to "processor-sdk-linux-image"
* For now, use sitara-linux-ti-staging
* and remove wayland feature for ti33x and ti43x soc families.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2: Use DISTRO_FEATURES_remove_<machine> instead of oe_filter_out.

 .../conf/distro/include/branding-processor-sdk.inc |   35 ++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-processor-sdk.inc

diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
new file mode 100644
index 0000000..d277aac
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
@@ -0,0 +1,35 @@
+ARAGO_TISDK_IMAGE = "processor-sdk-linux-image"
+
+# Remove wayland from ti33x and ti43x DISTRO_FEATURES.
+DISTRO_FEATURES_remove_ti33x = "wayland"
+DISTRO_FEATURES_remove_ti43x = "wayland"
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


