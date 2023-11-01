Return-Path: <sabiya.d@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37BDC4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 09:29:18 +0000 (UTC)
Received: from egress-ip43b.ess.de.barracuda.com (egress-ip43b.ess.de.barracuda.com [18.185.115.247])
 by mx.groups.io with SMTP id smtpd.web10.3219.1698830956929058922
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 01 Nov 2023 02:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=ANuUkXoC;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.247, mailfrom: sabiya.d@mistralsolutions.com)
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71]) by mx-outbound20-248.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 01 Nov 2023 09:29:14 +0000
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-7b6e3ddb27fso2349694241.3
        for <meta-arago@lists.yoctoproject.org>; Wed, 01 Nov 2023 02:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1698830953; x=1699435753; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOVR8GgRqiV98iqC6iAGscPQKoQorp8eN8tae7gKYp4=;
        b=ANuUkXoCFKkiO/5udvzy161dgUsqCgdhPLmszEAJ0QwpYl5hEEPShE3lwaBDiWlE2A
         Ro83ZVrCgfSUnCiZzeE4iB+Aqsruun2tjH38uf4IId5LCettlVkE84GukRsua//a0TaM
         w4EF2f/j0v8ugUUu/GosbsxGGBpgGvJ3Ihfvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698830953; x=1699435753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOVR8GgRqiV98iqC6iAGscPQKoQorp8eN8tae7gKYp4=;
        b=IwQe5hwUpLSFftw6y9k5VrUan4rXrlIeV4GkrxyTl8TFuBwU0QonORU+u6PlXLI+or
         a2Kq/DjaMOuY/fD6gZq3Fph7xJ+SXnA3LUxB6uOIKl3Dz9+A0yjCvZ/C3j6wY5+3Dz3K
         sbyX6Z+zkVa/ECZIPUe4LrKhIrZbkTq4KbasqyOQpGiWqTAxM3wtYEIROU1ElesmY5Em
         XuOKF1sO96ZI+1/36Itt6aGWifKj/Exvf3TrEEv4lQ1zsMGZb2XzodGR9gyv/SKjspV7
         /+j8YDuSQrFxPuf1SkpR8N1FtQttaY51cmX5odJWv66H2HITPe/taSZIOlpLq1JIlgjW
         4mlQ==
X-Gm-Message-State: AOJu0YytKxjAfkNBFvOEVN5DqZsC0irvmYUWv9DDJSYc4lYfjhVlCIzM
	hE5QmUYUjAZOLe2+FrOEB65F/u5tG8CqA+C33DAYqmQJnfcKXVRK2d2kwLFrboJUpsU1ogYiMOo
	QeeY+3IYJXpjSOKRm01ownWjue6vIpAuzQD6jpEN+9AUVGkZ4ElmBDaODDIawVwMR1IjuXHf+az
	A=
X-Received: by 2002:a67:c018:0:b0:457:dfe0:ee6e with SMTP id v24-20020a67c018000000b00457dfe0ee6emr13897284vsi.22.1698830953673;
        Wed, 01 Nov 2023 02:29:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMlrRH+Cq7VqbW296txlRrSXkvxebj7wM2TBAnPOu6RRg/NGu750vulzVudg75jekVNQH3/Q==
X-Received: by 2002:a67:c018:0:b0:457:dfe0:ee6e with SMTP id v24-20020a67c018000000b00457dfe0ee6emr13897273vsi.22.1698830953270;
        Wed, 01 Nov 2023 02:29:13 -0700 (PDT)
Received: from localhost.localdomain ([157.45.146.102])
        by smtp.gmail.com with ESMTPSA id x21-20020aa79415000000b006c06804cd39sm908759pfo.153.2023.11.01.02.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 02:29:07 -0700 (PDT)
From: sabiya.d@mistralsolutions.com
X-Google-Original-From: sabiya.d@ti.com
To: meta-arago@lists.yoctoproject.org
Cc: reatmon@ti.com,
	sabiya.d@mistralsolutions.com,
	Dasnavis Sabiya <sabiya.d@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] packagegroup-arago-initramfs: Add e2fsprogs-mke2fs and dosfstools
Date: Wed,  1 Nov 2023 14:58:55 +0530
Message-Id: <20231101092855.101794-2-sabiya.d@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101092855.101794-1-sabiya.d@ti.com>
References: <20231101092855.101794-1-sabiya.d@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1698830954-305368-12368-6866-1
X-BESS-VER: 2019.1_20231024.1900
X-BESS-Apparent-Source-IP: 209.85.222.71
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUirNy1bSUcovVrKyNDACMjKAYoZGpqkmhikpye
	ZpFhYGhhbGaYkWKUmmBslmpikmxkZpSrWxAEOHqwtAAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.251831 [from 
	cloudscan22-156.eu-central-1b.ess.aws.cudaops.com]
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14985

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


