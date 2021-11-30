Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.80810.1638296448234641624
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 Nov 2021 10:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pathpartnertech.com header.s=google header.b=RkA9Rag4;
 spf=pass (domain: pathpartnertech.com, ip: 209.85.221.45, mailfrom: sidraya.bj@pathpartnertech.com)
Received: by mail-wr1-f45.google.com with SMTP id v11so46395742wrw.10
        for <meta-arago@lists.yoctoproject.org>; Tue, 30 Nov 2021 10:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id;
        bh=xJ02KhJ1D2lzJRxXLiLv6/tKTA3+xZv5oNGak1S1jGY=;
        b=RkA9Rag4wOdHNQa9wwVmrWQZgid+e25QD//Eh8YWQmuTLSunJqAHQQf23VeKFEFpEm
         h6NTtZ996prNMAyw9CswOlSOSB6pYVfdadcpP6f3d7LT3CNjWgjn3PZVgBeOiQiakFPU
         YZkj/Ogfa7vqf/zDZ3tQlHtnBGgrzyO7pzMuJV1Yff8giX8MK2aVH8XgQewDh8IIKgWX
         Mq1wUpMNBeA6q3e/aQ+Tgxff3jrXU1QKO2H2QzlXY/AEn9Z4RLSEbo0j41M7NySV64xW
         MFB8XfkTINdyuEAjYT4KPhox777RMjtBvmWYextMo/DFHqHsHsDtOE7QychIOfZ+I7/X
         Byjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=xJ02KhJ1D2lzJRxXLiLv6/tKTA3+xZv5oNGak1S1jGY=;
        b=RjnXV1IU8mf0f93DhFu4CBdm4Jav6HhWgULcSNihMA+Eu7EcLsOhnWFDpjQJZC1J9p
         AsQca1MbLlOQx4c9ozOexGXDULLyhEB3ULEVmsKUnJkTd+3r7IAEa+Obq411t0CpSNA0
         3g3HFGqI5neJJi4Duxh+HglD8U2uEIq/cXNGnHSo3ISR3L+O3SlKTN01K1XWzA/nyDfx
         7KqoKqPJTeRJEiX3Rxf2RBcYti1a/5ZHlJxJpi+LpdMqtpVbf/D8FZxrnSfnKgf/Zzxy
         XC+Xbk/x3Xw3f+YaHT3IekjZQAlV/H+2YAiPzKAAexjox0vhka5Jga4yR4KjCNY8+mmv
         r5Pg==
MIME-Version: 1.0
X-Gm-Message-State: AOAM533BhNCTorx1fk1Wpf0vT8h2dUKJMJVg25A7Yww7eYZpN3L/Y0hg
	W+ojChQov4WoK2XKKYTgpBbPZh3YmFwx9LJ1LanR8wIFQSeRZbRaelWRdY7t7rDBjlyk7LPUQca
	RzFY6/mZXCATctDzE5ZqZP9Tw47KjKDuB
X-Google-Smtp-Source: ABdhPJyeQa3jklKmDy5x3cpMP3SgYI3gIG7vCPRG7tV8tw1DMyaj1vSfBim3tTKAIECB3ubrBAseoQ==
X-Received: by 2002:a05:6000:1a43:: with SMTP id t3mr590533wry.555.1638296446482;
        Tue, 30 Nov 2021 10:20:46 -0800 (PST)
Return-Path: <sidraya.bj@pathpartnertech.com>
Received: from sidraya-laptopU.ent.ti.com ([2401:4900:2502:ea12:860:6195:a98f:fb6e])
        by smtp.gmail.com with ESMTPSA id c4sm17088461wrr.37.2021.11.30.10.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 10:20:46 -0800 (PST)
From: "Sidraya Jayagond" <sidraya.bj@pathpartnertech.com>
To: meta-arago@lists.yoctoproject.org
Cc: yogeshs@ti.com,
	praneeth@ti.com,
	d-huang@ti.com,
	prashanth.ka@pathpartnertech.com,
	praveen.ap@pathpartnertech.com,
	denis@denix.org,
	Sidraya <sidraya.bj@pathpartnertech.com>
Subject: [PATCH] ti-test: Add videnc-test-app for j7-evm
Date: Tue, 30 Nov 2021 23:50:29 +0530
Message-Id: <20211130182029.3691-1-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="US-ASCII"

From: Sidraya <sidraya.bj@pathpartnertech.com>

The videnc-test-app provides the video encoder test app
(tienc_encode) for j7-evm.

Signed-off-by: David Huang <d-huang@ti.com>
Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 7b2bda5e..434ed559 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -84,6 +84,7 @@ ARAGO_TI_TEST_append_k3 = " \
 ARAGO_TI_TEST_append_j7 = " \
     ufs-utils \
     viddec-test-app \
+    videnc-test-app \
 "
 
 ARAGO_TI_TEST_append_omapl138 = " \
-- 
2.17.1


-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly
prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.
