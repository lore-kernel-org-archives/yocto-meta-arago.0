Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E36CD6E55
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 17:19:17 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4467.1780334354509894161
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 Jun 2026 10:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=kxzkxeBV;
 spf=pass (domain: criticallink.com, ip: 209.85.160.170, mailfrom: jcormier@criticallink.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-516da301e64so153704081cf.1
        for <meta-arago@lists.yoctoproject.org>; Mon, 01 Jun 2026 10:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1780334353; x=1780939153; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i5zRBZkCkDwA7QEwt+2DqM2q9waL/M4Zc0SrbLAZ4wk=;
        b=kxzkxeBVlx+S3nE/cG/lTKggayF480xj0wKnJKHsqAAsemvG3UW6wj1dHWGLdtPCVm
         r17c1DCd44847U7yFyYjpgqsVKsdBQ/qNSdUJEJT1PZ+zmVMmR+lOU0re1NocscqO2YR
         DD+pbZImy/zsaMtA10VclNbg8+ml7cdBfWgr39zJTB8/iMTZ0DiX2hlafzvlymYIJg8U
         2m5TFiP/yPPa8lNNfE/M0/S9oYTN+eeEafu5lZaQnOmg4kA0Vb9YA6gJNlZnSBiOzEaC
         Cm5MlHhIWzaLMWCIajz7g5vpysmEd7bQx7YrObI83QTI3lRwJKCbIn+oMBZZEY63Tyzl
         fn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780334353; x=1780939153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5zRBZkCkDwA7QEwt+2DqM2q9waL/M4Zc0SrbLAZ4wk=;
        b=O78kOlfX96jNDxL7Mm+Uyq5VE/DWVvUoGIQC1fY+7EwpKFEfomi9cAxOMNwo4Ruhlt
         x/zHOiiAkpa1a3oSSnJ/Tq9tEbydzRzAREQ8HI1LXIGDxj+lHosri2gHy2AmT8ldp5vH
         8/EVexKR9KkeJci31TO+/YP9g5XcatgEpX1tbvEol0CTPTC+mQQFvdiXqt2wLLfJbwQG
         j6RXgvT1GtJgUCFvOHq0ZaddtqU7ssgSvVAMtrwZm4A5YBndsROrWHwmyNxswaoK3V+i
         2CJ7QwBXm62s48OfSL9vE3MW4Ct4YuW5q7oHF/AhJZN3GsQD2OLtQ1147gpB6VMipojZ
         QTBg==
X-Gm-Message-State: AOJu0YzLo7VrNC0Uun2QZwhyt3YbczTj1qLDrNqgZ+QJrhn8HYG59w8q
	Yocd0PtKmoVzWGtwC/K0fzeceW4AvldgF5MraWjhKO4psptBrLOboJcpFUZrtyoY6LCggU60Pmd
	uBNiwMQ==
X-Gm-Gg: Acq92OFVCbvDyjLEYuo7tP0HYUH8ZK+UpgRqZV4gaCHXnyUfmqq9yUzUBrsyvxN/2NM
	hoyQxyPlF5dmsW/SztpV638XAzDL8POLgcw1L6a4DxdRbEu/r7GNeaYYBbyrXACQyBcxrTIEBfK
	l02nTeuWKcNutHtyGHtfuJe0apGmHLqujbIl8cV7QN4cQ4tETP8rcHNWOyVqaIBpt1sr6uXbrs/
	x6xAsV2gjo7haiGwe+Z06SN1LU8fVxBbzycfj63dCcCX29+XzXbwR+pdn/vchyb4ctr/whMBH1B
	rF2w5DHBMSWG3tJOgdNniHDqvUE9b1alitCVD4ACPkgo/s0/B+npecXNdYuPYGJV9A90sH6yZGu
	KpA9IeHSsr0pqWiriKDnJdzKzSmIlBQz18BPMdwOeIERYxbDh5taiNgy3g8qqKTcsHQwoYWYRdb
	McIq92hYmlfX9Y8YkSJ6vEz05x4yw+Jif1PArDOr0QtJ/QfIRMi2JGsnYRCfi9iyrMFwYVYH/Je
	n+7mmKJyjAZ8ghRmsI3NJ13Zzg5ndU6OimRP96TTzhHGSewIPc=
X-Received: by 2002:ac8:7d83:0:b0:50d:9aff:8b43 with SMTP id d75a77b69052e-5173a5c1040mr177205271cf.10.1780334353380;
        Mon, 01 Jun 2026 10:19:13 -0700 (PDT)
Received: from jcormier-MS-7A93.syr.criticallink.com (static-72-90-70-110.syrcny.fios.verizon.net. [72.90.70.110])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51741b05dadsm60972171cf.5.2026.06.01.10.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 10:19:12 -0700 (PDT)
From: Jonathan Cormier <jcormier@criticallink.com>
To: meta-arago@lists.yoctoproject.org
Cc: rs@ti.com,
	reatmon@ti.com
Subject: [PATCH] .editorconfig: Preserve trailing whitespace in diff and patch files
Date: Mon,  1 Jun 2026 13:19:12 -0400
Message-ID: <20260601171912.1146766-1-jcormier@criticallink.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 Jun 2026 17:19:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17546

Diff and patch files require trailing whitespace to denote
empty lines with no changes.

Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
---
 .editorconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.editorconfig b/.editorconfig
index 30740e726616..306d282c3164 100644
--- a/.editorconfig
+++ b/.editorconfig
@@ -6,6 +6,9 @@ root = true
 insert_final_newline = true
 trim_trailing_whitespace = true
 
+[*.{diff,patch}]
+trim_trailing_whitespace = false
+
 [*.{sh,pl,xml}]
 indent_size = 4
 indent_style = space
-- 
2.43.0


