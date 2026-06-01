Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93167CD6E55
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 17:27:48 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4677.1780334867325858934
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 Jun 2026 10:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=Tpr7GDBV;
 spf=pass (domain: criticallink.com, ip: 209.85.219.51, mailfrom: jcormier@criticallink.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8ccf7b7d188so24850566d6.1
        for <meta-arago@lists.yoctoproject.org>; Mon, 01 Jun 2026 10:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1780334866; x=1780939666; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i5zRBZkCkDwA7QEwt+2DqM2q9waL/M4Zc0SrbLAZ4wk=;
        b=Tpr7GDBVVk7BdOizeINpSS3SfxZ5vQ3JUZsGRifQ4OhS7b99B9QliONcOy77kaluHV
         Stgerk0vjc6+YJPHVT3srfUQMhxT4lJOUpwkRGUkg5mt1kZNGIhTP16R29T9R+81J/Y2
         DdKgpC195PhJo9rG4lr50//dy6tMXmeitUc+jWV0v3kDV8ueNQqjkxxOdw690wshDaS2
         CGP4OG2mB1wGABXuJtCmdEgCWZQuh2Z/b7XHwds7W/wlWiZqUzDhz+gz1o4LsOUu901D
         7Krxy8C0wKZ9s+pw8B0R0V4ab+fs2WzQkCW2vh1O8XXn/Z4bn9Eh5nBkMIU28Bqa2uIg
         9QKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780334866; x=1780939666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5zRBZkCkDwA7QEwt+2DqM2q9waL/M4Zc0SrbLAZ4wk=;
        b=klJRTCV1AZB2u/Ma1cw8AGvfohJckKSshuyBan218ka66BYiVov6eEzos0ZEnaVv9C
         MEGAaK7oV3EWWlancO4kVws9vdwXs4uXi3dIrE3lsH78oYI0cVllLye4s5jBEvznl/9U
         w9r8lbw8eBMg2pmeovpcrItCTMdIhb9dy4fanHUr/UvWA8T3kftbTZE5i0PhVd5IAa50
         yRehwup/ihQs0KYfxOgqVeLIrKgHJuXahEntTmNRUfhSf3O+Gbca3wucer+F43zVGg15
         48HgQSJxDGWmu7t6RQvayb4ZX03iwNXd9n9pz2rkjIrGEdcd68CkPUDub4gMVHATZ2XE
         eG9g==
X-Gm-Message-State: AOJu0YwbtLSH47cQYkOgFgCyTcdQ5e9xhtpOpgcHxfWoCeqoN4uVlM/T
	/TntwMPAjej5iKzBBxubC458rV40FvSrrZF47dNWmSq22Q5uJxFUoxDDmsOSjGBHHbbDOeB5sj2
	Y5kHbEg==
X-Gm-Gg: Acq92OFGvVGUL5ODKbtV9JydM56CmhNcSIUR6cwHkH5AIOH+4eyeNdHXX8OiUW2cVdY
	IybvxhfcWcDRszmy16s/DH62kFPQXYtmXosdAvYduWmPrJgW3sWuEMHLr8SuWk6sN/CmKlY5tkF
	ZEbYvWEoPhDw5cSraLxEan4puBHmpGbSI8NEw8Ldy5jMRos59HrIrM331zf5z3qGww/x+l0bnVe
	IvHgPQbWHgWbfWyC2ENfm8hPQHHWRE3TYP2mafqd+E/eT5MKVctQKVYfOfZC6Hq5OBDtzFFyT3f
	4gb5h0A6JXD5VBeVgrGYJauE++3iikZoAb3s7CMjzFjvw4Edg/2qe70CBVUti5cfTPrEMbG5LT3
	kbv4W+Obsg1BOlBBczjP/i+XoCj8yYmyxzT1fjSfFkIr/LGSqVXDfJB9DHc4lSuww6LntBL+6K0
	944eVERzNvDJX1TNK0KryXVGbS02PoPMf7m44HY8DkhfqyBpc31DgzzXbJR8Qk68VJ9ta2kia+G
	taYRJ7aVlpD0M8nHfp5YNVFsv6YOtXFVYKIUzk1wrsKdoR1scM=
X-Received: by 2002:a05:622a:1e91:b0:510:1b61:d103 with SMTP id d75a77b69052e-5173a7d90b1mr176491601cf.36.1780334866185;
        Mon, 01 Jun 2026 10:27:46 -0700 (PDT)
Received: from jcormier-MS-7A93.syr.criticallink.com (static-72-90-70-110.syrcny.fios.verizon.net. [72.90.70.110])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51741db61e4sm60324951cf.24.2026.06.01.10.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 10:27:45 -0700 (PDT)
From: Jonathan Cormier <jcormier@criticallink.com>
To: meta-arago@lists.yoctoproject.org
Cc: rs@ti.com,
	reatmon@ti.com
Subject: [meta-arago][oe-layersetup][PATCH v2] .editorconfig: Preserve trailing whitespace in diff and patch files
Date: Mon,  1 Jun 2026 13:27:44 -0400
Message-ID: <20260601172744.1191461-1-jcormier@criticallink.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 Jun 2026 17:27:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17548

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


