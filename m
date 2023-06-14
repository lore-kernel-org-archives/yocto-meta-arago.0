Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3766FEB64DC
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 03:45:32 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.3797.1686714322940308039
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 20:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=nQ5SorTU;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: res.sapp@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6b162127472so3969990a34.0
        for <meta-arago@lists.yoctoproject.org>; Tue, 13 Jun 2023 20:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686714322; x=1689306322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5rBXB1yLLKdybwna0F9rG87e6Jw6qyz/t3It+toXjs=;
        b=nQ5SorTUSTXH0DOaQ12CdMODZ8tiUPHJwXETjP7TcMkw+My6O1lFGs7QGquvLZ/lSQ
         hBzsSuNPXwe8e31iYKfXllhbOLiOSkzdQT/fDRPeY8fUP8X4AyiKR/IPbJGve/ocU7Cd
         WEszfgZ5AcL6Ajt35B/JzrCAN2NZyvaXbFsHY3hHba/VDOnl8QxrZm9CJiyweJh6Z71T
         g6+5/AXLQfXZ0mShujB56GD9/YM0L6z0ANid+0Jr/ojKagfigelEnGBwuZxKJY9mlRMl
         MiVovBkjO14/KyAIX02wONvLmQMOlTmg37oJnUbshWL6UKRIUCViWcHC2U21cQJOUTQ5
         lI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686714322; x=1689306322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5rBXB1yLLKdybwna0F9rG87e6Jw6qyz/t3It+toXjs=;
        b=WTQU7bCvQolL+vUsiagwEefeu8762sacxA21bM/9XQKuvr+MqSJfU114MIRb5T5UMM
         Pu+hk3DNsIS5ObBemngT0w8/xXwXId8Jue0vkhnYjoxfGtnvFXmHOqSZ8C7cRv49uoH7
         Zx2YA5TGCk9CEq0HRgOXVI2C13HX3uUP9a+PGrtQRCWJPm80nR6+In/o0GwtH96X3xnH
         6gQqU9mpUXVyqZRlEM7I4MahDlYVJ7YYBAp9jKbakSLSJ5fVlSXD+/zebdBpMWc8y4eb
         x3svvj2CePzHDT/EFlVpUb6DszK52G7ELFcXZbYUHejZUKD9mzOzjdX2ToDdNP0jG0YU
         ULfA==
X-Gm-Message-State: AC+VfDxETW0LgfdFcM7xfn0YD83QAbDpa3n7jpaUqr5g0zRRsM/uU9IU
	xje6JLaizPV0uDWftO35GwE=
X-Google-Smtp-Source: ACHHUZ6PamdlNOZA5df1FQ0TlgBhM9ebbvpWO/7MkU8Ej6yod/gLnIL31ufW6MCnOFemp2yFokRTkQ==
X-Received: by 2002:a9d:6a92:0:b0:6ab:ce:6eac with SMTP id l18-20020a9d6a92000000b006ab00ce6eacmr11211620otq.20.1686714322277;
        Tue, 13 Jun 2023 20:45:22 -0700 (PDT)
Received: from rig.lan ([104.182.101.14])
        by smtp.gmail.com with ESMTPSA id s9-20020a9d7589000000b006a662e9f074sm5367538otk.58.2023.06.13.20.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 20:45:21 -0700 (PDT)
From: Randolph Sapp <res.sapp@gmail.com>
To: denis@denix.org,
	reatmon@ti.com,
	afd@ti.com,
	nm@ti.com,
	rs@ti.com
Cc: meta-arago@lists.yoctoproject.org,
	Randolph Sapp <res.sapp@gmail.com>
Subject: [oe-layersetup][PATCHv2 15/16] oe-layertool-setup: fix multi-line printfs
Date: Tue, 13 Jun 2023 22:45:06 -0500
Message-ID: <20230614034507.598391-16-res.sapp@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230614034507.598391-1-res.sapp@gmail.com>
References: <20230614034507.598391-1-res.sapp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 03:45:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14620

Replace multiple printf calls with one call and a good format.

Signed-off-by: Randolph Sapp <res.sapp@gmail.com>
---
 oe-layertool-setup.sh | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index 8694abd..2b05550 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -347,10 +347,10 @@ configure_repo() {
         get_repo_uri
     fi
 
-    printf '%s\n' ""
-    printf '%s\n' ""
-    printf '%s\n' "cloning repo $name"
-    printf '%s\n' ""
+    printf '%s\n' "" \
+                  "" \
+                  "cloning repo $name" \
+                  "" ;
 
     clone_repo
 
@@ -522,8 +522,8 @@ verify_layers() {
     do
         if [ ! -f "$sourcedir/$l/conf/layer.conf" ]
         then
-            printf '%s\n' "ERROR: the $l layer in the $name repository could not be"
-            printf '%s\n' "       found.  Bailing out."
+            printf '%s\n' "ERROR: the $l layer in the $name repository could not be" \
+                          "       found.  Bailing out." ;
             exit 1
         fi
     done
@@ -793,8 +793,8 @@ EOM
     
     if [ -e "$confdir/local.conf" ]
     then
-        printf '%s\n' "WARNING: Found existing $confdir/local.conf"
-        printf '%s\n' "Saving a backup to $confdir/local.conf.bak" 
+        printf '%s\n' "WARNING: Found existing $confdir/local.conf" \
+                      "Saving a backup to $confdir/local.conf.bak";
         cp -f "$confdir/local.conf" "$confdir/local.conf.bak"
     fi
 
@@ -820,16 +820,16 @@ EOM
     if [ -e "$oebase/tmp_append_local.conf" ]
     then
         {
-            printf '%s\n' "";
-            printf '%s\n' "#====================================================================";
-            printf '%s\n' "# LOCALCONF: settings from config file:";
-            printf '%s\n' "#   $inputfile";
-            printf '%s\n' "#";
-            printf '%s\n' "# Do not remove.";
-            printf '%s\n' "#--------------------------------------------------------------------";
+            printf '%s\n' "" \
+                          "#====================================================================" \
+                          "# LOCALCONF: settings from config file:" \
+                          "#   $inputfile" \
+                          "#" \
+                          "# Do not remove." \
+                          "#--------------------------------------------------------------------" ;
             cat "$oebase/tmp_append_local.conf";
-            printf '%s\n' "#====================================================================";
-            printf '%s\n' "";
+            printf '%s\n' "#====================================================================" \
+                          "" ;
         } >> "$confdir/local.conf"
         rm "$oebase/tmp_append_local.conf"
     fi
@@ -1024,9 +1024,9 @@ then
 
         save_layers
 
-        printf '%s\n' ""
-        printf '%s\n' ""
-        printf '%s\n' "Would you like to configure another repository? [y/n] "
+        printf '%s\n' "" \
+                      "" ;
+        printf '%s' "Would you like to configure another repository? [y/n] "
         read -r cont
     done
 fi
-- 
2.41.0


