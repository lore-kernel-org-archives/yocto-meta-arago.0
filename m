Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from egress-ip4b.ess.de.barracuda.com
	(egress-ip4b.ess.de.barracuda.com [18.185.115.208])
	by arago-project.org (Postfix) with ESMTPS id E166952B43
	for <meta-arago@arago-project.org>;
	Thu,  7 Oct 2021 14:09:35 +0000 (UTC)
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
	[209.85.210.200]) by
	mx-outbound16-152.eu-central-1b.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 07 Oct 2021 14:10:15 +0000
Received: by mail-pf1-f200.google.com with SMTP id
	h7-20020a056a001a4700b0044bae446a52so3030781pfv.16
	for <meta-arago@arago-project.org>;
	Thu, 07 Oct 2021 07:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=v7xNXipG3DY7c1yU5PatWggLtXiEVSQwm8KaF++baLs=;
	b=abAwXqpoRKZ7Adgii4eu+YSkZBQdcn4+9s9yAXzjCjDYjFG9RpIU7LPS9KSD5KXhl1
	x1ZhXspu7DAZkmXZUelOZcuO5slt2d0NHL0++a7hV5umCywK04qPf1D5+KxLU4u4xw0M
	D/IIJXi/fWsK/9qgVFrL428L1UisJX6WnLa1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=v7xNXipG3DY7c1yU5PatWggLtXiEVSQwm8KaF++baLs=;
	b=g/AneNkizqKPcT+o5SBcMo+iz8HJCT22+UxnpuKqASTRCqexpSlh1nyx4LgMpJM5TS
	oxmGaWM3npu+Jw9ngXVZgRQxRvJZonnqqpAzEGKt4arsIBzNfCxMrGRE5dpYj/0TAJVe
	wVb1TXVIenPRuHglpQN/X2v6VDIWPMSQ1q7AD+hk3HQvrGcIi1oWAWe1rC4RwneB1w0j
	MvDEi0cc7ULhzHLTCQAsfJQMgfFnOs0pW3P+xQaScn0fXgVZl6aL8RJfX6RlY0R5JmMe
	yhHGZjhlsr5PIRHebbOlRnE6bsrKumPpW7faAtz486g8pKLfuZawxnisFb75XgMvDotM
	K0YQ==
X-Gm-Message-State: AOAM533a5f89ASUjUvTC76+2p3WRAIFIGKgldCZIbnUs4bTQmADHuVk5
	WkkXNMyVGu+vp3LjQvfVM94Le5AfUxSN4X5lnr7iWf8d+46jz5RNxwc6C+xNZ290wwZK5CSiFdQ
	eggXTiTcEzv5EV58yZYEgQ8X3TAMmQLVWaENi9ieWrZbgnJB2b+PYmldshUOT
X-Received: by 2002:a65:62cb:: with SMTP id m11mr3558967pgv.425.1633615814158; 
	Thu, 07 Oct 2021 07:10:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvHEFQ4K0hlWtacHqSSpUbqan7nhcIbYHVxFalXvhIqKoHNDG291tPSpYvzn1FR0XlN2chmg==
X-Received: by 2002:a65:62cb:: with SMTP id m11mr3558953pgv.425.1633615813952; 
	Thu, 07 Oct 2021 07:10:13 -0700 (PDT)
Received: from LAP568U.mistral.in ([106.51.227.150])
	by smtp.gmail.com with ESMTPSA id
	k14sm25123758pga.65.2021.10.07.07.10.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Oct 2021 07:10:13 -0700 (PDT)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  7 Oct 2021 19:39:39 +0530
Message-Id: <20211007140939.19819-3-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007140939.19819-1-sinthu.raja@ti.com>
References: <20211007140939.19819-1-sinthu.raja@ti.com>
MIME-Version: 1.0
X-BESS-ID: 1633615814-304248-5481-18511-1
X-BESS-VER: 2019.1_20211006.2200
X-BESS-Apparent-Source-IP: 209.85.210.200
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.234990 [from 
	cloudscan17-226.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.50 BSF_RULE_7582B         META: Custom Rule 7582B 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_RULE_7582B, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: Sinthu Raja <sinthu.raja@ti.com>
Subject: [dunfell/master][PATCH 2/2] linux-firmware: Package intel 9260 WiFi and BT firmware
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Oct 2021 14:09:36 -0000
Content-Transfer-Encoding: 8bit

From: Sinthu Raja <sinthu.raja@ti.com>

The Intel 9260 WiFi and BT firmware is already part of the linux-firmware
repository.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
 .../linux-firmware/linux-firmware_%.bbappend       | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
index 146596ad..2e2ab1c4 100644
--- a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
@@ -1,4 +1,16 @@
-PR_append = ".arago0"
+PR_append = ".arago1"
+
+PACKAGES_prepend_j7-evm =+ "${PN}-iwlwifi-9260"
+PACKAGES_prepend_j7-evm =+ "${PN}-ibt-18"
+
+LICENSE_${PN}-iwlwifi-9260 =+ "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-ibt-18 =+ "Firmware-ibt_firmware"
+
+FILES_${PN}-iwlwifi-9260 =+ "${nonarch_base_libdir}/firmware/iwlwifi-9260-*.ucode"
+FILES_${PN}-ibt-18 =+ "${nonarch_base_libdir}/firmware/intel/ibt-18-*.sfi ${nonarch_base_libdir}/firmware/intel/ibt-18-*.ddc"
+
+RDEPENDS_${PN}-iwlwifi-9260 =+ "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-ibt-18 =+ "${PN}-ibt-license"
 
 do_install_append() {
 	rm -rf  ${D}/lib/firmware/ti-connectivity/
-- 
2.31.1


