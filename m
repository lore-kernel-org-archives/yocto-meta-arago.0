Received: from egress-ip33b.ess.de.barracuda.com (egress-ip33b.ess.de.barracuda.com [18.185.115.237])
 by mx.groups.io with SMTP id smtpd.web09.12199.1635255731823168645
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Oct 2021 06:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=fYHHC5V1;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.237, mailfrom: priya.ns@mistralsolutions.com)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69]) by mx-outbound23-90.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 26 Oct 2021 13:42:08 +0000
Received: by mail-pj1-f69.google.com with SMTP id r7-20020a17090a454700b001a1ca0191b8so9172967pjm.4
        for <meta-arago@lists.yoctoproject.org>; Tue, 26 Oct 2021 06:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wxdAQd8HJJ18aGrWb7zgdTPwopd3z6motkeFpJkMaQQ=;
        b=fYHHC5V1Ovq0t3Q/9q+W9gBb/jDJHC9GtoyEHOjzY/MkTWqlwOjcAMuZtYir7N2UGn
         XYaGdhSuq6BWl4DuLCKx9fCy9J8SdagYx8/a12ThJgrZGHVpG+sX22/27QRXb2xvM/SC
         HJT5FhoBb6V/Rtw48GMmAsEmSGzfb0wLHmJUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wxdAQd8HJJ18aGrWb7zgdTPwopd3z6motkeFpJkMaQQ=;
        b=ezw/XgPMw3RHYDR2PndUehTYZOERW5svfpG8Po123CGcN1EWQXaFnE/h8P301RdTMh
         Bhfgs6XEZabXLQ8b0PPdvTgBm5xZrj6fu5JKHIwM/I5iEdNPTdkRDV3JTpJegtE3NiLW
         1cM+/At9EDHJwsjcK0ZhivQ2f7hiyMs9IciW8/skURNMkvt+h0NXzwPjaUx0vGTIoZYw
         cY9rrM3VyyhdDr0iH7rIwO+KYE219adm24cBqsY+WZjCZx6Rbaunk/N9GwzLB17zjZ+n
         MMyt4JmwJCrpq6zBYgXluRXBWtR0qlnR13l/3sAZw/mVOCQakvvlhjhzmdijGWJh7Uzb
         cLxA==
X-Gm-Message-State: AOAM533X+cYTQ3ElplDkHpHxUY/ukBALlkD3CP13YWGxqcu9pWnm9+4M
	Nd/gwTEBnvgP3WqsdQZ5aaaKCosojixRLhvLVswhPMMMV4qanDPhyHnjCIqVSGkHpBU/bnTRzLh
	/aV0tbyD9KLkSxjLh2qXOsYgUwoVrYivnoHEAEUiR/CdP5+RX4VA+6nfoYej+JwzEVS4=
X-Received: by 2002:a17:903:1207:b0:138:e2f9:6c98 with SMTP id l7-20020a170903120700b00138e2f96c98mr23238740plh.11.1635255727349;
        Tue, 26 Oct 2021 06:42:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJ4QrshvnPQKs0JXtfUVx5glj/l8M9+CGGM9gtnWraVBDhIJNlO3g+WCPshgXz6Du4Chw9qQ==
X-Received: by 2002:a17:903:1207:b0:138:e2f9:6c98 with SMTP id l7-20020a170903120700b00138e2f96c98mr23238710plh.11.1635255727036;
        Tue, 26 Oct 2021 06:42:07 -0700 (PDT)
Return-Path: <priya.ns@mistralsolutions.com>
Received: from LAP000507.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id k1sm867050pjj.54.2021.10.26.06.42.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Oct 2021 06:42:06 -0700 (PDT)
From: "Priya N S" <priya.ns@mistralsolutions.com>
X-Google-Original-From: Priya N S <priya.ns@ti.com>
To: meta-arago@lists.yoctoproject.org
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Sekhar Nori <nsekhar@ti.com>,
	Priya N S <priya.ns@ti.com>
Subject: [meta-arago] [dunfell PATCH 1/2] wayland: weston: Disable weston systemd service
Date: Tue, 26 Oct 2021 19:11:44 +0530
Message-Id: <20211026134145.57608-2-priya.ns@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
In-Reply-To: <20211026134145.57608-1-priya.ns@ti.com>
References: <20211026134145.57608-1-priya.ns@ti.com>
MIME-Version: 1.0
X-BESS-ID: 1635255728-305978-5438-13348-1
X-BESS-VER: 2019.1_20211021.1606
X-BESS-Apparent-Source-IP: 209.85.216.69
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.235420 [from 
	cloudscan9-86.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit

Disable the weston systemd service since there is a weston initscript
that performs touchscreen calibration and other customizations.

Signed-off-by: Priya N S <priya.ns@ti.com>
---
 .../recipes-graphics/wayland/weston-init.bbappend            | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
index 55b191ef..5ac8b6d0 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = ".arago10"
+PR_append = ".arago11"
 
 SRC_URI_append = " \
     file://runWeston \
@@ -11,10 +11,13 @@ SRC_URI_append = " \
 do_install_append() {
     install -d ${D}${bindir}
     install -m 755 ${WORKDIR}/runWeston ${D}${bindir}
+    rm -rf ${D}${systemd_system_unitdir}
 
     install -d ${D}${sysconfdir}/profile.d
     install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}
     install -m 0644 ${WORKDIR}/wayland_env.sh ${D}${sysconfdir}/profile.d/
 }
 
+FILES_${PN}_remove = "${systemd_system_unitdir}/weston@.service"
 FILES_${PN} += "${sysconfdir}/profile.d/* ${sysconfdir}/weston.ini"
+SYSTEMD_SERVICE_${PN}_remove = "weston@%i.service"
-- 
2.19.1.windows.1

