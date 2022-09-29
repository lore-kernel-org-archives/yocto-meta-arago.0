Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D68DC433F5
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 16:32:57 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.12835.1664469172477450656
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 09:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TUSqVWAH;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28TGWlRH016193;
	Thu, 29 Sep 2022 11:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1664469167;
	bh=0FPRpftxXcOVwe3oaSobEvqLh3Uo6jtOo26JEbwojcc=;
	h=From:To:Subject:Date;
	b=TUSqVWAHMNo+hP1I1U+2uqhvw/Gg3YxQBLkUSwJK8C0k4xqVzDKvhLsKv6AykWY5M
	 U9IXuIz8qeyyk+AUMxezWpLnotTujKGffhEKRtDreSWyLBSS5b8G3LfGQ65UNFP7X9
	 7H93iXJyEi50B48Zo9rHWsOTO19ZAyhx1MpK4Z64=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28TGWlLR016947
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Sep 2022 11:32:47 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 29
 Sep 2022 11:32:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 29 Sep 2022 11:32:46 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28TGWka8020698;
	Thu, 29 Sep 2022 11:32:46 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1odwSs-00050p-Ps; Thu, 29 Sep 2022 11:32:46 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] sample-files: Remove
 ENABLE_BINARY_LOCALE_GENERATION
Date: Thu, 29 Sep 2022 11:32:46 -0500
Message-ID: <20220929163246.19227-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 29 Sep 2022 16:32:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14050

The option ENABLE_BINARY_LOCALE_GENERATION is no longer needed.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 sample-files/denzil/local-arago-linaro.conf.sample | 3 ---
 sample-files/local-amsdk.conf.sample               | 3 ---
 sample-files/local-arago.conf.sample               | 3 ---
 sample-files/local-arago64-v2.conf.sample          | 3 ---
 sample-files/local-arago64.conf.sample             | 3 ---
 sample-files/local-glsdk.conf.sample               | 3 ---
 sample-files/local-poky-v2.conf.sample             | 3 ---
 sample-files/local-poky.conf.sample                | 3 ---
 sample-files/local-processor-sdk-64.conf.sample    | 3 ---
 sample-files/local-processor-sdk.conf.sample       | 3 ---
 sample-files/local-v2.conf.sample                  | 3 ---
 sample-files/local.conf.sample                     | 3 ---
 12 files changed, 36 deletions(-)

diff --git a/sample-files/denzil/local-arago-linaro.conf.sample b/sample-files/denzil/local-arago-linaro.conf.sample
index 0bfcc03..ba542c9 100644
--- a/sample-files/denzil/local-arago-linaro.conf.sample
+++ b/sample-files/denzil/local-arago-linaro.conf.sample
@@ -119,9 +119,6 @@ USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 # By default disable interactive patch resolution (tasks will just fail instead):
 PATCHRESOLVE = "noop"
 
-# Qemu 0.12.x is giving too much problems recently (2010.05), so disable it for users
-ENABLE_BINARY_LOCALE_GENERATION = "0"
-
 # By default the machine configuration file sets the IMAGE_FSTYPES.  But if you
 # would like to add additional file system types you can uncomment the
 # following line and add the additional IMAGE_FSTYPES you want created
diff --git a/sample-files/local-amsdk.conf.sample b/sample-files/local-amsdk.conf.sample
index f856fb3..cadd9fe 100644
--- a/sample-files/local-amsdk.conf.sample
+++ b/sample-files/local-amsdk.conf.sample
@@ -119,9 +119,6 @@ USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 # By default disable interactive patch resolution (tasks will just fail instead):
 PATCHRESOLVE = "noop"
 
-# Qemu 0.12.x is giving too much problems recently (2010.05), so disable it for users
-ENABLE_BINARY_LOCALE_GENERATION = "0"
-
 # By default the machine configuration file sets the IMAGE_FSTYPES.  But if you
 # would like to add additional file system types you can uncomment the
 # following line and add the additional IMAGE_FSTYPES you want created
diff --git a/sample-files/local-arago.conf.sample b/sample-files/local-arago.conf.sample
index 9a9fe51..f455f60 100644
--- a/sample-files/local-arago.conf.sample
+++ b/sample-files/local-arago.conf.sample
@@ -122,9 +122,6 @@ USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 # By default disable interactive patch resolution (tasks will just fail instead):
 PATCHRESOLVE = "noop"
 
-# Qemu 0.12.x is giving too much problems recently (2010.05), so disable it for users
-ENABLE_BINARY_LOCALE_GENERATION = "0"
-
 # By default the machine configuration file sets the IMAGE_FSTYPES.  But if you
 # would like to add additional file system types you can uncomment the
 # following line and add the additional IMAGE_FSTYPES you want created
diff --git a/sample-files/local-arago64-v2.conf.sample b/sample-files/local-arago64-v2.conf.sample
index c6b4ca4..848e30a 100644
--- a/sample-files/local-arago64-v2.conf.sample
+++ b/sample-files/local-arago64-v2.conf.sample
@@ -119,9 +119,6 @@ USER_CLASSES ?= "buildstats"
 # By default disable interactive patch resolution (tasks will just fail instead):
 PATCHRESOLVE = "noop"
 
-# Qemu 0.12.x is giving too much problems recently (2010.05), so disable it for users
-ENABLE_BINARY_LOCALE_GENERATION = "0"
-
 # By default the machine configuration file sets the IMAGE_FSTYPES.  But if you
 # would like to add additional file system types you can uncomment the
 # following line and add the additional IMAGE_FSTYPES you want created
diff --git a/sample-files/local-arago64.conf.sample b/sample-files/local-arago64.conf.sample
index 6d7af90..6b77547 100644
--- a/sample-files/local-arago64.conf.sample
+++ b/sample-files/local-arago64.conf.sample
@@ -122,9 +122,6 @@ USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 # By default disable interactive patch resolution (tasks will just fail instead):
 PATCHRESOLVE = "noop"
 
-# Qemu 0.12.x is giving too much problems recently (2010.05), so disable it for users
-ENABLE_BINARY_LOCALE_GENERATION = "0"
-
 # By default the machine configuration file sets the IMAGE_FSTYPES.  But if you
 # would like to add additional file system types you can uncomment the
 # following line and add the additional IMAGE_FSTYPES you want created
diff --git a/sample-files/local-glsdk.conf.sample b/sample-files/local-glsdk.conf.sample
index 3ed4150..0f0a96b 100644
--- a/sample-files/local-glsdk.conf.sample
+++ b/sample-files/local-glsdk.conf.sample
@@ -119,9 +119,6 @@ USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 # By default disable interactive patch resolution (tasks will just fail instead):
 PATCHRESOLVE = "noop"
 
-# Qemu 0.12.x is giving too much problems recently (2010.05), so disable it for users
-ENABLE_BINARY_LOCALE_GENERATION = "0"
-
 # By default the machine configuration file sets the IMAGE_FSTYPES.  But if you
 # would like to add additional file system types you can uncomment the
 # following line and add the additional IMAGE_FSTYPES you want created
diff --git a/sample-files/local-poky-v2.conf.sample b/sample-files/local-poky-v2.conf.sample
index 5a0cecc..9de7704 100644
--- a/sample-files/local-poky-v2.conf.sample
+++ b/sample-files/local-poky-v2.conf.sample
@@ -116,9 +116,6 @@ USER_CLASSES ?= "buildstats"
 # By default disable interactive patch resolution (tasks will just fail instead):
 PATCHRESOLVE = "noop"
 
-# Qemu 0.12.x is giving too much problems recently (2010.05), so disable it for users
-#ENABLE_BINARY_LOCALE_GENERATION = "0"
-
 # By default the machine configuration file sets the IMAGE_FSTYPES.  But if you
 # would like to add additional file system types you can uncomment the
 # following line and add the additional IMAGE_FSTYPES you want created
diff --git a/sample-files/local-poky.conf.sample b/sample-files/local-poky.conf.sample
index 1703f83..b2884f2 100644
--- a/sample-files/local-poky.conf.sample
+++ b/sample-files/local-poky.conf.sample
@@ -119,9 +119,6 @@ USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 # By default disable interactive patch resolution (tasks will just fail instead):
 PATCHRESOLVE = "noop"
 
-# Qemu 0.12.x is giving too much problems recently (2010.05), so disable it for users
-#ENABLE_BINARY_LOCALE_GENERATION = "0"
-
 # By default the machine configuration file sets the IMAGE_FSTYPES.  But if you
 # would like to add additional file system types you can uncomment the
 # following line and add the additional IMAGE_FSTYPES you want created
diff --git a/sample-files/local-processor-sdk-64.conf.sample b/sample-files/local-processor-sdk-64.conf.sample
index 2bef530..a65d869 100644
--- a/sample-files/local-processor-sdk-64.conf.sample
+++ b/sample-files/local-processor-sdk-64.conf.sample
@@ -119,9 +119,6 @@ USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 # By default disable interactive patch resolution (tasks will just fail instead):
 PATCHRESOLVE = "noop"
 
-# Qemu 0.12.x is giving too much problems recently (2010.05), so disable it for users
-ENABLE_BINARY_LOCALE_GENERATION = "0"
-
 # By default the machine configuration file sets the IMAGE_FSTYPES.  But if you
 # would like to add additional file system types you can uncomment the
 # following line and add the additional IMAGE_FSTYPES you want created
diff --git a/sample-files/local-processor-sdk.conf.sample b/sample-files/local-processor-sdk.conf.sample
index 18e992c..2e4e9ba 100644
--- a/sample-files/local-processor-sdk.conf.sample
+++ b/sample-files/local-processor-sdk.conf.sample
@@ -119,9 +119,6 @@ USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 # By default disable interactive patch resolution (tasks will just fail instead):
 PATCHRESOLVE = "noop"
 
-# Qemu 0.12.x is giving too much problems recently (2010.05), so disable it for users
-ENABLE_BINARY_LOCALE_GENERATION = "0"
-
 # By default the machine configuration file sets the IMAGE_FSTYPES.  But if you
 # would like to add additional file system types you can uncomment the
 # following line and add the additional IMAGE_FSTYPES you want created
diff --git a/sample-files/local-v2.conf.sample b/sample-files/local-v2.conf.sample
index 659cced..67c4a46 100644
--- a/sample-files/local-v2.conf.sample
+++ b/sample-files/local-v2.conf.sample
@@ -118,9 +118,6 @@ USER_CLASSES ?= "buildstats image-prelink"
 # By default disable interactive patch resolution (tasks will just fail instead):
 PATCHRESOLVE = "noop"
 
-# Qemu 0.12.x is giving too much problems recently (2010.05), so disable it for users
-#ENABLE_BINARY_LOCALE_GENERATION = "0"
-
 # By default the machine configuration file sets the IMAGE_FSTYPES.  But if you
 # would like to add additional file system types you can uncomment the
 # following line and add the additional IMAGE_FSTYPES you want created
diff --git a/sample-files/local.conf.sample b/sample-files/local.conf.sample
index 067c057..22a6030 100644
--- a/sample-files/local.conf.sample
+++ b/sample-files/local.conf.sample
@@ -119,9 +119,6 @@ USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 # By default disable interactive patch resolution (tasks will just fail instead):
 PATCHRESOLVE = "noop"
 
-# Qemu 0.12.x is giving too much problems recently (2010.05), so disable it for users
-#ENABLE_BINARY_LOCALE_GENERATION = "0"
-
 # By default the machine configuration file sets the IMAGE_FSTYPES.  But if you
 # would like to add additional file system types you can uncomment the
 # following line and add the additional IMAGE_FSTYPES you want created
-- 
2.17.1


