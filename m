Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11048C001B0
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 03:45:22 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.3703.1686714317173463617
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 20:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lPBUNnye;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: res.sapp@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6b29b9f5a94so4233068a34.2
        for <meta-arago@lists.yoctoproject.org>; Tue, 13 Jun 2023 20:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686714316; x=1689306316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ww0sienGkMKH4ApvrPSXmy+4sB+LHQYuCyomRGj/I6E=;
        b=lPBUNnye9rWASH80KldxQwAiM6Ql0uIha5TH/pFsGItgWSvoTV3r62CavsV5iaYh4a
         RunEino9eS40zjx6ysO1yxN8mfwHGGRmdX6ULQDn5yz5XigFgJ7WZMyZNTrvUuwc1p0i
         zpu2yHwiG8FK3YMon1OdKHLm+lSecLHQgE2u4nlwoeym+wHm4f1G5Nck6QCVaE2oVlJG
         ouQfTRsHxOiWE/r6K5Puj81fzdK06Km+QjVEOYYWPulxSF42EEk8NRZCiStGgAH3NPYi
         VShbFv1laoIDAZJ5IkChM6L4kD/U1ldpC9ow3tjmyD9gWZWmIPtcOj9I72S1R+8mhgYq
         mVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686714316; x=1689306316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ww0sienGkMKH4ApvrPSXmy+4sB+LHQYuCyomRGj/I6E=;
        b=IQcYDhOocmo5zbv1IcfTWbsF1YhrzqxLohfKR8ZmixjsMYvwOhIJxgSf2BI478mLB7
         6kQj16JVPFtZHc62BuBcXiIg4pFpN5OBjmplC4vvRU2EgX4NvrATHRuY275pKcrhkWM0
         X5HxivfXqPNfQuD61j5RYfj85gHHHRpnajutxl1ng7OuADYNxMw8/M/okmmJJCqMzrtX
         JPq59lmoZwNcCE60yJspz9orn//qlLYOlGxgD9OZJZATsm87lTmtxSAa/fqusrxKjlaE
         6sPjh7CSSK9I1oOaVPtM+OpY2fQbnJTksuC16WA719jdwWhfwwjEJ0NPjJLtONVYqlPt
         Zq8Q==
X-Gm-Message-State: AC+VfDww9m3D5P2Wy77iGLg150LGaldnXJOTLN2TxOOjoL/J9Y/9hhae
	oFzXPKCR2pXU5NkF+kOmOTQ=
X-Google-Smtp-Source: ACHHUZ6TwF65n76lQXD/1Hyzn0iKX6qodUKoVfj5etgUvL9cn2iCdDmOOqWBiYnswvmn2Ke4tqU1IA==
X-Received: by 2002:a05:6830:13c4:b0:6b2:cdba:5ea3 with SMTP id e4-20020a05683013c400b006b2cdba5ea3mr11238137otq.23.1686714316463;
        Tue, 13 Jun 2023 20:45:16 -0700 (PDT)
Received: from rig.lan ([104.182.101.14])
        by smtp.gmail.com with ESMTPSA id s9-20020a9d7589000000b006a662e9f074sm5367538otk.58.2023.06.13.20.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 20:45:16 -0700 (PDT)
From: Randolph Sapp <res.sapp@gmail.com>
To: denis@denix.org,
	reatmon@ti.com,
	afd@ti.com,
	nm@ti.com,
	rs@ti.com
Cc: meta-arago@lists.yoctoproject.org,
	Randolph Sapp <res.sapp@gmail.com>
Subject: [oe-layersetup][PATCHv2 06/16] oe-layertool-setup: only invoke read with -r
Date: Tue, 13 Jun 2023 22:44:57 -0500
Message-ID: <20230614034507.598391-7-res.sapp@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230614034507.598391-1-res.sapp@gmail.com>
References: <20230614034507.598391-1-res.sapp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 03:45:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14611

Shellcheck:
read without -r will mangle backslashes.

Signed-off-by: Randolph Sapp <res.sapp@gmail.com>
---
 oe-layertool-setup.sh | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index abe3f12..ee93ec9 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -246,7 +246,7 @@ parse_input_file() {
         rm "$oebase/tmp_motd"
     fi
 
-    while read line
+    while read -r line
     do
         # clean the parsing variables for each run
         name=""
@@ -434,7 +434,7 @@ $branches
 
 What branch would you like to checkout for the $name repository? 
 EOM
-        read input
+        read -r input
 
         # check that the branch is in the list of branches
         # NOTE: using a for loop here because I want exact matches.
@@ -517,7 +517,7 @@ You can either select one of these tags or specify your own commit SHA sum, or
 press ENTER to use the HEAD of the current branch.
 EOM
 
-    read input
+    read -r input
 
     if [ -z "$input" ]
     then
@@ -606,7 +606,7 @@ Please provide the list of layers you wish to use as a space separated list,
 or press enter to use all of the layers.
 EOM
 
-        read input
+        read -r input
     fi
 
     if [ -z "$input" ]
@@ -625,7 +625,7 @@ cat << EOM
 What is the name of the repository you want to configure?
 EOM
 
-    read name
+    read -r name
 }
 
 
@@ -637,7 +637,7 @@ cat << EOM
 What is the git clone uri of the $name repository?
 EOM
 
-    read uri
+    read -r uri
 }
 
 
@@ -681,7 +681,7 @@ Please select one of the above sample files to use as a template for
 configuring your build environment.
 EOM
 
-        read input
+        read -r input
 
         if [ -e "$input" ]
         then
@@ -736,7 +736,7 @@ Please select one of the above sample files to use as a template for
 configuring your build environment.
 EOM
 
-        read input
+        read -r input
 
         if [ -e "$input" ]
         then
@@ -1029,7 +1029,7 @@ then
         echo ""
         echo ""
         echo "Would you like to configure another repository? [y/n] "
-        read cont
+        read -r cont
     done
 fi
 
-- 
2.41.0


