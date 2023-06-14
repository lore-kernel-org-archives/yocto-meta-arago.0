Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C86C001DC
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 03:45:22 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.3700.1686714313751333922
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 20:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fK28rwMx;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: res.sapp@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1a670ac3650so3095692fac.1
        for <meta-arago@lists.yoctoproject.org>; Tue, 13 Jun 2023 20:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686714313; x=1689306313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dmxd66jqDVCZ3NXk/DY+86MnsaqlVTK1RjUaimdBSn4=;
        b=fK28rwMxHRXD17mDNnmTJI1YExPQzMWMCSXFT0/5YUynI9Q3uDrgUinM0gfgXj4s7t
         XnJEdFvuD5Vid5tBRUBXEOHqbU+vuUWfioAcmAQxmAjED4DMkV9OISwi/82zsDQBa2Ch
         jz9WBv0exUCUxO/qWpfOPtqxmeoSxhhLVKMUpNso1bTMzGcDHUdltCj12y+H6LLovhhW
         2D8DUw9GAcCOkdPJG2Dtssj4Yfww3A+7ReI0wFUoENl7J223/mAZ1/LEL1pPJ8wpXhIO
         c6aC2eDabCSkoFPHtcPK6goUG/Oe0LlQaSIA0OZ51Pmp4ejduDYFT1hfYv4xejMeta9L
         fwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686714313; x=1689306313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dmxd66jqDVCZ3NXk/DY+86MnsaqlVTK1RjUaimdBSn4=;
        b=DfhlsZMBSTb/AyrqIG+AHN2r7UZ2iF4rJTbqXAOofyWASVDL1ajfKA80Fzl/FtsEOR
         MOamTgBBhGy7gGV90iMrGt/pSIE3W08gpjCnSJ6A/Y13NlWrB8H/2W9T/7W9HsYmn4Yd
         WGWEdXhjo1SGpR20iCcUYr65vhyh/4BtoSjGP1HMEMEfP5kJeVq5oD191xuyjLXHx/m0
         vkRFjaSDxXlCtXi6jvSocF94dRchnJed4BiFd8Zx/IL3kPHYjdgMTR3rmSb+1etGO8Jg
         78Ah5de0e6bmBETx6iX4s8j2Z7yWxXxTWFmI2MBGg+x/hm5qBqWVlhUCzH/9eZS6KVeB
         jSZw==
X-Gm-Message-State: AC+VfDzWO+JPmhML/5PIQzQ9Ey2Pv3q3/fFVXv1UNn2aCCanbWg4AF5s
	a3hJWD3PJGWQzJD+wJu5coA=
X-Google-Smtp-Source: ACHHUZ6Bb/RC4LKvS6HQ6O8qvPP5JnpOqC7+OC8A7adjA5UH/LmN0rW8nt725tn87VT7QwcEozXbhg==
X-Received: by 2002:a05:6870:441:b0:19f:20db:a4d8 with SMTP id i1-20020a056870044100b0019f20dba4d8mr10624682oak.29.1686714313066;
        Tue, 13 Jun 2023 20:45:13 -0700 (PDT)
Received: from rig.lan ([104.182.101.14])
        by smtp.gmail.com with ESMTPSA id s9-20020a9d7589000000b006a662e9f074sm5367538otk.58.2023.06.13.20.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 20:45:12 -0700 (PDT)
From: Randolph Sapp <res.sapp@gmail.com>
To: denis@denix.org,
	reatmon@ti.com,
	afd@ti.com,
	nm@ti.com,
	rs@ti.com
Cc: meta-arago@lists.yoctoproject.org,
	Randolph Sapp <res.sapp@gmail.com>
Subject: [oe-layersetup][PATCHv2 01/16] oe-layertool-setup: split logic and/or expressions
Date: Tue, 13 Jun 2023 22:44:52 -0500
Message-ID: <20230614034507.598391-2-res.sapp@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230614034507.598391-1-res.sapp@gmail.com>
References: <20230614034507.598391-1-res.sapp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 03:45:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14606

Shellcheck:
Prefer [ p ] && [ q ] as [ p -a q ] is not well defined.
Prefer [ p ] || [ q ] as [ p -o q ] is not well defined.

Signed-off-by: Randolph Sapp <res.sapp@gmail.com>
---
 oe-layertool-setup.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index 1fca272..ef25ca0 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -126,7 +126,7 @@ exit 1
 
 check_input() {
     # Check that at least -i or -f was used
-    if [ "$interactive" = "n" -a "x$inputfile" = "x" ]
+    if [ "$interactive" = "n" ] && [ "x$inputfile" = "x" ]
     then
         echo "ERROR: You must either use this script with the -i or -f options"
         usage
@@ -1000,7 +1000,7 @@ fi
 if [ "x$interactive" = "xy" ]
 then
     cont="y"
-    while [ "x$cont" = "xy" -o "x$cont" = "xY" ]
+    while [ "x$cont" = "xy" ] || [ "x$cont" = "xY" ]
     do
         # clean up the variables for each repo
         name=""
-- 
2.41.0


