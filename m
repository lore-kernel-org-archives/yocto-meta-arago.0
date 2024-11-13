Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E74DD637CA
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 21:06:14 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.22743.1731531971027561837
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 13:06:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=G+dH0ppG;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4ADL694T124226;
	Wed, 13 Nov 2024 15:06:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731531969;
	bh=iPQ5jQ8/aEQXPprA9vg3P4EDnBcSYzvzZk7+fQdOopU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=G+dH0ppG3up8KwFrx1yHaq/p4NNVaPh3jT4jsq3epeDeNCdhQ99ph4QB5sBp1+9HM
	 K9Pab+9ZjOPfKyKw05GwlLCTgISE7jPGAVM4jynyAa4Jm48DNvhQWQzIgXIV8l42qv
	 fPpoeC703noZsYKLsmpsN/OrGALoAyXhUiEgjTxo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4ADL69KC027943
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 13 Nov 2024 15:06:09 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 13
 Nov 2024 15:06:09 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 13 Nov 2024 15:06:09 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ADL69lH115977;
	Wed, 13 Nov 2024 15:06:09 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tBKYz-0000m0-3W; Wed, 13 Nov 2024 15:06:09 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH 5/5] src: Add the v3 src files
Date: Wed, 13 Nov 2024 15:06:08 -0600
Message-ID: <20241113210608.2907-5-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241113210608.2907-1-reatmon@ti.com>
References: <20241113210608.2907-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Nov 2024 21:06:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15606

To go along with the previous commit [1], we need to add the correct
files in the src/ dir and generate the correct configs.

[1] https://git.ti.com/cgit/arago-project/oe-layersetup/commit/?id=edad40504eb8bf2d6486e7a9d12075fd77960638

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../local.conf.sample                         | 26 +++++++++--------
 .../arago-master-config/local.conf.sample     | 26 +++++++++--------
 .../local.conf.sample                         | 26 +++++++++--------
 .../arago-master-wip-config/local.conf.sample | 26 +++++++++--------
 .../local.conf.sample                         | 10 ++++---
 .../poky-master-config/local.conf.sample      | 10 ++++---
 .../poky-master-wip-config/local.conf.sample  | 10 ++++---
 kas/arago-master-chromium-config.yml          |  2 +-
 kas/arago-master-config.yml                   |  2 +-
 kas/arago-master-next-config.yml              |  2 +-
 kas/arago-master-wip-config.yml               |  2 +-
 kas/distroless-master-config.yml              |  2 +-
 kas/poky-master-config.yml                    |  2 +-
 kas/poky-master-wip-config.yml                |  2 +-
 ...-v2.conf.yml => local-arago64-v3.conf.yml} | 26 +++++++++--------
 ...oky-v2.conf.yml => local-poky-v3.conf.yml} | 10 ++++---
 .../{local-v2.conf.yml => local-v3.conf.yml}  | 10 ++++---
 src/configs/arago-master-chromium-config.xml  |  2 +-
 src/configs/arago-master-config.xml           |  2 +-
 src/configs/arago-master-next-config.xml      |  2 +-
 src/configs/arago-master-wip-config.xml       |  2 +-
 src/configs/distroless-master-config.xml      |  2 +-
 src/configs/poky-master-config.xml            |  2 +-
 src/configs/poky-master-wip-config.xml        |  2 +-
 ...-v2.conf.xml => local-arago64-v3.conf.xml} | 28 ++++++++++---------
 ...oky-v2.conf.xml => local-poky-v3.conf.xml} | 12 ++++----
 .../{local-v2.conf.xml => local-v3.conf.xml}  | 12 ++++----
 27 files changed, 143 insertions(+), 117 deletions(-)
 copy kas/templates/{local-arago64-v2.conf.yml => local-arago64-v3.conf.yml} (86%)
 copy kas/templates/{local-poky-v2.conf.yml => local-poky-v3.conf.yml} (94%)
 copy kas/templates/{local-v2.conf.yml => local-v3.conf.yml} (94%)
 copy src/templates/{local-arago64-v2.conf.xml => local-arago64-v3.conf.xml} (86%)
 copy src/templates/{local-poky-v2.conf.xml => local-poky-v3.conf.xml} (94%)
 copy src/templates/{local-v2.conf.xml => local-v3.conf.xml} (94%)

diff --git a/conf/templates/arago-master-chromium-config/local.conf.sample b/conf/templates/arago-master-chromium-config/local.conf.sample
index 3b0d65d..b067597 100644
--- a/conf/templates/arago-master-chromium-config/local.conf.sample
+++ b/conf/templates/arago-master-chromium-config/local.conf.sample
@@ -90,20 +90,22 @@ SDKMACHINE ?= "x86_64"
 # The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to the generated 
 # images. Some of these options are added to certain image types automatically. The
 # variable can contain the following options:
-#  "dbg-pkgs"       - add -dbg packages for all installed packages
-#                     (adds symbol information for debugging/profiling)
-#  "dev-pkgs"       - add -dev packages for all installed packages
-#                     (useful if you want to develop against libs in the image)
-#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
-#  "tools-debug"    - add debugging tools (gdb, strace)
-#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
-#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
-#  "debug-tweaks"   - make an image suitable for development
-#                     e.g. ssh root access has a blank password
+#  "dbg-pkgs"             - add -dbg packages for all installed packages
+#                           (adds symbol information for debugging/profiling)
+#  "dev-pkgs"             - add -dev packages for all installed packages
+#                           (useful if you want to develop against libs in the image)
+#  "tools-sdk"            - add development tools (gcc, make, pkgconfig etc.)
+#  "tools-debug"          - add debugging tools (gdb, strace)
+#  "tools-profile"        - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
+#  "tools-testapps"       - add useful testing tools (ts_print, aplay, arecord etc.)
+#  "empty-root-password"  - the root user has no password set
+#  "allow-empty-password" - users can have an empty password
+#  "allow-root-login"     - the root user can login
+#  "post-install-logging" - log the output of postinstall scriptlets
 # There are other application targets that can be used here too, see
 # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
-# We default to enabling the debugging tweaks.
-EXTRA_IMAGE_FEATURES = "debug-tweaks"
+# We default to enabling the empty root login settings for debugging/testing.
+EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login post-install-logging"
 
 #
 # Additional image features
diff --git a/conf/templates/arago-master-config/local.conf.sample b/conf/templates/arago-master-config/local.conf.sample
index 3b0d65d..b067597 100644
--- a/conf/templates/arago-master-config/local.conf.sample
+++ b/conf/templates/arago-master-config/local.conf.sample
@@ -90,20 +90,22 @@ SDKMACHINE ?= "x86_64"
 # The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to the generated 
 # images. Some of these options are added to certain image types automatically. The
 # variable can contain the following options:
-#  "dbg-pkgs"       - add -dbg packages for all installed packages
-#                     (adds symbol information for debugging/profiling)
-#  "dev-pkgs"       - add -dev packages for all installed packages
-#                     (useful if you want to develop against libs in the image)
-#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
-#  "tools-debug"    - add debugging tools (gdb, strace)
-#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
-#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
-#  "debug-tweaks"   - make an image suitable for development
-#                     e.g. ssh root access has a blank password
+#  "dbg-pkgs"             - add -dbg packages for all installed packages
+#                           (adds symbol information for debugging/profiling)
+#  "dev-pkgs"             - add -dev packages for all installed packages
+#                           (useful if you want to develop against libs in the image)
+#  "tools-sdk"            - add development tools (gcc, make, pkgconfig etc.)
+#  "tools-debug"          - add debugging tools (gdb, strace)
+#  "tools-profile"        - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
+#  "tools-testapps"       - add useful testing tools (ts_print, aplay, arecord etc.)
+#  "empty-root-password"  - the root user has no password set
+#  "allow-empty-password" - users can have an empty password
+#  "allow-root-login"     - the root user can login
+#  "post-install-logging" - log the output of postinstall scriptlets
 # There are other application targets that can be used here too, see
 # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
-# We default to enabling the debugging tweaks.
-EXTRA_IMAGE_FEATURES = "debug-tweaks"
+# We default to enabling the empty root login settings for debugging/testing.
+EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login post-install-logging"
 
 #
 # Additional image features
diff --git a/conf/templates/arago-master-next-config/local.conf.sample b/conf/templates/arago-master-next-config/local.conf.sample
index 965cfb4..95db98a 100644
--- a/conf/templates/arago-master-next-config/local.conf.sample
+++ b/conf/templates/arago-master-next-config/local.conf.sample
@@ -90,20 +90,22 @@ SDKMACHINE ?= "x86_64"
 # The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to the generated 
 # images. Some of these options are added to certain image types automatically. The
 # variable can contain the following options:
-#  "dbg-pkgs"       - add -dbg packages for all installed packages
-#                     (adds symbol information for debugging/profiling)
-#  "dev-pkgs"       - add -dev packages for all installed packages
-#                     (useful if you want to develop against libs in the image)
-#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
-#  "tools-debug"    - add debugging tools (gdb, strace)
-#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
-#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
-#  "debug-tweaks"   - make an image suitable for development
-#                     e.g. ssh root access has a blank password
+#  "dbg-pkgs"             - add -dbg packages for all installed packages
+#                           (adds symbol information for debugging/profiling)
+#  "dev-pkgs"             - add -dev packages for all installed packages
+#                           (useful if you want to develop against libs in the image)
+#  "tools-sdk"            - add development tools (gcc, make, pkgconfig etc.)
+#  "tools-debug"          - add debugging tools (gdb, strace)
+#  "tools-profile"        - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
+#  "tools-testapps"       - add useful testing tools (ts_print, aplay, arecord etc.)
+#  "empty-root-password"  - the root user has no password set
+#  "allow-empty-password" - users can have an empty password
+#  "allow-root-login"     - the root user can login
+#  "post-install-logging" - log the output of postinstall scriptlets
 # There are other application targets that can be used here too, see
 # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
-# We default to enabling the debugging tweaks.
-EXTRA_IMAGE_FEATURES = "debug-tweaks"
+# We default to enabling the empty root login settings for debugging/testing.
+EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login post-install-logging"
 
 #
 # Additional image features
diff --git a/conf/templates/arago-master-wip-config/local.conf.sample b/conf/templates/arago-master-wip-config/local.conf.sample
index 3b0d65d..b067597 100644
--- a/conf/templates/arago-master-wip-config/local.conf.sample
+++ b/conf/templates/arago-master-wip-config/local.conf.sample
@@ -90,20 +90,22 @@ SDKMACHINE ?= "x86_64"
 # The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to the generated 
 # images. Some of these options are added to certain image types automatically. The
 # variable can contain the following options:
-#  "dbg-pkgs"       - add -dbg packages for all installed packages
-#                     (adds symbol information for debugging/profiling)
-#  "dev-pkgs"       - add -dev packages for all installed packages
-#                     (useful if you want to develop against libs in the image)
-#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
-#  "tools-debug"    - add debugging tools (gdb, strace)
-#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
-#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
-#  "debug-tweaks"   - make an image suitable for development
-#                     e.g. ssh root access has a blank password
+#  "dbg-pkgs"             - add -dbg packages for all installed packages
+#                           (adds symbol information for debugging/profiling)
+#  "dev-pkgs"             - add -dev packages for all installed packages
+#                           (useful if you want to develop against libs in the image)
+#  "tools-sdk"            - add development tools (gcc, make, pkgconfig etc.)
+#  "tools-debug"          - add debugging tools (gdb, strace)
+#  "tools-profile"        - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
+#  "tools-testapps"       - add useful testing tools (ts_print, aplay, arecord etc.)
+#  "empty-root-password"  - the root user has no password set
+#  "allow-empty-password" - users can have an empty password
+#  "allow-root-login"     - the root user can login
+#  "post-install-logging" - log the output of postinstall scriptlets
 # There are other application targets that can be used here too, see
 # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
-# We default to enabling the debugging tweaks.
-EXTRA_IMAGE_FEATURES = "debug-tweaks"
+# We default to enabling the empty root login settings for debugging/testing.
+EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login post-install-logging"
 
 #
 # Additional image features
diff --git a/conf/templates/distroless-master-config/local.conf.sample b/conf/templates/distroless-master-config/local.conf.sample
index fe47cd1..bad99cd 100644
--- a/conf/templates/distroless-master-config/local.conf.sample
+++ b/conf/templates/distroless-master-config/local.conf.sample
@@ -95,12 +95,14 @@ SDKMACHINE ?= "i686"
 #  "tools-debug"    - add debugging tools (gdb, strace)
 #  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
 #  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
-#  "debug-tweaks"   - make an image suitable for development
-#                     e.g. ssh root access has a blank password
+#  "empty-root-password"  - the root user has no password set
+#  "allow-empty-password" - users can have an empty password
+#  "allow-root-login"     - the root user can login
+#  "post-install-logging" - log the output of postinstall scriptlets
 # There are other application targets that can be used here too, see
 # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
-# We default to enabling the debugging tweaks.
-EXTRA_IMAGE_FEATURES = "debug-tweaks"
+# We default to enabling the empty root login settings for debugging/testing.
+EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login post-install-logging"
 
 #
 # Additional image features
diff --git a/conf/templates/poky-master-config/local.conf.sample b/conf/templates/poky-master-config/local.conf.sample
index ed592ee..443a004 100644
--- a/conf/templates/poky-master-config/local.conf.sample
+++ b/conf/templates/poky-master-config/local.conf.sample
@@ -95,12 +95,14 @@ SDKMACHINE ?= "x86_64"
 #  "tools-debug"    - add debugging tools (gdb, strace)
 #  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
 #  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
-#  "debug-tweaks"   - make an image suitable for development
-#                     e.g. ssh root access has a blank password
+#  "empty-root-password"  - the root user has no password set
+#  "allow-empty-password" - users can have an empty password
+#  "allow-root-login"     - the root user can login
+#  "post-install-logging" - log the output of postinstall scriptlets
 # There are other application targets that can be used here too, see
 # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
-# We default to enabling the debugging tweaks.
-EXTRA_IMAGE_FEATURES = "debug-tweaks"
+# We default to enabling the empty root login settings for debugging/testing.
+EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login post-install-logging"
 
 #
 # Additional image features
diff --git a/conf/templates/poky-master-wip-config/local.conf.sample b/conf/templates/poky-master-wip-config/local.conf.sample
index ed592ee..443a004 100644
--- a/conf/templates/poky-master-wip-config/local.conf.sample
+++ b/conf/templates/poky-master-wip-config/local.conf.sample
@@ -95,12 +95,14 @@ SDKMACHINE ?= "x86_64"
 #  "tools-debug"    - add debugging tools (gdb, strace)
 #  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
 #  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
-#  "debug-tweaks"   - make an image suitable for development
-#                     e.g. ssh root access has a blank password
+#  "empty-root-password"  - the root user has no password set
+#  "allow-empty-password" - users can have an empty password
+#  "allow-root-login"     - the root user can login
+#  "post-install-logging" - log the output of postinstall scriptlets
 # There are other application targets that can be used here too, see
 # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
-# We default to enabling the debugging tweaks.
-EXTRA_IMAGE_FEATURES = "debug-tweaks"
+# We default to enabling the empty root login settings for debugging/testing.
+EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login post-install-logging"
 
 #
 # Additional image features
diff --git a/kas/arago-master-chromium-config.yml b/kas/arago-master-chromium-config.yml
index e7f411c..cc03637 100644
--- a/kas/arago-master-chromium-config.yml
+++ b/kas/arago-master-chromium-config.yml
@@ -2,7 +2,7 @@ header:
   version: 17
   includes:
     - ./templates/bblayers.conf.yml
-    - ./templates/local-arago64-v2.conf.yml
+    - ./templates/local-arago64-v3.conf.yml
 
 target: tisdk-default-image
 
diff --git a/kas/arago-master-config.yml b/kas/arago-master-config.yml
index 1817ee7..30b0833 100644
--- a/kas/arago-master-config.yml
+++ b/kas/arago-master-config.yml
@@ -2,7 +2,7 @@ header:
   version: 17
   includes:
     - ./templates/bblayers.conf.yml
-    - ./templates/local-arago64-v2.conf.yml
+    - ./templates/local-arago64-v3.conf.yml
 
 target: tisdk-default-image
 
diff --git a/kas/arago-master-next-config.yml b/kas/arago-master-next-config.yml
index 3ad83e1..69b90b6 100644
--- a/kas/arago-master-next-config.yml
+++ b/kas/arago-master-next-config.yml
@@ -2,7 +2,7 @@ header:
   version: 17
   includes:
     - ./templates/bblayers.conf.yml
-    - ./templates/local-arago64-v2.conf.yml
+    - ./templates/local-arago64-v3.conf.yml
 
 target: tisdk-default-image
 
diff --git a/kas/arago-master-wip-config.yml b/kas/arago-master-wip-config.yml
index 84008d7..4b2e145 100644
--- a/kas/arago-master-wip-config.yml
+++ b/kas/arago-master-wip-config.yml
@@ -2,7 +2,7 @@ header:
   version: 17
   includes:
     - ./templates/bblayers.conf.yml
-    - ./templates/local-arago64-v2.conf.yml
+    - ./templates/local-arago64-v3.conf.yml
 
 target: tisdk-default-image
 
diff --git a/kas/distroless-master-config.yml b/kas/distroless-master-config.yml
index e40f9d4..08f8260 100644
--- a/kas/distroless-master-config.yml
+++ b/kas/distroless-master-config.yml
@@ -2,7 +2,7 @@ header:
   version: 17
   includes:
     - ./templates/bblayers.conf.yml
-    - ./templates/local-v2.conf.yml
+    - ./templates/local-v3.conf.yml
 
 target: 
 
diff --git a/kas/poky-master-config.yml b/kas/poky-master-config.yml
index bde7002..362d3b6 100644
--- a/kas/poky-master-config.yml
+++ b/kas/poky-master-config.yml
@@ -2,7 +2,7 @@ header:
   version: 17
   includes:
     - ./templates/bblayers.conf.yml
-    - ./templates/local-poky-v2.conf.yml
+    - ./templates/local-poky-v3.conf.yml
 
 target: core_image_minimal
 
diff --git a/kas/poky-master-wip-config.yml b/kas/poky-master-wip-config.yml
index b606545..2690aee 100644
--- a/kas/poky-master-wip-config.yml
+++ b/kas/poky-master-wip-config.yml
@@ -2,7 +2,7 @@ header:
   version: 17
   includes:
     - ./templates/bblayers.conf.yml
-    - ./templates/local-poky-v2.conf.yml
+    - ./templates/local-poky-v3.conf.yml
 
 target: core_image_minimal
 
diff --git a/kas/templates/local-arago64-v2.conf.yml b/kas/templates/local-arago64-v3.conf.yml
similarity index 86%
copy from kas/templates/local-arago64-v2.conf.yml
copy to kas/templates/local-arago64-v3.conf.yml
index 188ed23..76a64f2 100644
--- a/kas/templates/local-arago64-v2.conf.yml
+++ b/kas/templates/local-arago64-v3.conf.yml
@@ -95,20 +95,22 @@ local_conf_header:
     # The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to the generated 
     # images. Some of these options are added to certain image types automatically. The
     # variable can contain the following options:
-    #  "dbg-pkgs"       - add -dbg packages for all installed packages
-    #                     (adds symbol information for debugging/profiling)
-    #  "dev-pkgs"       - add -dev packages for all installed packages
-    #                     (useful if you want to develop against libs in the image)
-    #  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
-    #  "tools-debug"    - add debugging tools (gdb, strace)
-    #  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
-    #  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
-    #  "debug-tweaks"   - make an image suitable for development
-    #                     e.g. ssh root access has a blank password
+    #  "dbg-pkgs"             - add -dbg packages for all installed packages
+    #                           (adds symbol information for debugging/profiling)
+    #  "dev-pkgs"             - add -dev packages for all installed packages
+    #                           (useful if you want to develop against libs in the image)
+    #  "tools-sdk"            - add development tools (gcc, make, pkgconfig etc.)
+    #  "tools-debug"          - add debugging tools (gdb, strace)
+    #  "tools-profile"        - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
+    #  "tools-testapps"       - add useful testing tools (ts_print, aplay, arecord etc.)
+    #  "empty-root-password"  - the root user has no password set
+    #  "allow-empty-password" - users can have an empty password
+    #  "allow-root-login"     - the root user can login
+    #  "post-install-logging" - log the output of postinstall scriptlets
     # There are other application targets that can be used here too, see
     # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
-    # We default to enabling the debugging tweaks.
-    EXTRA_IMAGE_FEATURES = "debug-tweaks"
+    # We default to enabling the empty root login settings for debugging/testing.
+    EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login post-install-logging"
     
     #
     # Additional image features
diff --git a/kas/templates/local-poky-v2.conf.yml b/kas/templates/local-poky-v3.conf.yml
similarity index 94%
copy from kas/templates/local-poky-v2.conf.yml
copy to kas/templates/local-poky-v3.conf.yml
index 8177dc2..2cc0f6b 100644
--- a/kas/templates/local-poky-v2.conf.yml
+++ b/kas/templates/local-poky-v3.conf.yml
@@ -100,12 +100,14 @@ local_conf_header:
     #  "tools-debug"    - add debugging tools (gdb, strace)
     #  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
     #  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
-    #  "debug-tweaks"   - make an image suitable for development
-    #                     e.g. ssh root access has a blank password
+    #  "empty-root-password"  - the root user has no password set
+    #  "allow-empty-password" - users can have an empty password
+    #  "allow-root-login"     - the root user can login
+    #  "post-install-logging" - log the output of postinstall scriptlets
     # There are other application targets that can be used here too, see
     # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
-    # We default to enabling the debugging tweaks.
-    EXTRA_IMAGE_FEATURES = "debug-tweaks"
+    # We default to enabling the empty root login settings for debugging/testing.
+    EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login post-install-logging"
     
     #
     # Additional image features
diff --git a/kas/templates/local-v2.conf.yml b/kas/templates/local-v3.conf.yml
similarity index 94%
copy from kas/templates/local-v2.conf.yml
copy to kas/templates/local-v3.conf.yml
index 9e65340..acb9465 100644
--- a/kas/templates/local-v2.conf.yml
+++ b/kas/templates/local-v3.conf.yml
@@ -100,12 +100,14 @@ local_conf_header:
     #  "tools-debug"    - add debugging tools (gdb, strace)
     #  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
     #  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
-    #  "debug-tweaks"   - make an image suitable for development
-    #                     e.g. ssh root access has a blank password
+    #  "empty-root-password"  - the root user has no password set
+    #  "allow-empty-password" - users can have an empty password
+    #  "allow-root-login"     - the root user can login
+    #  "post-install-logging" - log the output of postinstall scriptlets
     # There are other application targets that can be used here too, see
     # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
-    # We default to enabling the debugging tweaks.
-    EXTRA_IMAGE_FEATURES = "debug-tweaks"
+    # We default to enabling the empty root login settings for debugging/testing.
+    EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login post-install-logging"
     
     #
     # Additional image features
diff --git a/src/configs/arago-master-chromium-config.xml b/src/configs/arago-master-chromium-config.xml
index 30b33f8..922b6c3 100644
--- a/src/configs/arago-master-chromium-config.xml
+++ b/src/configs/arago-master-chromium-config.xml
@@ -4,7 +4,7 @@
 
     <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
-    <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-arago64-v3.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
     <bitbake url='https://git.openembedded.org/bitbake' branch='master' commit='HEAD'/>
 
diff --git a/src/configs/arago-master-config.xml b/src/configs/arago-master-config.xml
index 5fb0386..2a845e2 100644
--- a/src/configs/arago-master-config.xml
+++ b/src/configs/arago-master-config.xml
@@ -4,7 +4,7 @@
 
     <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
-    <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-arago64-v3.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
     <bitbake url='https://git.openembedded.org/bitbake' branch='master' commit='HEAD'/>
 
diff --git a/src/configs/arago-master-next-config.xml b/src/configs/arago-master-next-config.xml
index 7b5bb52..ca6fe53 100644
--- a/src/configs/arago-master-next-config.xml
+++ b/src/configs/arago-master-next-config.xml
@@ -5,7 +5,7 @@
     <xi:include href='../common/motd_cicd.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
-    <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-arago64-v3.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
     <bitbake url='https://git.openembedded.org/bitbake' branch='master' commit='HEAD'/>
 
diff --git a/src/configs/arago-master-wip-config.xml b/src/configs/arago-master-wip-config.xml
index 8b92ec3..378e023 100644
--- a/src/configs/arago-master-wip-config.xml
+++ b/src/configs/arago-master-wip-config.xml
@@ -4,7 +4,7 @@
 
     <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
-    <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-arago64-v3.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
     <bitbake url='https://git.openembedded.org/bitbake' branch='master' commit='HEAD'/>
 
diff --git a/src/configs/distroless-master-config.xml b/src/configs/distroless-master-config.xml
index 11b09c4..14b0d4e 100644
--- a/src/configs/distroless-master-config.xml
+++ b/src/configs/distroless-master-config.xml
@@ -3,7 +3,7 @@
     <description>Distroless reference for master</description>
 
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
-    <xi:include href='../templates/local-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-v3.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
     <bitbake url='https://git.openembedded.org/bitbake' branch='master' commit='HEAD'/>
 
diff --git a/src/configs/poky-master-config.xml b/src/configs/poky-master-config.xml
index 3baf414..b1fdfb8 100644
--- a/src/configs/poky-master-config.xml
+++ b/src/configs/poky-master-config.xml
@@ -4,7 +4,7 @@
 
     <xi:include href='../common/targets_poky.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
-    <xi:include href='../templates/local-poky-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-poky-v3.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
     <bitbake url='https://git.openembedded.org/bitbake' branch='master' commit='HEAD'/>
 
diff --git a/src/configs/poky-master-wip-config.xml b/src/configs/poky-master-wip-config.xml
index 11c0e6a..b128614 100644
--- a/src/configs/poky-master-wip-config.xml
+++ b/src/configs/poky-master-wip-config.xml
@@ -4,7 +4,7 @@
 
     <xi:include href='../common/targets_poky.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
-    <xi:include href='../templates/local-poky-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-poky-v3.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
     <bitbake url='https://git.openembedded.org/bitbake' branch='master' commit='HEAD'/>
 
diff --git a/src/templates/local-arago64-v2.conf.xml b/src/templates/local-arago64-v3.conf.xml
similarity index 86%
copy from src/templates/local-arago64-v2.conf.xml
copy to src/templates/local-arago64-v3.conf.xml
index 70148ff..32a15b2 100644
--- a/src/templates/local-arago64-v2.conf.xml
+++ b/src/templates/local-arago64-v3.conf.xml
@@ -1,4 +1,4 @@
-<local-conf-template name='local-arago64-v2.conf'>
+<local-conf-template name='local-arago64-v3.conf'>
     <line># CONF_VERSION is increased each time build/conf/ changes incompatibly</line>
     <line>CONF_VERSION = "2"</line>
     <line></line>
@@ -91,20 +91,22 @@
     <line># The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to the generated </line>
     <line># images. Some of these options are added to certain image types automatically. The</line>
     <line># variable can contain the following options:</line>
-    <line>#  "dbg-pkgs"       - add -dbg packages for all installed packages</line>
-    <line>#                     (adds symbol information for debugging/profiling)</line>
-    <line>#  "dev-pkgs"       - add -dev packages for all installed packages</line>
-    <line>#                     (useful if you want to develop against libs in the image)</line>
-    <line>#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)</line>
-    <line>#  "tools-debug"    - add debugging tools (gdb, strace)</line>
-    <line>#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))</line>
-    <line>#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)</line>
-    <line>#  "debug-tweaks"   - make an image suitable for development</line>
-    <line>#                     e.g. ssh root access has a blank password</line>
+    <line>#  "dbg-pkgs"             - add -dbg packages for all installed packages</line>
+    <line>#                           (adds symbol information for debugging/profiling)</line>
+    <line>#  "dev-pkgs"             - add -dev packages for all installed packages</line>
+    <line>#                           (useful if you want to develop against libs in the image)</line>
+    <line>#  "tools-sdk"            - add development tools (gcc, make, pkgconfig etc.)</line>
+    <line>#  "tools-debug"          - add debugging tools (gdb, strace)</line>
+    <line>#  "tools-profile"        - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))</line>
+    <line>#  "tools-testapps"       - add useful testing tools (ts_print, aplay, arecord etc.)</line>
+    <line>#  "empty-root-password"  - the root user has no password set</line>
+    <line>#  "allow-empty-password" - users can have an empty password</line>
+    <line>#  "allow-root-login"     - the root user can login</line>
+    <line>#  "post-install-logging" - log the output of postinstall scriptlets</line>
     <line># There are other application targets that can be used here too, see</line>
     <line># meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.</line>
-    <line># We default to enabling the debugging tweaks.</line>
-    <line>EXTRA_IMAGE_FEATURES = "debug-tweaks"</line>
+    <line># We default to enabling the empty root login settings for debugging/testing.</line>
+    <line>EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login post-install-logging"</line>
     <line></line>
     <line>#</line>
     <line># Additional image features</line>
diff --git a/src/templates/local-poky-v2.conf.xml b/src/templates/local-poky-v3.conf.xml
similarity index 94%
copy from src/templates/local-poky-v2.conf.xml
copy to src/templates/local-poky-v3.conf.xml
index 8a7fde1..8432c15 100644
--- a/src/templates/local-poky-v2.conf.xml
+++ b/src/templates/local-poky-v3.conf.xml
@@ -1,4 +1,4 @@
-<local-conf-template name='local-poky-v2.conf'>
+<local-conf-template name='local-poky-v3.conf'>
     <line># CONF_VERSION is increased each time build/conf/ changes incompatibly</line>
     <line>CONF_VERSION = "2"</line>
     <line></line>
@@ -96,12 +96,14 @@
     <line>#  "tools-debug"    - add debugging tools (gdb, strace)</line>
     <line>#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))</line>
     <line>#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)</line>
-    <line>#  "debug-tweaks"   - make an image suitable for development</line>
-    <line>#                     e.g. ssh root access has a blank password</line>
+    <line>#  "empty-root-password"  - the root user has no password set</line>
+    <line>#  "allow-empty-password" - users can have an empty password</line>
+    <line>#  "allow-root-login"     - the root user can login</line>
+    <line>#  "post-install-logging" - log the output of postinstall scriptlets</line>
     <line># There are other application targets that can be used here too, see</line>
     <line># meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.</line>
-    <line># We default to enabling the debugging tweaks.</line>
-    <line>EXTRA_IMAGE_FEATURES = "debug-tweaks"</line>
+    <line># We default to enabling the empty root login settings for debugging/testing.</line>
+    <line>EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login post-install-logging"</line>
     <line></line>
     <line>#</line>
     <line># Additional image features</line>
diff --git a/src/templates/local-v2.conf.xml b/src/templates/local-v3.conf.xml
similarity index 94%
copy from src/templates/local-v2.conf.xml
copy to src/templates/local-v3.conf.xml
index ef3027b..6627659 100644
--- a/src/templates/local-v2.conf.xml
+++ b/src/templates/local-v3.conf.xml
@@ -1,4 +1,4 @@
-<local-conf-template name='local-v2.conf'>
+<local-conf-template name='local-v3.conf'>
     <line># CONF_VERSION is increased each time build/conf/ changes incompatibly</line>
     <line>CONF_VERSION = "2"</line>
     <line></line>
@@ -96,12 +96,14 @@
     <line>#  "tools-debug"    - add debugging tools (gdb, strace)</line>
     <line>#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))</line>
     <line>#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)</line>
-    <line>#  "debug-tweaks"   - make an image suitable for development</line>
-    <line>#                     e.g. ssh root access has a blank password</line>
+    <line>#  "empty-root-password"  - the root user has no password set</line>
+    <line>#  "allow-empty-password" - users can have an empty password</line>
+    <line>#  "allow-root-login"     - the root user can login</line>
+    <line>#  "post-install-logging" - log the output of postinstall scriptlets</line>
     <line># There are other application targets that can be used here too, see</line>
     <line># meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.</line>
-    <line># We default to enabling the debugging tweaks.</line>
-    <line>EXTRA_IMAGE_FEATURES = "debug-tweaks"</line>
+    <line># We default to enabling the empty root login settings for debugging/testing.</line>
+    <line>EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login post-install-logging"</line>
     <line></line>
     <line>#</line>
     <line># Additional image features</line>
-- 
2.17.1


