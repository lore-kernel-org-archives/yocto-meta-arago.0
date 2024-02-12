Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B4BC4829C
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 16:32:00 +0000 (UTC)
Received: from egress-ip43a.ess.de.barracuda.com (egress-ip43a.ess.de.barracuda.com [18.185.115.202])
 by mx.groups.io with SMTP id smtpd.web10.10761.1707755517062264486
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 08:31:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=bFXH2kqB;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.202, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200]) by mx-outbound14-215.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 12 Feb 2024 16:31:54 +0000
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-5cfc2041cdfso2482641a12.2
        for <meta-arago@lists.yoctoproject.org>; Mon, 12 Feb 2024 08:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1707755512; x=1708360312; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pu94N0vyNvPA5GJvJozCaYj3oVc80/Qb4HeiVKpQ5rw=;
        b=bFXH2kqBqOKnK0MAjAlxKWOVtBljssfo/bfdv158sgi5K9p3KJTH6OYdQj5UtdmfKW
         mwqIoLYGOsW2eSkD7PI7fNiXPtrW9qrz6UVdO9GiXWfVP47uXf0jxGw24xQquj5/bCYD
         mZwNKkaQkLrGLHCyZQMXZtR59h5+QQ7h9eXC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707755512; x=1708360312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pu94N0vyNvPA5GJvJozCaYj3oVc80/Qb4HeiVKpQ5rw=;
        b=Rp06bja8fOYgEXUM+J2Y7mLgo+31nVsGmwECrNuD8CX+IL8NzoPxjewnuKr07StUe6
         eQyCJsuuGzGXAq8qgJgZmp+k45jX304dzUUuR/U7PzDzWe5duGwSNCtL+gb7fqUCG7Rx
         GnvPQvYjU0q1zwB8AHuNhUScgKEFsSxV59uYiz347YpoSaVV8zNfHdmse4E/DNzT/4HM
         YA8JKehKbOKZunMVeb0FC0fVuRZNMf4eTxHlB/tYDm2TWCl2Ghr3BB6uKYnscdAq8+no
         /PGdCwoecy+F2LflYmwgCNwwlTUadOfyPybxDq83EMcwZRTgmGBiWcgiFfWCjR2EpoCI
         qbmg==
X-Gm-Message-State: AOJu0YwSzd22WpSgVk7DuGBISNqTB32T9MgHZnJsbr9T7zClcFAMjknb
	rloStWIeMdPpANnMlCSAc5eS8lrFxWJj82AI8bFD9nQfxmHYarNjojferCihk7TtGh/JdDx/cyv
	yLB0/8e09ecD34TVtDOxgyhc1nBvgeyx87FpIiWKzM4HuiGi1K2ag+7qbYilImhzOBFqkUht/87
	5IozEznDDzGJvFedeS/Q4ntpBVZs+hkUuwtB0=
X-Received: by 2002:a17:90a:ca88:b0:297:414:73f2 with SMTP id y8-20020a17090aca8800b00297041473f2mr3889838pjt.11.1707755511887;
        Mon, 12 Feb 2024 08:31:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVAgSf8a8A/BOLTUI1z3n8GiEpnMXf5q+AcAFsB+Czypb9hsLbSI7MzCrSs2+wQ+kKpQXT1g==
X-Received: by 2002:a17:90a:ca88:b0:297:414:73f2 with SMTP id y8-20020a17090aca8800b00297041473f2mr3889822pjt.11.1707755511551;
        Mon, 12 Feb 2024 08:31:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPqK7OdBcJCx68mRNMNsviFtEa5gayxIKfHBFXkrO0wLzHpCAnmt2nEv8nYgDk+hyf9OYm7vNeAPnQcEoPtTP8M8L4NE0XugQwHX/ngVUQ
Received: from localhost.localdomain ([49.207.213.93])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090a1f4200b002989864e50dsm356291pjy.0.2024.02.12.08.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 08:31:50 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: meta-arago@lists.yoctoproject.org,
	reatmon@ti.com,
	Denys Dmytriyenko <denis@denix.org>
Cc: Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-arago][kirkstone][PATCH] graphics: kms++: Enable OmapCard support in pykms library
Date: Mon, 12 Feb 2024 22:01:22 +0530
Message-Id: <20240212163122.20728-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1707755513-303799-12419-17140-1
X-BESS-VER: 2019.1_20240210.0037
X-BESS-Apparent-Source-IP: 209.85.215.200
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUirNy1bSUcovVrIyMjKzBLIygIJJliamaRbGJk
	nGZsYWqSnmBqkpaQamxkZG5mbmyanGlkq1sQDJbbtlQQAAAA==
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.254165 [from 
	cloudscan13-176.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 12 Feb 2024 16:32:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15165

From: Sinthu Raja <sinthu.raja@ti.com>

AM57x platform supports OMAP DRM. By default the pykms library
disabled the OmapCard support. Enable the same by defining the
HAS_LIBDRM_OMAP as a compiler flags

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
 ...-Add-OMAP-Card-support-for-AM57x-DRM.patch | 26 +++++++++++++++++++
 .../recipes-graphics/kms++/kms++_git.bb       |  2 ++
 2 files changed, 28 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add-OMAP-Card-support-for-AM57x-DRM.patch

diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add-OMAP-Card-support-for-AM57x-DRM.patch b/meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add-OMAP-Card-support-for-AM57x-DRM.patch
new file mode 100644
index 00000000..48c9068d
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add-OMAP-Card-support-for-AM57x-DRM.patch
@@ -0,0 +1,26 @@
+From bc6e89ea8695c7e94eb6892755e47781682e28a7 Mon Sep 17 00:00:00 2001
+From: Sinthu Raja <sinthu.raja@ti.com>
+Date: Mon, 12 Feb 2024 21:47:52 +0530
+Subject: [PATCH] Add OMAP Card support for AM57x DRM
+
+Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
+---
+ py/pykms/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/py/pykms/meson.build b/py/pykms/meson.build
+index de05d12..ce6c013 100644
+--- a/py/pykms/meson.build
++++ b/py/pykms/meson.build
+@@ -49,7 +49,7 @@ if get_option('libutils')
+     pykms_deps += [ libkmsxxutil_dep ]
+ endif
+ 
+-pykms_args = [ '-fvisibility=hidden' ]
++pykms_args = [ '-fvisibility=hidden' , '-DHAS_LIBDRM_OMAP' ]
+ 
+ destdir = get_option('libdir') / 'python' + py3_dep.version() / 'site-packages/pykms'
+ 
+-- 
+2.36.1
+
diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
index 2c0abaa7..010a1f0a 100644
--- a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
+++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
@@ -28,3 +28,5 @@ inherit python3native meson pkgconfig update-alternatives
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE:${PN} = "kmstest"
 ALTERNATIVE_LINK_NAME[kmstest] = "${bindir}/kmstest"
+
+SRC_URI:append:am57xx = "file://0001-Add-OMAP-Card-support-for-AM57x-DRM.patch"
-- 
2.36.1


