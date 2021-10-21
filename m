Received: from egress-ip4a.ess.de.barracuda.com (egress-ip4a.ess.de.barracuda.com [18.184.203.227])
 by mx.groups.io with SMTP id smtpd.web12.9142.1634822183933226658
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 06:16:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=cIdJi0ni;
 spf=pass (domain: mistralsolutions.com, ip: 18.184.203.227, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198]) by mx-outbound44-92.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 21 Oct 2021 13:16:19 +0000
Received: by mail-pg1-f198.google.com with SMTP id x17-20020a63b211000000b0029c1c5db669so117423pge.23
        for <meta-arago@lists.yoctoproject.org>; Thu, 21 Oct 2021 06:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zDeeexUHsNHe+M3uouo9inUXMiU5H8anEXdTHEXRiZA=;
        b=cIdJi0niYTXEEIkXmLzAjEEsuf99KHEnMnFHzjD1aUFLxPUKdA5JY5U/X5H/HuC82U
         fDgb21i2mqFxJjtg/SwRZGkgZ/RTs3p3eTb4+tISLDa+tHCcG8WrxrrJ6t62USdDaj3S
         i+CfcZFMHk81xpgAslKNJiDckjoEMjBR1JG5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zDeeexUHsNHe+M3uouo9inUXMiU5H8anEXdTHEXRiZA=;
        b=m/4INBwr+O1ttE/a5b73UA57sdMTmc/OeIqOecCeYcYwC+m7KLbPvNxUvtbPtyCYkY
         qZwXZQ09esQ7UF5vIQ+cNSPaRdsjGdjCzEhXOs4gLACQz6gBa5Y4QnC9qL7sxFm/gEmx
         Vgi/GLReMU+ObMpGvgbNMDFq0hBUD5SfqMvixnTBrTLCe2uxQHOqnqvth52CevVG+3cz
         82CjmlDyC77lp0gdLMm2J0NwLRWf5WXUPE1lOLkDkyhdyIAG4iC1oqs2nCfigfyWLr0i
         hz8IXfPyiQe2kWd8yTvp9fYgON5erUDs+UHZsJINbdQO3mM6sgkia59rEkiDAbD/Zn0s
         LQIQ==
X-Gm-Message-State: AOAM533VrOsKcw8dB80jmwBPMwUfdVugfYQ/Od3C2+/hIRtRKjiv5H2/
	ldy1ihoKJ7dvme9RzmtdRmzm+EO0TZ+7Gvdu11t41EfiOLMBYBlDPnfK/mutpaoTXDwTJOBA82w
	28nKzvU6ZeQyVJluNjACLxjuuOGQBw1pQfd2mvjNlFcCT3u93WoJj0RVKQr3Dn1PjJ7M=
X-Received: by 2002:a63:3c10:: with SMTP id j16mr4395196pga.68.1634822176290;
        Thu, 21 Oct 2021 06:16:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7GG6bRJMNCcZ7ZkSHvcs0MRIcrmpSQ4QiTvUw7Bm9E+u7MUro1T13ZGYf0ToS6CFIpnWpxQ==
X-Received: by 2002:a63:3c10:: with SMTP id j16mr4395175pga.68.1634822176013;
        Thu, 21 Oct 2021 06:16:16 -0700 (PDT)
Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id i12sm6028374pfo.126.2021.10.21.06.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 06:16:15 -0700 (PDT)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: meta-arago@lists.yoctoproject.org
Cc: Nikhil Devshatwar <nikhil.nd@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denis@denix.org>,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-arago][dunfell/master][PATCH V4 1/2] linux-firmware: Package intel 9260 WiFi and BT firmware
Date: Thu, 21 Oct 2021 18:45:58 +0530
Message-Id: <20211021131559.16817-2-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021131559.16817-1-sinthu.raja@ti.com>
References: <20211021131559.16817-1-sinthu.raja@ti.com>
MIME-Version: 1.0
X-BESS-ID: 1634822178-311356-5549-12480-1
X-BESS-VER: 2019.1_20211019.2112
X-BESS-Apparent-Source-IP: 209.85.215.198
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.235307 [from 
	cloudscan15-181.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.10 BSF_SC0_SA085          META: Custom Rule SA085 
	0.40 BSF_SC0_SA085b         META: Custom Rule SA085b 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_SC0_SA085, BSF_SC0_SA085b, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit

From: Sinthu Raja <sinthu.raja@ti.com>

The Intel 9260 WiFi and BT firmware is already part of the linux-firmware
repository, so package it to make it available.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---

Changes in V4:
Addressed review comments that include making changes that are consistent with 
respect to the original recipe.

V3: http://arago-project.org/pipermail/meta-arago/2021-October/013343.html
V2: https://www.mail-archive.com/meta-arago@arago-project.org/msg12121.html
V1: https://www.mail-archive.com/meta-arago@arago-project.org/msg12117.html

 .../linux-firmware/linux-firmware_%.bbappend       | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
index 146596ad..3472f267 100644
--- a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
@@ -1,4 +1,16 @@
-PR_append = ".arago0"
+PR_append = ".arago1"
+
+PACKAGES =+ "${PN}-iwlwifi-9260"
+PACKAGES =+ "${PN}-ibt-18"
+
+LICENSE_${PN}-iwlwifi-9260 = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-ibt-18 = "Firmware-ibt_firmware"
+
+FILES_${PN}-iwlwifi-9260 = "${nonarch_base_libdir}/firmware/iwlwifi-9260-*.ucode"
+FILES_${PN}-ibt-18 = "${nonarch_base_libdir}/firmware/intel/ibt-18-*.sfi ${nonarch_base_libdir}/firmware/intel/ibt-18-*.ddc"
+
+RDEPENDS_${PN}-iwlwifi-9260 += "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-ibt-18 += "${PN}-ibt-license"
 
 do_install_append() {
 	rm -rf  ${D}/lib/firmware/ti-connectivity/
-- 
2.31.1

