Received: from egress-ip33a.ess.de.barracuda.com (egress-ip33a.ess.de.barracuda.com [18.185.115.192])
 by mx.groups.io with SMTP id smtpd.web09.12200.1635255733708358025
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Oct 2021 06:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=dX/sFe5X;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.192, mailfrom: priya.ns@mistralsolutions.com)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199]) by mx-outbound11-114.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 26 Oct 2021 13:42:10 +0000
Received: by mail-pl1-f199.google.com with SMTP id v14-20020a170902e8ce00b0013fcb85c0ebso4926962plg.22
        for <meta-arago@lists.yoctoproject.org>; Tue, 26 Oct 2021 06:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1N++JTOQsJC5mMFOYxm7wuWbrrBKutkxZ98sB0nskV0=;
        b=dX/sFe5XcYZTwl6rfHHIHab2U4gQ13qSBmUZne3S/hR8KC/OgJ0Ofl64XjlZTQVk7r
         i9R1m3fQz54VZwwqjyu+k6tG8KuPnanfzcN4N8dAoBRXkU4hQqU9F8E0YYKEt7KWwbYm
         JlTaepPR6c8s27nO4A2jLwyIYf4bgNw+RzR5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1N++JTOQsJC5mMFOYxm7wuWbrrBKutkxZ98sB0nskV0=;
        b=zLfFs4d982pyhxB+vq+rbsyxns2ZxAHC5iQQUFXdrGru0TX7XGSJLwKMqHd7s2+HSF
         U09aotDAEM8JWPU2iS+IZ+Q2+/0MD4EMv4wrFEeCEmqHfyHo7jv9Q+JiurYWEZv3qSFH
         w7G6ZQcD03uhpy/bI2+4pNgKR4eq1qX0N0RoXZ5Fsz+X8+acbqvHBTgz5w4llNQ2HCoi
         Z1f15QsH6ML0R/L3C/UfnIsGlAdZz2sShALyoX72iRtXtrhtfQV72AaPKXwZwf3w8BlH
         scKIIPFGJxxX1hfGi88FJAIXcmAJP9jDNIcyq5s3I9Xq+QYUnnN8HF70vEcYR1kcanZh
         vJnA==
X-Gm-Message-State: AOAM531uT3juXAdwpDG9gWJNEqVqbOOP3pj6vHKrp4QYJC1Eptn9SsQ+
	NlG0+dcNDKdiIAcFsXujbfSlI8WbbPm0lQkQJ8rbEb5OKshKByQhElZoGWR+I2PZzO9kbzDXFDu
	QK/ECUTVgljBkjpqQNfIeSbsxt3jNybvP5xOq8AhLbbUjLAx6pppIXVOSLT6fmHxslQQ=
X-Received: by 2002:aa7:9727:0:b0:47b:e175:2320 with SMTP id k7-20020aa79727000000b0047be1752320mr19333088pfg.77.1635255729556;
        Tue, 26 Oct 2021 06:42:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtQVbq4sWU1pBv3WGkxC6g/QTKtqAObmhQtEbdJcz5ITb5rf9bOuaHy5rRvrziB0fsXbkC5w==
X-Received: by 2002:aa7:9727:0:b0:47b:e175:2320 with SMTP id k7-20020aa79727000000b0047be1752320mr19333045pfg.77.1635255729158;
        Tue, 26 Oct 2021 06:42:09 -0700 (PDT)
Return-Path: <priya.ns@mistralsolutions.com>
Received: from LAP000507.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id k1sm867050pjj.54.2021.10.26.06.42.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Oct 2021 06:42:08 -0700 (PDT)
From: "Priya N S" <priya.ns@mistralsolutions.com>
X-Google-Original-From: Priya N S <priya.ns@ti.com>
To: meta-arago@lists.yoctoproject.org
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Sekhar Nori <nsekhar@ti.com>,
	Priya N S <priya.ns@ti.com>
Subject: [meta-arago] [dunfell PATCH 2/2] weston-init: Update initscript for weston-calibration
Date: Tue, 26 Oct 2021 19:11:45 +0530
Message-Id: <20211026134145.57608-3-priya.ns@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
In-Reply-To: <20211026134145.57608-1-priya.ns@ti.com>
References: <20211026134145.57608-1-priya.ns@ti.com>
MIME-Version: 1.0
X-BESS-ID: 1635255730-302930-5395-12661-1
X-BESS-VER: 2019.1_20211021.1606
X-BESS-Apparent-Source-IP: 209.85.214.199
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.235420 [from 
	cloudscan11-87.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.50 BSF_RULE_7582B         META: Custom Rule 7582B 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_RULE_7582B, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit

Increase the sleep time before starting the weston-calibrator.
It takes some time for the completion of the runWeston script.
If the weston-calibration is started before the completion of
the runWeston script, the weston-calibrator will fail.

Signed-off-by: Priya N S <priya.ns@ti.com>
---
 meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend | 2 +-
 meta-arago-distro/recipes-graphics/wayland/weston-init/init     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
index 5ac8b6d0..21a9a9b7 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = ".arago11"
+PR_append = ".arago12"
 
 SRC_URI_append = " \
     file://runWeston \
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/init b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
index 461b0787..7a80238b 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/init
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
@@ -79,7 +79,7 @@ case "$1" in
             echo
             echo    "*** To continue, please complete the touchscreen calibration"
             echo -n "*** by touching the crosshairs on the LCD screen"
-            sleep 1
+            sleep 2
             CAL_VALUES=`weston-calibrator|cut -c21-`
             echo 'SUBSYSTEM=="input", ENV{WL_CALIBRATION}="'$CAL_VALUES'"' > $WS_CALUDEV_FILE
             echo "."
-- 
2.19.1.windows.1

