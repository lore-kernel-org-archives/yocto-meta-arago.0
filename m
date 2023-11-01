Return-Path: <sabiya.d@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E484CC4167D
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 09:29:18 +0000 (UTC)
Received: from egress-ip43b.ess.de.barracuda.com (egress-ip43b.ess.de.barracuda.com [18.185.115.247])
 by mx.groups.io with SMTP id smtpd.web10.3217.1698830948126106820
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 01 Nov 2023 02:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=Yg4w7F/Q;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.247, mailfrom: sabiya.d@mistralsolutions.com)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199]) by mx-outbound20-248.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 01 Nov 2023 09:29:05 +0000
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3b56bf3d7a9so1827103b6e.1
        for <meta-arago@lists.yoctoproject.org>; Wed, 01 Nov 2023 02:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1698830945; x=1699435745; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XOVR8GgRqiV98iqC6iAGscPQKoQorp8eN8tae7gKYp4=;
        b=Yg4w7F/QEt0F4Z//OnbzOR79/qZ/NkVL5bsKbMbJwIjnVcID9YmQMmKqkWRYCrGKzV
         hCcbAtHuPKP7FKzOnz2mvBUMVgwLpowXgykuUgCYvd/FNqm2GFBe+7fPYpk1SDWLOJU7
         OGrsyPcCPt80hKqZDidOPtzMj1/qSTgdwUJ4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698830945; x=1699435745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOVR8GgRqiV98iqC6iAGscPQKoQorp8eN8tae7gKYp4=;
        b=fh6Qf4cNbmcC+Fs8WqbmcZxeHaGKXwhOLR/8Og9NdjVv+592z8Qcx9amcJ2DHSsDd+
         Fgo1PnSDilYs3zsXgaOBn8qJRUxL+gmIOyZThXAro4Jb5LnA11OfW4ZYq4Z4ecXQAKMs
         iXpZiD0DrGhAcZa3kFMagXuMzecwx9QhrXPc7bilsDHfOCk7unaaCrZouLm7wyNpCozw
         JG488M9LgyaMW40pDRT1jSMe6K4p9QbZb8q77JAzxuCBJ3GhK8l8hfjlgdeiymkSh864
         2cKvHhat0cMqut6BWMA5yaMey/q91xOyc4IDCo4oy84Fx+FoXSt8V2Du5sX6F7epRGCk
         0z4A==
X-Gm-Message-State: AOJu0YwgZg5/BDHiSgXKjo8kG3fiubR8qV1Pyl9pT2gWOZtjrHa2V+2j
	fk9HcsKQL5pGnggrgzC/fobouln6hZnCRUp5DcGOTcIurZzulJg3RvTgt8WF9U2/eYglI8Cmi47
	SPf/55BMQs30Vtnqqg8gcHtII15b51wEou9TYliI2TxV0u7G2e2rM7+zarneneoFjyPxwLYJE8V
	Q=
X-Received: by 2002:a05:6808:2994:b0:3ae:251f:923f with SMTP id ex20-20020a056808299400b003ae251f923fmr13995700oib.28.1698830944728;
        Wed, 01 Nov 2023 02:29:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF596+6e9HuufqF6uJPxsHmeJtSn4x2TD3mgc9w6/FmUPy7jAEb1XPFNEuPq3bnvR8yWYVvRw==
X-Received: by 2002:a05:6808:2994:b0:3ae:251f:923f with SMTP id ex20-20020a056808299400b003ae251f923fmr13995686oib.28.1698830944456;
        Wed, 01 Nov 2023 02:29:04 -0700 (PDT)
Received: from localhost.localdomain ([157.45.146.102])
        by smtp.gmail.com with ESMTPSA id x21-20020aa79415000000b006c06804cd39sm908759pfo.153.2023.11.01.02.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 02:29:02 -0700 (PDT)
From: sabiya.d@mistralsolutions.com
X-Google-Original-From: sabiya.d@ti.com
To: meta-arago@lists.yoctoproject.org
Cc: reatmon@ti.com,
	sabiya.d@mistralsolutions.com,
	Dasnavis Sabiya <sabiya.d@ti.com>
Subject: [PATCH] packagegroup-arago-initramfs: Add e2fsprogs-mke2fs and dosfstools
Date: Wed,  1 Nov 2023 14:58:54 +0530
Message-Id: <20231101092855.101794-1-sabiya.d@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1698830945-305368-12372-6860-1
X-BESS-VER: 2019.1_20231024.1900
X-BESS-Apparent-Source-IP: 209.85.167.199
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUirNy1bSUcovVrKyNDACMjKAYoZGpqkmhikpye
	ZpFhYGhhbGaYkWKUmmBslmpikmxkZpSrWxAEOHqwtAAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.251831 [from 
	cloudscan20-234.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 NO_REAL_NAME           HEADER: From: does not include a real name 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, NO_REAL_NAME
X-BESS-BRTS-Status: 1
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 01 Nov 2023 09:29:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14984

From: Dasnavis Sabiya <sabiya.d@ti.com>

Add e2fsprogs-mke2fs and dosfstools for mkfs.ext4 and mkfs.vfat

Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
---
 .../packagegroups/packagegroup-arago-initramfs.bb        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb
index 380cc0e3..10412784 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb
@@ -1,4 +1,13 @@
 
 require recipes-core/packagegroups/packagegroup-core-boot.bb
 
+ARAGO_FSTOOLS = "\
+    e2fsprogs-mke2fs \
+    dosfstools \
+    "
+
 RDEPENDS:${PN}:remove = "grub-efi kernel"
+
+RDEPENDS:${PN}:append = "\
+    ${ARAGO_FSTOOLS} \
+    "
-- 
2.25.1


