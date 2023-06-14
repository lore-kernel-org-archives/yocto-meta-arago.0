Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04384EB64DC
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 03:45:22 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.3794.1686714319609294502
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 20:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=kUG/WT+b;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: res.sapp@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6b28eefb49cso3875847a34.0
        for <meta-arago@lists.yoctoproject.org>; Tue, 13 Jun 2023 20:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686714319; x=1689306319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXYb+HiT5KMH/MULc1TKk1+9jPNEXBy7fwLlLnDmO60=;
        b=kUG/WT+bhPk/4uK8H2dY0wyFEcgz8HhoYpFPY17yaWSqrLBCYbugOVhLsf8hp85E0T
         QVDIFKzep6v2CVCqwICc7cy8OIrLYB6oM1qSUF401eL5NQVkqb0HknyOnM7sKssF9Ayq
         0dmiiKcbCwVt6TVrxkdp38LWm34c8y0SkP/+G2BojzavXIGLya5BQt4qPYHcpt+cfZGw
         nRC5WPfk6BHMdSj+EJ8U2Bl1No25j6C1SMnEdL3rfF0gXqeKvNelCYavOzA574d5/axm
         I2yQtWkduPd7LBbgx/Za5BfDgxtVpcHUUh6GFadEh/KCKRHSqxo1Yg2rqs5Vy23nhq8z
         kUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686714319; x=1689306319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXYb+HiT5KMH/MULc1TKk1+9jPNEXBy7fwLlLnDmO60=;
        b=kkGwp41rO+W5EOvsISPFXdtCyE6n3buZkky++c2rzzA02z5TBgihRsbjvs2fBq5EuE
         xP+lqHYGQaykCp3BE41Z16H4R9qDq51UeiDohAR5/XJCmCX5KSgyBw5msH3UHig6aIOV
         xRQBSXyFyiJ8pgihIvSKIqvSXt9bzZvfTWms3DBN7b3K/n/ZO1KL+w1RVXOGixMa75Bn
         O6GKpLJrLDqlUsvcUqhbrAPM6Tflc6SYkGE/HS6iKnPglsP2jyhjlGnGRS5yvjeAlHiX
         5RqBiuZRdR2jJKA3dOv8+1QUrwsc3DL9G7mhMtFoBQM26XB4ph+tLmRbSv4R56mWP47c
         Rv4g==
X-Gm-Message-State: AC+VfDzSSdjbrnUvYKbOLKpD/8fwUPus4HL+6mx0zLzdfHOMEKMPaZw+
	P6r7+I9avOBzEd2bjbXsi4M=
X-Google-Smtp-Source: ACHHUZ6ya4mTFLp+vB7VMua4bl6Vo1Odt7zgLfy5PbB5udma0gQ7cBEJYBOSBb0BfH3kRLsim7nzCA==
X-Received: by 2002:a05:6830:11cd:b0:6af:9d30:4ba8 with SMTP id v13-20020a05683011cd00b006af9d304ba8mr11387339otq.26.1686714318917;
        Tue, 13 Jun 2023 20:45:18 -0700 (PDT)
Received: from rig.lan ([104.182.101.14])
        by smtp.gmail.com with ESMTPSA id s9-20020a9d7589000000b006a662e9f074sm5367538otk.58.2023.06.13.20.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 20:45:18 -0700 (PDT)
From: Randolph Sapp <res.sapp@gmail.com>
To: denis@denix.org,
	reatmon@ti.com,
	afd@ti.com,
	nm@ti.com,
	rs@ti.com
Cc: meta-arago@lists.yoctoproject.org,
	Randolph Sapp <res.sapp@gmail.com>
Subject: [oe-layersetup][PATCHv2 10/16] oe-layertool-setup: use subshell execution with redirect
Date: Tue, 13 Jun 2023 22:45:01 -0500
Message-ID: <20230614034507.598391-11-res.sapp@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230614034507.598391-1-res.sapp@gmail.com>
References: <20230614034507.598391-1-res.sapp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 03:45:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14615

Shellcheck:
Consider using { cmd1; cmd2; } >> file instead of individual redirects.

Signed-off-by: Randolph Sapp <res.sapp@gmail.com>
---
 oe-layertool-setup.sh | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index b824114..8e29f9a 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -818,16 +818,18 @@ EOM
 
     if [ -e "$oebase/tmp_append_local.conf" ]
     then
-        echo "" >> "$confdir/local.conf"
-        echo "#====================================================================" >> "$confdir/local.conf"
-        echo "# LOCALCONF: settings from config file:" >> "$confdir/local.conf"
-        echo "#   $inputfile" >> "$confdir/local.conf"
-        echo "#" >> "$confdir/local.conf"
-        echo "# Do not remove." >> "$confdir/local.conf"
-        echo "#--------------------------------------------------------------------" >> "$confdir/local.conf"
-        cat "$oebase/tmp_append_local.conf" >> "$confdir/local.conf"
-        echo "#====================================================================" >> "$confdir/local.conf"
-        echo "" >>  "$confdir/local.conf"
+        {
+            echo "";
+            echo "#====================================================================";
+            echo "# LOCALCONF: settings from config file:";
+            echo "#   $inputfile";
+            echo "#";
+            echo "# Do not remove.";
+            echo "#--------------------------------------------------------------------";
+            cat "$oebase/tmp_append_local.conf";
+            echo "#====================================================================";
+            echo "";
+        } >> "$confdir/local.conf"
         rm "$oebase/tmp_append_local.conf"
     fi
 }
-- 
2.41.0


