Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A74C001B3
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 03:45:22 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.3793.1686714319017862616
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 20:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YZud8ISi;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: res.sapp@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6b2f0a140b7so2360880a34.3
        for <meta-arago@lists.yoctoproject.org>; Tue, 13 Jun 2023 20:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686714318; x=1689306318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6RKq2rTCCKhsHsi6VHHO6fLVR5AWSgR0Cv4FkaqqeA=;
        b=YZud8ISiMTJoM34yNdyb7PDlEKt76m9Cs44gJs0bQ6ZsvPBlp/alFttafwRJ45mpEP
         YDJ+AthBJEIWqev3LKrmEAvaznCIE9mRW0MB2mCuwFWNr2pPF0AFVi9DBOc3cWCCTT+A
         qC3BGSIonVVpjyc+pyVQ4v24ObUqcTpineGjE6oVmbiAHQnJJm2bvTUm/+zKlIa9bqiQ
         SMKlvUi0KVevT+O4cKNpdM4TKAyLoP/A121sUaZj5URxxNmEQMLD3/Jx9ytABcAvGfSJ
         1WWwjNyX53hoojaGx0A0Zgebcec2lFWZzAFamX1snbX8wAwlMgaPSJq1wAktwJhofJkP
         7wJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686714318; x=1689306318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6RKq2rTCCKhsHsi6VHHO6fLVR5AWSgR0Cv4FkaqqeA=;
        b=BvM4TxzEeaqF6erDzh0qLIRzWR1r39YVY/IgQwdt8cURSfB/USY8dhxDhB1dg3n1I3
         1nHNqyZsJSnAQfpyYq5Z6ShXQmCKHw3uDVNTWZMMwWAExTTlAh+LMVE3wTX8eJrENO/I
         JYYD+KneGc/FkrVheK1UmvZscMzKsOBM0oRXaZiri5orAYgJfMkA3XH+kbDg7W0ZyYdL
         XZbV5AaBl7fiSSRYahefmuPxrRYdeJ8mjl3l0pMHOpM2U0ZzIrz+kMxDgdf3dBToaXxF
         YXhvfS7UJtXAkT5qQ65kCWlxvr65mkSuxxyf4NQEiKn5jw08QyiAQUVhWbI3LmFUzv5t
         pNLg==
X-Gm-Message-State: AC+VfDyiu51UT3njo2vY4Hi5Nszvmwuf71cJYd8cXHEibrXpRO2KTmRh
	qGGnGeQ5pZ8giB+1p7ma+WQ=
X-Google-Smtp-Source: ACHHUZ4FxumzUUAXYbGJcObXCZHLOTwZFLrtJynEDM3Pb1EGbmSup02TmKGYSoV9SS9QtiVJgEXrJQ==
X-Received: by 2002:a05:6830:1188:b0:6a5:f786:d763 with SMTP id u8-20020a056830118800b006a5f786d763mr11392694otq.5.1686714318313;
        Tue, 13 Jun 2023 20:45:18 -0700 (PDT)
Received: from rig.lan ([104.182.101.14])
        by smtp.gmail.com with ESMTPSA id s9-20020a9d7589000000b006a662e9f074sm5367538otk.58.2023.06.13.20.45.17
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
Subject: [oe-layersetup][PATCHv2 09/16] oe-layertool-setup: eliminate useless cat
Date: Tue, 13 Jun 2023 22:45:00 -0500
Message-ID: <20230614034507.598391-10-res.sapp@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230614034507.598391-1-res.sapp@gmail.com>
References: <20230614034507.598391-1-res.sapp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 03:45:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14614

Eliminate useless cat into grep.

Signed-off-by: Randolph Sapp <res.sapp@gmail.com>
---
 oe-layertool-setup.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index 6908fe2..b824114 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -803,7 +803,7 @@ EOM
     # Find if old DL_DIR was set
     if [ -e "$confdir/local.conf.bak" ]
     then
-        old_dldir=$(cat "$confdir/local.conf.bak" | grep -e "^DL_DIR =" | sed 's|DL_DIR = ||' | sed 's/"//g')
+        old_dldir=$(grep -e "^DL_DIR =" "$confdir/local.conf.bak" | sed 's|DL_DIR = ||' | sed 's/"//g')
     else
         old_dldir="$oebase/downloads"
     fi
-- 
2.41.0


