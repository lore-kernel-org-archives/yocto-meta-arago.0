Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 37AAE52BC8
	for <meta-arago@arago-project.org>;
	Fri, 16 Apr 2021 22:53:27 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13GMrquK128940;
	Fri, 16 Apr 2021 17:53:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618613632;
	bh=xL1cl8PISefinqJB4XWNLlAXVIZfAeL0IEDanm5Stes=;
	h=From:To:CC:Subject:Date;
	b=UeeC2B0hKwcU1kEjMDLwBApSxrz75pj25TlRGw7dbuPIY189C5KyyGElES/cYPqZN
	qW3xyMmOUe7Q8MLTVfvdzOUKYj7YkUnWhMfqhEllT9BxwYue+GAp4Fotqn2xRJ2lW1
	6/r1JE1F/7aGD7K0tsEXJxBRhZfli8n19nngifiE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13GMrq1M113180
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Apr 2021 17:53:52 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 16 Apr 2021 17:53:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 16 Apr 2021 17:53:52 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13GMrqN4091523;
	Fri, 16 Apr 2021 17:53:52 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 13GMrpxc073933;
	Fri, 16 Apr 2021 17:53:52 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Praneeth Bajjuri <praneeth@ti.com>,
	<denys@konsulko.com>
Date: Fri, 16 Apr 2021 17:53:50 -0500
Message-ID: <20210416225350.13107-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH v2] oe-layertool-setup: Let user change parallel build options
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
X-List-Received-Date: Fri, 16 Apr 2021 22:53:27 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Change BB_NUMBER_THREADS and PARALLEL_MAKE to weak assignment so that
these can be changed when building recipes. Useful on machines with
lower resources.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
v2: fixing project to *oe-layersetup* in subject.


Changing parallel build options is the only way I can build the complete image
on my system :).

Thanks,
Gowtham

 oe-layertool-setup.sh                           | 4 ++--
 sample-files/local-amsdk.conf.sample            | 4 ++--
 sample-files/local-arago.conf.sample            | 4 ++--
 sample-files/local-arago64.conf.sample          | 4 ++--
 sample-files/local-glsdk.conf.sample            | 4 ++--
 sample-files/local-poky.conf.sample             | 4 ++--
 sample-files/local-processor-sdk-64.conf.sample | 4 ++--
 sample-files/local-processor-sdk.conf.sample    | 4 ++--
 sample-files/local.conf.sample                  | 4 ++--
 9 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index aa16042..df1523f 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -753,8 +753,8 @@ EOM
     # set the number of threads
     threads=`cat /proc/cpuinfo | grep -c processor`
     tnum=`expr \( ${threads} + 1 \) \* 75 / 100`
-    sed -i "s/^PARALLEL_MAKE.*/PARALLEL_MAKE = \"-j ${tnum}\"/" $confdir/local.conf
-    sed -i "s/^BB_NUMBER_THREADS.*/BB_NUMBER_THREADS = \"${tnum}\"/" $confdir/local.conf
+    sed -i "s/^PARALLEL_MAKE.*/PARALLEL_MAKE ?= \"-j ${tnum}\"/" $confdir/local.conf
+    sed -i "s/^BB_NUMBER_THREADS.*/BB_NUMBER_THREADS ?= \"${tnum}\"/" $confdir/local.conf
 
     # Find if old DL_DIR was set
     if [ -e $confdir/local.conf.bak ]
diff --git a/sample-files/local-amsdk.conf.sample b/sample-files/local-amsdk.conf.sample
index 756286d..ac39788 100644
--- a/sample-files/local-amsdk.conf.sample
+++ b/sample-files/local-amsdk.conf.sample
@@ -135,12 +135,12 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-BB_NUMBER_THREADS = "1"
+BB_NUMBER_THREADS ?= "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-PARALLEL_MAKE = "-j 1"
+PARALLEL_MAKE ?= "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
diff --git a/sample-files/local-arago.conf.sample b/sample-files/local-arago.conf.sample
index 96dfaf9..62f0f92 100644
--- a/sample-files/local-arago.conf.sample
+++ b/sample-files/local-arago.conf.sample
@@ -138,12 +138,12 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-BB_NUMBER_THREADS = "1"
+BB_NUMBER_THREADS ?= "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-PARALLEL_MAKE = "-j 1"
+PARALLEL_MAKE ?= "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
diff --git a/sample-files/local-arago64.conf.sample b/sample-files/local-arago64.conf.sample
index f48db77..68f0bff 100644
--- a/sample-files/local-arago64.conf.sample
+++ b/sample-files/local-arago64.conf.sample
@@ -138,12 +138,12 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-BB_NUMBER_THREADS = "1"
+BB_NUMBER_THREADS ?= "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-PARALLEL_MAKE = "-j 1"
+PARALLEL_MAKE ?= "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
diff --git a/sample-files/local-glsdk.conf.sample b/sample-files/local-glsdk.conf.sample
index acd094f..189730a 100644
--- a/sample-files/local-glsdk.conf.sample
+++ b/sample-files/local-glsdk.conf.sample
@@ -135,12 +135,12 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-BB_NUMBER_THREADS = "1"
+BB_NUMBER_THREADS ?= "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-PARALLEL_MAKE = "-j 1"
+PARALLEL_MAKE ?= "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
diff --git a/sample-files/local-poky.conf.sample b/sample-files/local-poky.conf.sample
index 34b6b10..ba5d4c1 100644
--- a/sample-files/local-poky.conf.sample
+++ b/sample-files/local-poky.conf.sample
@@ -135,12 +135,12 @@ PATCHRESOLVE = "noop"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-BB_NUMBER_THREADS = "1"
+BB_NUMBER_THREADS ?= "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-PARALLEL_MAKE = "-j 1"
+PARALLEL_MAKE ?= "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
diff --git a/sample-files/local-processor-sdk-64.conf.sample b/sample-files/local-processor-sdk-64.conf.sample
index 75e59f1..9087be9 100644
--- a/sample-files/local-processor-sdk-64.conf.sample
+++ b/sample-files/local-processor-sdk-64.conf.sample
@@ -135,12 +135,12 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-BB_NUMBER_THREADS = "1"
+BB_NUMBER_THREADS ?= "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-PARALLEL_MAKE = "-j 1"
+PARALLEL_MAKE ?= "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
diff --git a/sample-files/local-processor-sdk.conf.sample b/sample-files/local-processor-sdk.conf.sample
index d5af93a..59b11e6 100644
--- a/sample-files/local-processor-sdk.conf.sample
+++ b/sample-files/local-processor-sdk.conf.sample
@@ -135,12 +135,12 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-BB_NUMBER_THREADS = "1"
+BB_NUMBER_THREADS ?= "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-PARALLEL_MAKE = "-j 1"
+PARALLEL_MAKE ?= "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
diff --git a/sample-files/local.conf.sample b/sample-files/local.conf.sample
index d971b97..e60bedc 100644
--- a/sample-files/local.conf.sample
+++ b/sample-files/local.conf.sample
@@ -135,12 +135,12 @@ PATCHRESOLVE = "noop"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-BB_NUMBER_THREADS = "1"
+BB_NUMBER_THREADS ?= "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-PARALLEL_MAKE = "-j 1"
+PARALLEL_MAKE ?= "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
-- 
2.31.1


