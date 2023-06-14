Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A84EB64DB
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 03:45:32 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.3707.1686714322247108423
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 20:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=sOLD0et4;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: res.sapp@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-19f8af9aa34so4693853fac.1
        for <meta-arago@lists.yoctoproject.org>; Tue, 13 Jun 2023 20:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686714321; x=1689306321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4tuzckN3P03Etlf3mrUflxPh46O9g0AU8cSAKuDnIM=;
        b=sOLD0et4Ivt77mjLAQ1h9EJ01KhZn3NyQE+X3DD7asCusAOZjZQXPC7j/AXCgbBRwC
         cYlFeZ1oWuC3LBjtorDUTFQiT8Kl+RSxDPjH3m+x4Y8vX1BwC/yz/8TFoNwUhiQ3L2Iq
         XYbvaJpKLr5oMHWxajWWVPZf6k/huX3dbj+gGXUcKRYUZqVybcrbGSjYkv2nhUJJfY/s
         ArUunJ1X8u7lMY4yP8psA60x5pGKXocDN1NuE5YV02CnJu7OCsNKwdTlUhGtaOQuIqPJ
         IsKfshysAHiJ0gP1J43sqoKhaPQb9PYet5zSwHMiU0ABQKamHiyJCKK41EvqxqcOuV/Z
         Bt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686714321; x=1689306321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4tuzckN3P03Etlf3mrUflxPh46O9g0AU8cSAKuDnIM=;
        b=Dl7D+QBG9whwL6sBQQ6RAdok5c1cOUFcg8UYD9obIHJrikPA0lW+UtdiHmoxHIto7d
         I//DubxY5gHSzU0rFHxi1TIu7P51FgXtekHZR24f7oHL0Pj29JNzwJJR0NfbGuB8NvZI
         W2mPvDl1vjDXacTpRAiS2/uGHg3fhqQ6gR2kg/fgWFPWV3dl1wYXXr1yVvyvoq6nr+Ou
         TsIQ++TAqoRx5RVxF6kvJ2c9K/8NFt/t2QLfvMoZfD4tgce8+85Jt18q8BedYG+zrBb9
         7aR6QgPd4wt3y8z/nWNa7YmIGefyxSvYV/VIEs9OvNYKm/6qswp1d/U2PYz1v4DEGQyj
         yTHw==
X-Gm-Message-State: AC+VfDy1l9dWSh125Wyr31+cg4y3RQqJCBKFL6K0MUwAJKOAj7mbmAgg
	AsTVpIEKGKAQjRBleP+8WJFuIhJh56oJ4Gp+
X-Google-Smtp-Source: ACHHUZ7hc6PyK/QQlN67JB+af22Ci3I9nE4gkHQhD0+7P09Wx16ceMLTVWnvU2kGP3ZUpV8MykdMCw==
X-Received: by 2002:a05:6871:6a9a:b0:1a6:a5ac:6c7 with SMTP id zf26-20020a0568716a9a00b001a6a5ac06c7mr5075670oab.53.1686714321561;
        Tue, 13 Jun 2023 20:45:21 -0700 (PDT)
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
Subject: [oe-layersetup][PATCHv2 14/16] oe-layertool-setup: add a path sanity check for oebase
Date: Tue, 13 Jun 2023 22:45:05 -0500
Message-ID: <20230614034507.598391-15-res.sapp@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230614034507.598391-1-res.sapp@gmail.com>
References: <20230614034507.598391-1-res.sapp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 03:45:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14619

OEBase can not have a space in it's name due to parsing limitations of
POSIX shell. Make sure to check this before doing anything.

Signed-off-by: Randolph Sapp <res.sapp@gmail.com>
---
 oe-layertool-setup.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index 0928959..8694abd 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -966,6 +966,14 @@ do
     esac
 done
 
+# add early sanity check
+if printf '%s\n' "$oebase" | grep -q '\s'
+then
+   printf '%s\n' "OE-Base path has whitespace characters in it's path!" \
+                 "This is currently unsupported." ;
+   exit 1
+fi
+
 # create passed in directory if it doesn't exist
 mkdir -p "$oebase"
 
-- 
2.41.0


