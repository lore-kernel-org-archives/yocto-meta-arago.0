Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB75EB64DD
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 03:45:22 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.3790.1686714315795627347
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 20:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=aoL0NGHp;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: res.sapp@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1a28de15c8aso4798736fac.2
        for <meta-arago@lists.yoctoproject.org>; Tue, 13 Jun 2023 20:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686714315; x=1689306315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pprTbdaLxuH1f76QesohSY17vxyOnJYejTbQz33yJg=;
        b=aoL0NGHpFWLcbzJCHm7925UBjznMopdKWIG+6Tx4QXw2aWiEchgU8EQ44cbBYnB1Dh
         Od5jLzLLAWZ2kyBqZ+1r+QCmLHqvAahSc1rVjxCnqwQcG9jCTUnXT5yEdt7mbtUVLorx
         zsZLKK0f9wTxBFg92zwGESMzBOWVZ4wpKQTCdK+jo6Yhdf2YjFJE+0K+e4LEpFGxRqDh
         OvKkuqqsxwrvOhcrf08+dxaOZ4rOZzty8/ukD3WPOVDVGojyWuO+XGjo2JehAa4KWblf
         9h+5faEMa7Hf0yU3Q9O3F+noVVw4kTBdpywOhoWYk8ia6RoPQjhtj2Fw4W0wW7zT8LPp
         nQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686714315; x=1689306315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pprTbdaLxuH1f76QesohSY17vxyOnJYejTbQz33yJg=;
        b=YQQzeJrioEyBbXK2czk5YTYSR+vnHmz22k3HH5izCKg7ER6H63IWjCZvP5kpL4/xHp
         xugPZIlXtuwypcjjfyBv5NzutQ+R1cn2OdlddW0dx6HANFssyUzwe0Sh3V1kzFO9h+Fr
         OS3MsVIFxGR5sj6B9QnPVBHCw3m1IgdSQi7hEJTheVmq+0VEOyXEEtwu3MeLVP+lC74t
         iBgbhqJIaIQ1mZRcHG25tQbUWbq0AUHJyBRQ8EAr2y79nBO6VH9kW6clABxNcX+LVFUo
         WHnaQpL7rY1bhIDFdMF6IUNZwqY1RC9TlAvL02DPThBivmoOPhxyVMUpZsYfSRw3EynU
         kWFg==
X-Gm-Message-State: AC+VfDyx5QvE1cLHlvf9dorBP6x3J+C+7+vt4lsCqF/zTkaaO+rP8znU
	P9/l6pxo/JV+PliGyVNbAQY=
X-Google-Smtp-Source: ACHHUZ57A2HoXirk3jpdhpinfoM6e64GBbQmwDrsxvrDux/RoOUaBXuXsCMl/rNW4pD1ahYgm2Cw5w==
X-Received: by 2002:a05:6870:e743:b0:18f:1113:c6be with SMTP id t3-20020a056870e74300b0018f1113c6bemr10166647oak.11.1686714315097;
        Tue, 13 Jun 2023 20:45:15 -0700 (PDT)
Received: from rig.lan ([104.182.101.14])
        by smtp.gmail.com with ESMTPSA id s9-20020a9d7589000000b006a662e9f074sm5367538otk.58.2023.06.13.20.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 20:45:14 -0700 (PDT)
From: Randolph Sapp <res.sapp@gmail.com>
To: denis@denix.org,
	reatmon@ti.com,
	afd@ti.com,
	nm@ti.com,
	rs@ti.com
Cc: meta-arago@lists.yoctoproject.org,
	Randolph Sapp <res.sapp@gmail.com>
Subject: [oe-layersetup][PATCHv2 04/16] oe-layertool-setup: fix all the printf calls
Date: Tue, 13 Jun 2023 22:44:55 -0500
Message-ID: <20230614034507.598391-5-res.sapp@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230614034507.598391-1-res.sapp@gmail.com>
References: <20230614034507.598391-1-res.sapp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 03:45:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14609

You aren't supposed to use a variable in the printf format definition.
It kinda defeats the purpose of using printf.

Signed-off-by: Randolph Sapp <res.sapp@gmail.com>
---
 oe-layertool-setup.sh | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index 3faf00c..3e6ac4e 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -338,12 +338,12 @@ configure_repo() {
 
     # Check if the repo with $name was already seen.  Use the , at the end
     # of the grep to avoid matching similar named repos.
-    temp=$(printf '%s\n' $output | grep -e "^$name,")
+    temp=$(printf '%s\n' "$output" | grep -e "^$name,")
 
     if [ -n "$temp" ]
     then
         echo "This repository ($name) has already been configured with the following values:"
-        printf '\t%s\n' $temp
+        printf '\t%s\n' "$temp"
         echo "Skipping configuring duplicate repository"
         return 1
     fi
@@ -422,7 +422,7 @@ get_repo_branch() {
         do
             branches="$branches"$(echo $b | sed 's:.*origin/::g')"\n"
         done
-        branches=$(printf "$branches\n" | sort | uniq)
+        branches=$(printf '%s\n' "$branches" | sort | uniq)
 
 cat << EOM
 
@@ -503,12 +503,12 @@ EOM
     tags=$(git tag)
     if [ -z "$tags" ]
     then
-        printf "\tNo tags found\n"
+        printf '\t%s\n' "No tags found"
     else
         # Format the tags nicely
         for t in $tags
         do
-            printf "\t* $t\n"
+            printf '\t%s\n' "* $t"
         done
     fi
 cat << EOM
@@ -597,7 +597,7 @@ EOM
 
     for l in $t_layers
     do
-        printf "\t"$(echo $l | sed "s:${name}\/::")"\n"
+        printf '\t%s\n' "$(echo $l | sed "s:${name}\/::")"
     done
 
 cat << EOM
@@ -673,7 +673,7 @@ EOM
 
         for f in $confs
         do
-            printf "\t$f\n"
+            printf '\t%s\n' "$f"
         done
 
 cat << EOM
@@ -728,7 +728,7 @@ EOM
 
         for f in $confs
         do
-            printf "\t$f\n"
+            printf '\t%s\n' "$f"
         done
 
 cat << EOM
@@ -777,7 +777,7 @@ BBLAYERS += " \\
 EOM
     for l in $layers
     do
-        printf "\t$l \\%b" "\n" >> $confdir/bblayers.conf
+        printf '\t%s \\\n' "$l" >> $confdir/bblayers.conf
     done
     echo "\"" >> $confdir/bblayers.conf
 }
@@ -1048,7 +1048,7 @@ then
     then
         mkdir -p $dir
     fi
-    printf '%s\n' $output > $outputfile
+    printf '%s\n' "$output" > $outputfile
     echo "Output file is $outputfile"
 fi
 
-- 
2.41.0


