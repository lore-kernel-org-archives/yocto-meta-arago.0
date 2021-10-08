Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from egress-ip4b.ess.de.barracuda.com
	(egress-ip4b.ess.de.barracuda.com [18.185.115.208])
	by arago-project.org (Postfix) with ESMTPS id 38CFE52C3A
	for <meta-arago@arago-project.org>;
	Fri,  8 Oct 2021 08:06:36 +0000 (UTC)
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
	[209.85.210.199]) by
	mx-outbound16-186.eu-central-1b.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 08 Oct 2021 08:06:58 +0000
Received: by mail-pf1-f199.google.com with SMTP id
	q10-20020a056a00084a00b0044c729ea8f2so3454119pfk.3
	for <meta-arago@arago-project.org>;
	Fri, 08 Oct 2021 01:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wX2fpYE8zZnmLBkS+yuTrGi+yRCW6OfsKLsrAOM8+RQ=;
	b=EHhPAQvbQXRb5lBbrlyhUm4W+QISeCLNQ4hFSOASKleh5YEpZnzUPmH95fx1kauHbN
	TslR/tFgfFSgkc3eQ2VTEuygmaq4jTJaKEJZhbUn5JHwYFRcXC8QhfX9E61We+vsu0HC
	2X2z8SQ1ViuXhlCgVxJ5bwkQJKEBxrJ9ph4bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wX2fpYE8zZnmLBkS+yuTrGi+yRCW6OfsKLsrAOM8+RQ=;
	b=cTgJX+Bx7X4Z0WSrme912G7oBWHlAY9g+T7ffCAHLu78mMFi8HWgyoapLdyz2FQu5z
	gHeDa+6O4opCJ+ypRNgDg3b2WWAHrCA9VkRzcb3Wz0rKXBbmKe9N8Rcen3/NKFsKPbXP
	jKtaY+JcMu8PL6b7lj7Tdf5DNFVz51asxn9za0Qtrqr2baQUAxathXsZyPYkpRcUv+F+
	hFP+txDbKf0QmtKcpn8rDKLMtRjScsAJiYdocYK8QBqbv6ppMtHGGi7OYTAqjg4MDI6C
	QXBmCk/JESLVypNMQ+EUX5nhbrc5hfTJ114Cb4DdPnk0TEwXIjqH0/U+KZI6+PaxCFxe
	YiRQ==
X-Gm-Message-State: AOAM5308GfjfU5IUAzzzdTp7RwGORGx+jMxrHfF7amHn/RdCS688H9m1
	WJsmOsX72nBWnmbwAm1w6YydmKJUUdP1rGIKnUs3F5A9Ph4wMhtii/HN8YkYhS6akhZV9WWy2lH
	80yRj4tiUWaZhTl6CD/8MgW2fYY2QdutSJFtHAghLcyBlx5jjkvMEPBBvenzy
X-Received: by 2002:a63:ec57:: with SMTP id r23mr3472843pgj.17.1633680417673; 
	Fri, 08 Oct 2021 01:06:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZocYP+8uJtQQfpWo9aOR7WYQxaxPaI0cbH5mDkcjo0GIEbu6Z5Pppbz5USJwdtKuHTLDLEA==
X-Received: by 2002:a63:ec57:: with SMTP id r23mr3472827pgj.17.1633680417416; 
	Fri, 08 Oct 2021 01:06:57 -0700 (PDT)
Received: from LAP568U.mistral.in ([106.51.227.150])
	by smtp.gmail.com with ESMTPSA id t2sm10393328pjf.1.2021.10.08.01.06.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 08 Oct 2021 01:06:57 -0700 (PDT)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: meta-arago@arago-project.org
Date: Fri,  8 Oct 2021 13:36:32 +0530
Message-Id: <20211008080632.22629-3-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008080632.22629-1-sinthu.raja@ti.com>
References: <20211008080632.22629-1-sinthu.raja@ti.com>
MIME-Version: 1.0
X-BESS-ID: 1633680418-304282-5453-2808-1
X-BESS-VER: 2019.1_20211006.2200
X-BESS-Apparent-Source-IP: 209.85.210.199
X-BESS-Outbound-Spam-Score: 0.40
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.235005 [from 
	cloudscan21-208.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.40 BSF_SC0_SA085b         META: Custom Rule SA085b 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.40 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_SC0_SA085b, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: Sinthu Raja <sinthu.raja@ti.com>
Subject: [dunfell/master][PATCH V2 2/2] linux-firmware: Package intel 9260 WiFi and BT firmware
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
X-List-Received-Date: Fri, 08 Oct 2021 08:06:37 -0000
Content-Transfer-Encoding: 8bit

From: Sinthu Raja <sinthu.raja@ti.com>

The Intel 9260 WiFi and BT firmware is already part of the linux-firmware
repository, so package it to make it available.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---

Changes in V2:
Addressed review comments that includes
* update the commit messsage
* removed machine specific changes and made it generic.

V1: https://serenity.dal.design.ti.com/patchwork/project/meta-arago/patch/20211007140939.19819-3-sinthu.raja@ti.com/

 .../linux-firmware/linux-firmware_%.bbappend       | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
index 146596ad..f1420d4c 100644
--- a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
@@ -1,4 +1,16 @@
-PR_append = ".arago0"
+PR_append = ".arago1"
+
+PACKAGES_prepend = "${PN}-iwlwifi-9260"
+PACKAGES_prepend = "${PN}-ibt-18"
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


