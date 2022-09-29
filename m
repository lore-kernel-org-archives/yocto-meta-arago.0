Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4097EC433FE
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 13:01:26 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.10012.1664456476511207070
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 06:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=b8DFatyL;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28TD1Egl062350;
	Thu, 29 Sep 2022 08:01:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1664456474;
	bh=NHXAyZwgjRt18kDILj0kf+uIQz5+xgT84U1lTuKnlVU=;
	h=From:To:Subject:Date;
	b=b8DFatyL4U5gzcJBDFRGyVPffrObeLgBL9qfeZ82K+VEXo7N7o0zx7tJl7b4ou5t6
	 cBA/fFeu1gWjdTepgQ3arplqOwTAObS90z7mayBM7kyXxElvoWnfaHcNai5f17IvUq
	 9JfwynahcJ9y3BZqtjrUChjxY0qaXZZv2sojkhHA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28TD1Evw005217
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Sep 2022 08:01:14 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 29
 Sep 2022 08:01:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 29 Sep 2022 08:01:13 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28TD1DGY023579;
	Thu, 29 Sep 2022 08:01:13 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1odtA9-00063r-JB; Thu, 29 Sep 2022 08:01:13 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] oe-layertool-setup.sh: Remove all
 control over number of threads
Date: Thu, 29 Sep 2022 08:01:13 -0500
Message-ID: <20220929130113.23259-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 29 Sep 2022 13:01:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14049

It was pointed out that bitbake now picks good defaults for the
BB_NUMBER_THREADS and PARALLEL_MAKE variables, so we should remove
all control over those variables from the script level.  Also
comment out the default settings in the sample conf files so that
bitbake can be in control, but if the user needs to override them
they have the example of what to change.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 oe-layertool-setup.sh                              | 5 -----
 sample-files/denzil/local-arago-linaro.conf.sample | 9 +++++++--
 sample-files/local-amsdk.conf.sample               | 9 +++++++--
 sample-files/local-arago.conf.sample               | 9 +++++++--
 sample-files/local-arago64-v2.conf.sample          | 9 +++++++--
 sample-files/local-arago64.conf.sample             | 9 +++++++--
 sample-files/local-glsdk.conf.sample               | 9 +++++++--
 sample-files/local-poky-v2.conf.sample             | 9 +++++++--
 sample-files/local-poky.conf.sample                | 9 +++++++--
 sample-files/local-processor-sdk-64.conf.sample    | 9 +++++++--
 sample-files/local-processor-sdk.conf.sample       | 9 +++++++--
 sample-files/local-v2.conf.sample                  | 9 +++++++--
 sample-files/local.conf.sample                     | 9 +++++++--
 13 files changed, 84 insertions(+), 29 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index 1ea31c3..df1b675 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -768,11 +768,6 @@ EOM
     # First copy the template file
     cp -f $OECORELOCALCONFPATH $confdir/local.conf
 
-    # set the number of threads
-    threads=`cat /proc/cpuinfo | grep -c processor`
-    sed -i "s/^PARALLEL_MAKE.*/PARALLEL_MAKE ?= \"-j ${threads}\"/" $confdir/local.conf
-    sed -i "s/^BB_NUMBER_THREADS.*/BB_NUMBER_THREADS ?= \"${threads}\"/" $confdir/local.conf
-
     # Find if old DL_DIR was set
     if [ -e $confdir/local.conf.bak ]
     then
diff --git a/sample-files/denzil/local-arago-linaro.conf.sample b/sample-files/denzil/local-arago-linaro.conf.sample
index 24d14dc..0bfcc03 100644
--- a/sample-files/denzil/local-arago-linaro.conf.sample
+++ b/sample-files/denzil/local-arago-linaro.conf.sample
@@ -135,15 +135,20 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-BB_NUMBER_THREADS = "1"
+# BB_NUMBER_THREADS ?= "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-PARALLEL_MAKE = "-j 1"
+# PARALLEL_MAKE ?= "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
+#
+# NOTE: By default, bitbake will choose the number of processeors on your host
+# so you should not need to set this unless you are wanting to lower the number
+# allowed.
+#
 
 DISTRO   = "arago"
 TOOLCHAIN_BRAND = "linaro"
diff --git a/sample-files/local-amsdk.conf.sample b/sample-files/local-amsdk.conf.sample
index ac39788..f856fb3 100644
--- a/sample-files/local-amsdk.conf.sample
+++ b/sample-files/local-amsdk.conf.sample
@@ -135,15 +135,20 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-BB_NUMBER_THREADS ?= "1"
+# BB_NUMBER_THREADS ?= "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-PARALLEL_MAKE ?= "-j 1"
+# PARALLEL_MAKE ?= "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
+#
+# NOTE: By default, bitbake will choose the number of processeors on your host
+# so you should not need to set this unless you are wanting to lower the number
+# allowed.
+#
 
 DISTRO   = "arago"
 
diff --git a/sample-files/local-arago.conf.sample b/sample-files/local-arago.conf.sample
index 62f0f92..9a9fe51 100644
--- a/sample-files/local-arago.conf.sample
+++ b/sample-files/local-arago.conf.sample
@@ -138,15 +138,20 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-BB_NUMBER_THREADS ?= "1"
+# BB_NUMBER_THREADS ?= "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-PARALLEL_MAKE ?= "-j 1"
+# PARALLEL_MAKE ?= "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
+#
+# NOTE: By default, bitbake will choose the number of processeors on your host
+# so you should not need to set this unless you are wanting to lower the number
+# allowed.
+#
 
 DISTRO   = "arago"
 
diff --git a/sample-files/local-arago64-v2.conf.sample b/sample-files/local-arago64-v2.conf.sample
index 13585cb..c6b4ca4 100644
--- a/sample-files/local-arago64-v2.conf.sample
+++ b/sample-files/local-arago64-v2.conf.sample
@@ -135,15 +135,20 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-BB_NUMBER_THREADS ?= "1"
+# BB_NUMBER_THREADS ?= "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-PARALLEL_MAKE ?= "-j 1"
+# PARALLEL_MAKE ?= "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
+#
+# NOTE: By default, bitbake will choose the number of processeors on your host
+# so you should not need to set this unless you are wanting to lower the number
+# allowed.
+#
 
 DISTRO   = "arago"
 
diff --git a/sample-files/local-arago64.conf.sample b/sample-files/local-arago64.conf.sample
index 68f0bff..6d7af90 100644
--- a/sample-files/local-arago64.conf.sample
+++ b/sample-files/local-arago64.conf.sample
@@ -138,15 +138,20 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-BB_NUMBER_THREADS ?= "1"
+# BB_NUMBER_THREADS ?= "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-PARALLEL_MAKE ?= "-j 1"
+# PARALLEL_MAKE ?= "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
+#
+# NOTE: By default, bitbake will choose the number of processeors on your host
+# so you should not need to set this unless you are wanting to lower the number
+# allowed.
+#
 
 DISTRO   = "arago"
 
diff --git a/sample-files/local-glsdk.conf.sample b/sample-files/local-glsdk.conf.sample
index 189730a..3ed4150 100644
--- a/sample-files/local-glsdk.conf.sample
+++ b/sample-files/local-glsdk.conf.sample
@@ -135,15 +135,20 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-BB_NUMBER_THREADS ?= "1"
+# BB_NUMBER_THREADS ?= "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-PARALLEL_MAKE ?= "-j 1"
+# PARALLEL_MAKE ?= "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
+#
+# NOTE: By default, bitbake will choose the number of processeors on your host
+# so you should not need to set this unless you are wanting to lower the number
+# allowed.
+#
 
 DISTRO   = "arago"
 
diff --git a/sample-files/local-poky-v2.conf.sample b/sample-files/local-poky-v2.conf.sample
index 4bd0563..5a0cecc 100644
--- a/sample-files/local-poky-v2.conf.sample
+++ b/sample-files/local-poky-v2.conf.sample
@@ -132,15 +132,20 @@ PATCHRESOLVE = "noop"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-BB_NUMBER_THREADS ?= "1"
+# BB_NUMBER_THREADS ?= "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-PARALLEL_MAKE ?= "-j 1"
+# PARALLEL_MAKE ?= "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
+#
+# NOTE: By default, bitbake will choose the number of processeors on your host
+# so you should not need to set this unless you are wanting to lower the number
+# allowed.
+#
 
 DISTRO   = "poky"
 
diff --git a/sample-files/local-poky.conf.sample b/sample-files/local-poky.conf.sample
index ba5d4c1..1703f83 100644
--- a/sample-files/local-poky.conf.sample
+++ b/sample-files/local-poky.conf.sample
@@ -135,15 +135,20 @@ PATCHRESOLVE = "noop"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-BB_NUMBER_THREADS ?= "1"
+# BB_NUMBER_THREADS ?= "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-PARALLEL_MAKE ?= "-j 1"
+# PARALLEL_MAKE ?= "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
+#
+# NOTE: By default, bitbake will choose the number of processeors on your host
+# so you should not need to set this unless you are wanting to lower the number
+# allowed.
+#
 
 DISTRO   = "poky"
 
diff --git a/sample-files/local-processor-sdk-64.conf.sample b/sample-files/local-processor-sdk-64.conf.sample
index 9087be9..2bef530 100644
--- a/sample-files/local-processor-sdk-64.conf.sample
+++ b/sample-files/local-processor-sdk-64.conf.sample
@@ -135,15 +135,20 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-BB_NUMBER_THREADS ?= "1"
+# BB_NUMBER_THREADS ?= "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-PARALLEL_MAKE ?= "-j 1"
+# PARALLEL_MAKE ?= "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
+#
+# NOTE: By default, bitbake will choose the number of processeors on your host
+# so you should not need to set this unless you are wanting to lower the number
+# allowed.
+#
 
 DISTRO   = "arago"
 
diff --git a/sample-files/local-processor-sdk.conf.sample b/sample-files/local-processor-sdk.conf.sample
index 59b11e6..18e992c 100644
--- a/sample-files/local-processor-sdk.conf.sample
+++ b/sample-files/local-processor-sdk.conf.sample
@@ -135,15 +135,20 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-BB_NUMBER_THREADS ?= "1"
+# BB_NUMBER_THREADS ?= "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-PARALLEL_MAKE ?= "-j 1"
+# PARALLEL_MAKE ?= "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
+#
+# NOTE: By default, bitbake will choose the number of processeors on your host
+# so you should not need to set this unless you are wanting to lower the number
+# allowed.
+#
 
 DISTRO   = "arago"
 
diff --git a/sample-files/local-v2.conf.sample b/sample-files/local-v2.conf.sample
index e0df8f5..659cced 100644
--- a/sample-files/local-v2.conf.sample
+++ b/sample-files/local-v2.conf.sample
@@ -134,15 +134,20 @@ PATCHRESOLVE = "noop"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-BB_NUMBER_THREADS ?= "1"
+# BB_NUMBER_THREADS ?= "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-PARALLEL_MAKE ?= "-j 1"
+# PARALLEL_MAKE ?= "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
+#
+# NOTE: By default, bitbake will choose the number of processeors on your host
+# so you should not need to set this unless you are wanting to lower the number
+# allowed.
+#
 
 # Select a distribution from supported "arago", "angstrom-2010.x" or "poky"
 # By default, go with the "distroless" configuration, when not set
diff --git a/sample-files/local.conf.sample b/sample-files/local.conf.sample
index e60bedc..067c057 100644
--- a/sample-files/local.conf.sample
+++ b/sample-files/local.conf.sample
@@ -135,15 +135,20 @@ PATCHRESOLVE = "noop"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-BB_NUMBER_THREADS ?= "1"
+# BB_NUMBER_THREADS ?= "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-PARALLEL_MAKE ?= "-j 1"
+# PARALLEL_MAKE ?= "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
+#
+# NOTE: By default, bitbake will choose the number of processeors on your host
+# so you should not need to set this unless you are wanting to lower the number
+# allowed.
+#
 
 # Select a distribution from supported "arago", "angstrom-2010.x" or "poky"
 # By default, go with the "distroless" configuration, when not set
-- 
2.17.1


