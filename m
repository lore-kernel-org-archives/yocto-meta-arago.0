Received: from egress-ip33a.ess.de.barracuda.com (egress-ip33a.ess.de.barracuda.com [18.185.115.192])
 by mx.groups.io with SMTP id smtpd.web10.9326.1634822182053194285
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 06:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=Fzw6rVd1;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.192, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198]) by mx-outbound15-163.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 21 Oct 2021 13:16:19 +0000
Received: by mail-pg1-f198.google.com with SMTP id z12-20020a655a4c000000b0029506c80060so122636pgs.20
        for <meta-arago@lists.yoctoproject.org>; Thu, 21 Oct 2021 06:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pfAiWqS5wYgl2UPBm6qYCZr7rnfcyBZB85IQ9V4ijps=;
        b=Fzw6rVd1OOI9Jvx0hnSpNfBW/2GXD0tgiGQxMt8XScsc0bhqT4nn+NcTj3LQ/5hbGc
         3C4EOCYvpdii0LEkwvLY9WQxcqev8acLtVR6KPc8olaMB5UG7M0vM95gRQHaa68fAp7f
         hG/kRGpU9FZwCx2iv+j941S3I0Pkz2JPR8ono=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pfAiWqS5wYgl2UPBm6qYCZr7rnfcyBZB85IQ9V4ijps=;
        b=fB9fggltIloseRhpBh2di/Rn0Q/zdL1ZeV0k48DDGNAYVG0tKBzKCNq4oJfDuFtKmY
         Y2OBKWCD7UPwHsHNOAO0Cc0OHVaTtN069XWeb49j376/0Rz+/Jqm15BkVGUdM2Ooy/Gd
         foFf7bsvg8e3dyxTBFV0KhTFXJTBegM2AHbz88RI1Y8TvX58oEXFffQhpdxTLKFLeRtT
         SMx5ggLTlVtn46pz7l5BN7sfStduAJc5MoptYDcsRuuVyihHPwWa8R59vJxT0FH+Rqku
         ViMb5Jf7TpyfJUZ3N67YfnlyXUU5esxev1jlyPhKAcHcC6FgTYHCUJ2uJqQiJugAZoHs
         gI4A==
X-Gm-Message-State: AOAM530dl36K3ezdfZ0F2RH1LK1csLesuHVuXKTB+qfCQtbk/aSRkIQ9
	X5hVarng8uEHoyngOaJNiNw9GZS5Pg6NIG3PhXoUfO44huSBiy3mYAcQ/THJPY6+6iU8mdo99Wd
	4KQpU1OQRTc4uhdbEx+zDDLcGVJF97y6n+qYbKRgseoBJQD3Sv6WM6dUmiZigIACwHfU=
X-Received: by 2002:a17:90b:3901:: with SMTP id ob1mr6721583pjb.12.1634822178606;
        Thu, 21 Oct 2021 06:16:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5iVyGxRTN0pHKt4mU4+0wZuofqt5cgBgG55bqC3W0IrmPE+4M8k1NLz+0UT7HY00o75RYXw==
X-Received: by 2002:a17:90b:3901:: with SMTP id ob1mr6721560pjb.12.1634822178381;
        Thu, 21 Oct 2021 06:16:18 -0700 (PDT)
Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id i12sm6028374pfo.126.2021.10.21.06.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 06:16:18 -0700 (PDT)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: meta-arago@lists.yoctoproject.org
Cc: Nikhil Devshatwar <nikhil.nd@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denis@denix.org>,
	Sinthu Raja <sinthu.raja@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [meta-arago][dunfell/master][PATCH V4 2/2] packagegroups: tisdk-connectivity: package intel-9260 linux firmware images
Date: Thu, 21 Oct 2021 18:45:59 +0530
Message-Id: <20211021131559.16817-3-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021131559.16817-1-sinthu.raja@ti.com>
References: <20211021131559.16817-1-sinthu.raja@ti.com>
MIME-Version: 1.0
X-BESS-ID: 1634822179-304003-5436-12892-1
X-BESS-VER: 2019.1_20211019.2112
X-BESS-Apparent-Source-IP: 209.85.215.198
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.235307 [from 
	cloudscan17-159.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit

From: Sinthu Raja <sinthu.raja@ti.com>

Package linux-firmware-iwlwifi-9260 and linux-firmware-ibt-18 containing
firmware for Intel 9260 (WLAN and BT)

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 1eb0e072..98a1dacf 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wireless packages into the target FS"
 LICENSE = "MIT"
-PR = "r41"
+PR = "r42"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -18,6 +18,7 @@ WLAN_COMMON = "\
     linux-firmware-iwlwifi-8000c \
     linux-firmware-iwlwifi-8265 \
     linux-firmware-iwlwifi-3160-17 \
+    linux-firmware-iwlwifi-9260 \
 "
 
 WLAN_TI = "\
@@ -42,6 +43,7 @@ BT_COMMON = "\
     pulseaudio-module-bluez5-discover \
     pulseaudio-lib-bluez5-util \
     sbc \
+    linux-firmware-ibt-18 \
 "
 
 BT_TI = "\
-- 
2.31.1

